from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import *
import hashlib
import time
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from .serializers import *
import json
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
        try:
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
            obj = CreatePool.objects.create(poolid=poolid, poolowner = poolowner, poolname = poolname, poolamount = poolamount, deadline = deadline, pooltype = pooltype, minmember = minmember,maxmember=maxmember)
            return Response({'poolid':poolid},status=status.HTTP_200_OK)
        except Exception as e:
            print(e)

class JoinPoolApi(APIView):
    authentication_classes=[TokenAuthentication]
    permission_classes = [IsAuthenticated]
    def post(self,request):
        try:
            data = request.data
            poolid = data['poolid']
            memberid = "+"+str(data['memberid'])
            if CreatePool.objects.filter(poolid=poolid).exists() and User.objects.filter(phone=memberid).exists():
                pool = CreatePool.objects.get(poolid=poolid)
                member = User.objects.get(phone=memberid)
                if JoinPool.objects.filter(poolid=pool, memberid=member):
                    return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)
                elif pool.maxmember == pool.joinedmember:
                    return Response({'error':'pool filled'},status=status.HTTP_401_UNAUTHORIZED)   
                else:
                    create_member = JoinPool.objects.create(poolid=pool, memberid=member)
                    pool.joinedmember = pool.joinedmember + 1 
                    pool.save()
                    return Response(status=status.HTTP_200_OK)

        except Exception as e:
            print(e)   

class SearchPoolApi(APIView):
    authentication_classes=[TokenAuthentication]
    permission_classes=[IsAuthenticated]
    def post(self,request):
        try:
            data = request.data
            poolid = data['poolid']
            if CreatePool.objects.filter(poolid=poolid).exists():
                pool = CreatePool.objects.get(poolid=poolid)
                phone = pool.poolowner
                poolowner = User.objects.get(phone=phone)
                return_response = {'poolid':pool.poolid,'poolname':pool.poolname,'poolowner':poolowner.phone,'poolamount':pool.poolamount,'maxmember':pool.maxmember,'joinedmember':pool.joinedmember,'deadline':pool.deadline}
                return Response(return_response, status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            print(e)