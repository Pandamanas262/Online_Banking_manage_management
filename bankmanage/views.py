import random, pytz
from django.shortcuts import render, redirect
from bankmanage.models import *
from django.contrib import messages
from django.db.models import Max, Sum
from datetime import datetime, timedelta
from django.core.mail import send_mail


# Create your views here.
from bankmanage.send_email import sendmail


def homepage(req):
    if (req.method == "POST"):
        cname = req.POST.get('name')
        city = req.POST.get('address')
        phone = req.POST.get('phone')
        email = req.POST.get('email')
        gender = req.POST.get('gender')
        dob = req.POST.get('dob')
        photo = req.FILES.get('photo')
        customer = Customer(cname=cname, address=city, email=email, phone=phone, gender=gender, dob=dob)
        if photo is not None:
            customer.pic = photo
        customer.save()
        messages.success(req, 'Registration Successfully')
        return redirect("/")
    return render(req, "home.html")


def loginpage(req):
    if (req.method == 'POST'):
        userid = req.POST.get("userid")
        pwd = req.POST.get("pwd")
        user = Users.objects.filter(userid=userid, pwd=pwd)
        print(user)
        if len(user) > 0:
            req.session["userid"] = user[0].userid
            return redirect('/dashboard')
        else:
            messages.success(req, "Invalid username or password")
            return redirect("/login")
    return render(req, "login2.html")


def customerslist(req):
    customers = Customer.objects.all()
    return render(req, "customers.html", locals())


def accountlist(req):
    accounts = Account.objects.all()
    return render(req, "accounts.html", locals())


def nblogin(req):
    if req.method == "POST":
        userid = req.POST.get("userid")
        pwd = req.POST.get("pwd")
        nbresult = NetBankingUser.objects.filter(userid=userid)
        if len(nbresult) == 0:
            messages.error(req, 'Incorrect username')
            return redirect("/")
        else:
            nbuser = nbresult[0]
            if nbuser.locked and nbuser.next_login > pytz.utc.localize(datetime.now()):
                messages.error(req, f'Your account has been locked.')
                return redirect("/")
            else:
                if (nbuser.pwd == pwd):
                    nbuser.last_login = datetime.now()
                    nbuser.attempts = 3
                    nbuser.save()
                    req.session["userid"] = userid
                    req.session["uname"] = nbuser.customer.cname
                    return redirect("/cdashboard")
                else:
                    if nbuser.attempts > 0:
                        nbuser.attempts -= 1
                        nbuser.save()
                        messages.error(req, f'Incorrect password. Attemps remaining. {nbuser.attempts}')
                    else:
                        nbuser.next_login = datetime.now() + timedelta(minutes=10)
                        nbuser.locked = True
                        nbuser.save()
                        messages.error(req, f'Your account has been locked for 10 minutes.')
                    return redirect("/")


def customerdashboard(req):
    nbuser = NetBankingUser.objects.get(pk=req.session["userid"])
    acc = Account.objects.filter(customer=nbuser.customer)[0]
    return render(req, "cdashboard.html", locals())


def custpassbook(req):
    userid = req.session["userid"]
    customer = Customer.objects.filter(email=userid)
    acc = Account.objects.filter(customer=customer[0])[0]
    trans = Transactions.objects.filter(account=acc)
    return render(req, "cpassbook.html", locals())


def custchangepwd(req):
    if (req.method == "POST"):
        userid = req.session["userid"]
        user = NetBankingUser.objects.get(pk=userid)
        if (user.pwd == req.POST.get("opwd")):
            user.pwd = req.POST.get("pwd")
            user.save()
            messages.success(req, "Password updated successfully")
        else:
            messages.error(req, "Incorrect current password")
        return redirect("/cchangepwd")
    return render(req, "cchangepwd.html", locals())


def custtransfer(req):
    nbuser = NetBankingUser.objects.get(pk=req.session["userid"])
    if req.method == "POST":
        print(req.POST)
        bid = req.POST.get("bid")
        dramount = int(req.POST.get("amount"))
        bf = Beneficiary.objects.get(pk=bid)
        account = Account.objects.filter(customer=nbuser.customer)[0]
        account.bal = account.bal - dramount
        account.save()
        tran = Transactions(account=account, dramt=dramount, descr=f'Transfer to {bf.bname}')
        tran.save()
        messages.success(req, "Transfer completed successfully")
        return redirect("/ctransfer")
    blist = Beneficiary.objects.filter(customer=nbuser.customer)
    return render(req, "ctransfer.html", locals())


def custbeneficiary(req):
    nbuser = NetBankingUser.objects.get(pk=req.session["userid"])
    if (req.method == "POST"):
        bname = req.POST.get("bname")
        customer = nbuser.customer
        accno = req.POST.get("accno")
        ifsc = req.POST.get("ifsc")
        banktype = req.POST.get("banktype")
        bankname = req.POST.get("bankname")
        maxlimit = req.POST.get("maxlimit")
        bf = Beneficiary(bname=bname, customer=customer, ifsc=ifsc, accno=accno, banktype=banktype, bankname=bankname,
                         maxlimit=maxlimit)
        bf.save()
        messages.success(req, "Beneficiary saved successfully")
        return redirect("/cbeneficiary")
    blist = Beneficiary.objects.filter(customer=nbuser.customer)
    return render(req, "cbeneficiary.html", locals())


def deletebeneficiary(req, id):
    bf = Beneficiary.objects.get(pk=id)
    bf.delete()
    messages.success(req, "Beneficiary deleted successfully")
    return redirect("/cbeneficiary")


def addaccount(req):
    if (req.method == "POST"):
        accno = req.POST.get("accno")
        customer = Customer.objects.get(pk=req.POST.get("cid"))
        actype = req.POST.get("actype")
        bal = req.POST.get("bal")
        account = Account(accno=accno, customer=customer, actype=actype, bal=bal, active=True)
        account.save()
        tran = Transactions(account=account, descr='Account Open', cramt=bal)
        tran.save()
        messages.success(req, "Account opened successfully")
        return redirect("/accounts")
    accno = 10001 if Account.objects.count() == 0 else Account.objects.aggregate(max=Max('accno'))["max"] + 1
    clist = Customer.objects.raw("select * from customers where id not in(select customer_id from accounts)")
    return render(req, "addaccount.html", locals())


def editaccount(req, accno):
    if req.method == "POST":
        print("Active", req.POST)
        account = Account.objects.get(pk=accno)
        if req.POST.get("active") is None:
            account.active = False
        else:
            account.active = True
        account.save()
        messages.success(req, "Account details updated successfully")
        return redirect("/accounts")
    acc = Account.objects.get(pk=accno)
    nbuser = NetBankingUser.objects.filter(customer=acc.customer)
    if len(nbuser) == 0:
        nbfacility = True
    else:
        nb = nbuser[0]
    return render(req, "editaccount.html", locals())


def specific_string():
    sample_string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$_'  # define the specific string
    # define the condition for random string
    result = ''.join((random.choice(sample_string)) for x in range(15))
    print(" Randomly generated string is: ", result)
    return result


def addcustomer(req):
    if (req.method == "POST"):
        cname = req.POST.get('name')
        city = req.POST.get('city')
        phone = req.POST.get('phone')
        email = req.POST.get('email')
        gender = req.POST.get('gender')
        dob = req.POST.get('dob')
        photo = req.FILES.get('photo')
        customer = Customer(cname=cname, address=city, email=email, phone=phone, gender=gender, dob=dob)
        if photo is not None:
            customer.pic = photo
        customer.save()
        messages.success(req, 'Customer Added Successfully')
        return redirect('/customers')
    return render(req, "addcustomer.html", locals())


def listusers(req):
    users = NetBankingUser.objects.all()
    return render(req, "users.html", locals())


def editcustomer(req, cid):
    if (req.method == "POST"):
        cid = req.POST.get('custid')
        customer = Customer.objects.get(pk=cid)
        customer.cname = req.POST.get('name')
        customer.address = req.POST.get('city')
        customer.phone = req.POST.get('phone')
        customer.email = req.POST.get('email')
        customer.gender = req.POST.get('gender')
        customer.dob = req.POST.get('dob')
        customer.save()
        messages.success(req, 'Customer Updated Successfully')
        return redirect('/customers')
    c = Customer.objects.get(pk=cid)
    nb = NetBankingUser.objects.filter(customer=c)
    if len(nb) == 1:
        nbuser = nb[0]
    return render(req, "edit-customer.html", locals())


def netbankingrequest(req, id):
    customer = Customer.objects.get(pk=id)
    userid = customer.email
    pwd = specific_string()
    nb = NetBankingUser(userid=userid, pwd=pwd, customer=customer)
    nb.save()
    sendmail(userid, pwd, "Net Banking Request")
    messages.success(req, "Net Banking requested successfully")
    return redirect("/users")


def deposit(req):
    if (req.method == "POST"):
        accno = req.POST.get("accno")
        cramt = req.POST.get("cramt")
        account = Account.objects.get(pk=accno)
        account.bal = account.bal + int(cramt)
        account.save()
        tran = Transactions(account=account, descr='Account Deposit', cramt=cramt)
        tran.save()
        messages.success(req, "Deposited successfully")
        return redirect("/accounts")
    accno = req.GET.get("accno")
    if (accno is not None):
        account = Account.objects.filter(accno=accno)
        search = True
        if (len(account) > 0):
            acc = account[0]
            found = True
        else:
            found = False
    else:
        accno = ''
    return render(req, "deposit.html", locals())


def withdraw(req):
    if (req.method == "POST"):
        accno = req.POST.get("accno")
        dramt = req.POST.get("dramt")
        account = Account.objects.get(pk=accno)
        account.bal = account.bal - int(dramt)
        account.save()
        tran = Transactions(account=account, descr='Account Withdraw', dramt=dramt)
        tran.save()
        messages.success(req, "Withdraw successfully")
        return redirect("/accounts")
    accno = req.GET.get("accno")
    if (accno is not None):
        account = Account.objects.filter(accno=accno)
        search = True
        if (len(account) > 0):
            acc = account[0]
            found = True
        else:
            found = False
    else:
        accno = ''
    return render(req, "withdraw.html", locals())


def passbook(req):
    accno = req.GET.get("accno")
    if (accno is not None):
        account = Account.objects.filter(accno=accno)
        search = True
        if (len(account) > 0):
            acc = account[0]
            trans = Transactions.objects.filter(account=acc)
            found = True
        else:
            found = False
    else:
        accno = ''
    return render(req, "passbook.html", locals())


def reports(req):
    trans = Transactions.objects.all()
    return render(req, "reports.html", locals())


def insurancelist(req):
    ilist = Insurance.objects.all()
    return render(req, "insurances.html", locals())


def addinsurance(req):
    if (req.method == "POST"):
        id = req.POST.get('id')
        cname = req.POST.get('name')
        city = req.POST.get('city')
        phone = req.POST.get('phone')
        email = req.POST.get('email')
        gender = req.POST.get('gender')
        dob = req.POST.get('dob')
        duration = req.POST.get("duration")
        suminsured = req.POST.get("suminsured")
        premium = req.POST.get("premium")
        premiumtype = req.POST.get("premiumtype")
        father = req.POST.get('father')
        insurancetype = req.POST.get("policytype")
        maritalstatus = req.POST.get('mstatus')
        nomineename = req.POST.get('nomineename')
        nomineerelation = req.POST.get('nomineerelation')
        nomineeage = req.POST.get('nomineeage')
        ins = Insurance(id=id, cname=cname, address=city, email=email, phone=phone, gender=gender, father=father,
                        dob=dob, maritalstatus=maritalstatus, nomineename=nomineename, nomineeage=nomineeage,
                        nomineerelation=nomineerelation, insurancetype=insurancetype, suminsured=suminsured,
                        premium=premium, premiumtype=premiumtype, duration=duration)
        ins.save()
        messages.success(req, 'Insurance Added Successfully')
        return redirect('/insurances')
    id = 1001 if Insurance.objects.count() == 0 else int(Insurance.objects.aggregate(id=Max('id'))['id']) + 1
    policies = ('Life Insurance', 'Medical Insurance', 'Vehicle Insurance')
    return render(req, "addinsurance.html", locals())


def policydetails(req, id):
    c = Insurance.objects.get(pk=id)
    return render(req, "policydetails.html", locals())


def dashboard(req):
    totalcustomers = Customer.objects.count()
    totalaccounts = Account.objects.count()
    totalinsurances = Insurance.objects.count()
    totalcrs = Transactions.objects.filter().aggregate(total=Sum('cramt'))["total"]
    totaldrs = Transactions.objects.filter().aggregate(total=Sum('dramt'))["total"]
    totalcollection = totalcrs - totaldrs
    return render(req, "dashboard.html", locals())


def changepwd(req):
    if (req.method == "POST"):
        userid = req.session["userid"]
        user = Users.objects.get(pk=userid)
        if (user.pwd == req.POST.get("opwd")):
            user.pwd = req.POST.get("pwd")
            user.save()
            messages.success(req, "Password updated successfully")
        else:
            messages.error(req, "Incorrect current password")

    return render(req, "changepwd.html", locals())


def logout(req):
    req.session.clear()
    return redirect("/")