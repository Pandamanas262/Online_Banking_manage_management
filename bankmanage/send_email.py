from __future__ import print_function
import time
import sib_api_v3_sdk
from sib_api_v3_sdk.rest import ApiException
from pprint import pprint

SENDEREMAIL = "bhuwanbhaskar761@gmail.com"

def sendmail(userid, pwd, subject):
    configuration = sib_api_v3_sdk.Configuration()
    configuration.api_key['api-key'] = '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'
    api_instance = sib_api_v3_sdk.TransactionalEmailsApi(sib_api_v3_sdk.ApiClient(configuration))
    html_content = "<html><body><h4>Your Net Banking request is processed successfully.</h4><h3>Your userid is "+str(userid)+"</h3><h3>Your Password is "+str(pwd)+"</h3><p>Please keep the userid and password confidential and change after login for security reasons.</p><p>Thanks and regards<br>Online Banking System.</p></body></html>"
    sender = {"name":"Banking System","email":SENDEREMAIL}
    to = [{"email":str(userid),"name":userid}]
    reply_to = {"email":SENDEREMAIL,"name":"Banking System"}
    headers = {"Some-Custom-Name":"unique-id-1234"}
    params = {"parameter":"My param value","subject":subject}
    send_smtp_email = sib_api_v3_sdk.SendSmtpEmail(to=to, reply_to=reply_to, headers=headers, html_content=html_content, sender=sender, subject=subject)

    try:
        api_response = api_instance.send_transac_email(send_smtp_email)
        pprint(api_response)
    except ApiException as e:
        print("Exception when calling SMTPApi->send_transac_email: %s\n" % e)