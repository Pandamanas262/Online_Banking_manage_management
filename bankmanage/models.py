from django.db import models
from django.db.models.deletion import CASCADE


# Create your models here.
class Users(models.Model):
    userid = models.CharField(primary_key=True, max_length=20)
    pwd = models.CharField(max_length=20)

    class Meta:
        db_table = "users"


class Customer(models.Model):
    id = models.AutoField(primary_key=True)
    cname = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    gender = models.CharField(max_length=15)
    dob = models.DateField()
    adhar = models.CharField(max_length=12)
    phone = models.CharField(max_length=10)
    email = models.CharField(max_length=35)
    pic = models.ImageField(upload_to='cpics', default='noimage.png')
    netbanking = models.BooleanField(default=False)

    class Meta:
        db_table = "customers"


class NetBankingUser(models.Model):
    userid = models.CharField(primary_key=True, max_length=30)
    pwd = models.CharField(max_length=20)
    active = models.BooleanField(default=True)
    locked = models.BooleanField(default=False)
    attempts = models.IntegerField(default=3)
    customer = models.ForeignKey(to=Customer, on_delete=models.CASCADE)
    last_login = models.DateTimeField(null=True)
    next_login = models.DateTimeField(null=True)

    class Meta:
        db_table = "nbusers"


class Account(models.Model):
    accno = models.IntegerField(primary_key=True)
    bal = models.DecimalField(decimal_places=2, max_digits=14)
    actype = models.CharField(max_length=20)
    active = models.BooleanField()
    customer = models.ForeignKey(to=Customer, on_delete=models.CASCADE)
    dcardno = models.CharField(max_length=16, null=True, unique=True)
    dcardlimit = models.IntegerField(default=0)

    class Meta:
        db_table = "accounts"


class Beneficiary(models.Model):
    id = models.AutoField(primary_key=True)
    bname = models.CharField(max_length=30, null=True)
    accno = models.IntegerField(null=True)
    maxlimit = models.DecimalField(decimal_places=2, max_digits=12, null=True)
    customer = models.ForeignKey(to=Customer, on_delete=CASCADE)
    bankname = models.CharField(max_length=30, null=True)
    banktype = models.CharField(max_length=20, null=True)  # same bank | other bank
    ifsc = models.CharField(max_length=15, null=True)

    class Meta:
        db_table = "beneficiary"
        ordering = ["-id"]


class Transactions(models.Model):
    id = models.AutoField(primary_key=True)
    account = models.ForeignKey(to=Account, on_delete=models.CASCADE)
    tdate = models.DateField(auto_now=True)
    descr = models.CharField(max_length=50)
    cramt = models.DecimalField(max_digits=14, decimal_places=2, null=True)
    dramt = models.DecimalField(max_digits=14, decimal_places=2, null=True)

    class Meta:
        db_table = "transactions"
        ordering = ["-id"]


class Insurance(models.Model):
    id = models.IntegerField(primary_key=True)
    cname = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    gender = models.CharField(max_length=15)
    email = models.CharField(max_length=50)
    phone = models.CharField(max_length=10)
    dob = models.CharField(max_length=50)
    father = models.CharField(max_length=50)
    maritalstatus = models.CharField(max_length=20)
    insurancetype = models.CharField(max_length=20)
    suminsured = models.DecimalField(max_digits=14, decimal_places=2)
    duration = models.IntegerField()
    premium = models.DecimalField(max_digits=14, decimal_places=2)
    premiumtype = models.CharField(max_length=20)
    nomineename = models.CharField(max_length=30)
    nomineerelation = models.CharField(max_length=30)
    nomineeage = models.IntegerField()

    class Meta:
        db_table = "insurances"

