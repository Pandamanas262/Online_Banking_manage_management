"""Online_Banking_Management_System URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static,settings
from bankmanage import views

urlpatterns = [
    path('',views.homepage),
    path('login/',views.loginpage),
    path('dashboard/',views.dashboard),
    path('customers/',views.customerslist),
    path('addcustomer/',views.addcustomer),
    path('editcustomer/<int:cid>',views.editcustomer),
    path('accounts/',views.accountlist),
    path('deposit/',views.deposit),
    path('withdraw/',views.withdraw),
    path('passbook/',views.passbook),
    path('reports/',views.reports),
    path('addaccount/',views.addaccount),
    path('editaccount/<int:accno>',views.editaccount),
    path('insurances/',views.insurancelist),
    path('users/',views.listusers),
    path('addinsurance/',views.addinsurance),
    path('policydetails/<int:id>',views.policydetails),
    path('nbrequest/<int:id>',views.netbankingrequest),
    path('changepwd/',views.changepwd),
    path('cchangepwd/',views.custchangepwd),
    path('cdashboard/',views.customerdashboard),
    path('cpassbook/',views.custpassbook),
    path('cbeneficiary/',views.custbeneficiary),
    path('bendelete/<int:id>',views.deletebeneficiary),
    path('ctransfer/',views.custtransfer),
    path('nblogin/',views.nblogin),
    path('logout/',views.logout),
    path('admin/', admin.site.urls),
]

urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
