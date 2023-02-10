from django.template.defaultfilters import register

@register.filter
def secretpass(value):
    first=value[0:2]
    secret=first+(len(value)-2)*'*'
    return secret