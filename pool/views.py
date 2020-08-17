from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import *
import hashlib
import time
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
# Create your views here.

def uniqueid():
    milli_sec = str(round(time.time() * 1000))
    hashed_val = hashlib.sha256(milli_sec.encode())
    milli_sec  = hashed_val.hexdigest()
    value = str(milli_sec[:8])
    return value

class CreatePoolApi(APIView):
    authentication_classes = [TokenAuthentication]
    permission_classes=[IsAuthenticated] 
    def post(self,request):
        data = request.data
        poolowner = data['poolowner']
        poolname =  data['poolname']
        poolamount = data['poolamount']
        deadline = data['deadline']
        pooltype = data['pooltype']
        minmember = data['minmember']
        maxmember = data['maxmember']
        poolowner = User.objects.get(phone = poolowner)
        poolid = uniqueid()
        try:
            obj = CreatePool.objects.create(poolid=poolid, poolowner = poolowner, poolname = poolname, poolamount = poolamount, deadline = deadline, pooltype = pooltype, minmember = minmember,maxmember=maxmember)
            return Response({'poolid':poolid},status=status.HTTP_200_OK)
        except Exception as e:
            print(e)