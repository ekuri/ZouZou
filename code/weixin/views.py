from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

import urllib, urllib2
import hashlib, json

@csrf_exempt
def accessInterface(request):
    echostr = request.GET.get('echostr', '')
    timestamp = request.GET.get('timestamp', '')
    nonce = request.GET.get('nonce', '')
    signature = request.GET.get('signature', '')
    if checkSignature(signature, 'dengyh', timestamp, nonce):
        return HttpResponse(echostr)
    else:
        return HttpResponse('Can not access Weixin interface')

def checkSignature(signature, token, timestamp, nonce):
    tmpArr = [token, timestamp, nonce]
    tmpArr = sorted(tmpArr)
    tmpStr = ''.join(tmpArr)
    sha1Str = hashlib.sha1(tmpStr).hexdigest()
    if signature == sha1Str:
        return True
    else:
        return False
