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
            poolOwner = data['poolOwner']
            poolName =  data['poolName']
            poolAmount = data['poolAmount']
            deadline = data['deadline']
            poolType = data['poolType']
            minMember = data['minMember']
            maxMember = data['maxMember']
            poolOwner = User.objects.get(phone = poolOwner)
            poolId = uniqueid()
            obj = CreatePool.objects.create(poolId=poolId, poolOwner = poolOwner, poolName = poolName, poolAmount = poolAmount, deadline = deadline, poolType = poolType, minMember = minMember,maxMember=maxMember)
            JoinPool.objects.create(poolId=obj, memberId=poolOwner)
            obj.joinedMember = obj.joinedMember+1
            obj.save()
            return Response({'poolId':poolId},status=status.HTTP_200_OK)
        except Exception as e:
            print(e)

class JoinPoolApi(APIView):
    authentication_classes=[TokenAuthentication]
    permission_classes = [IsAuthenticated]
    def post(self,request):
        try:
            data = request.data
            poolId = data['poolId']
            memberId = data['memberId']
            if CreatePool.objects.filter(poolId=poolId).exists() and User.objects.filter(phone=memberId).exists():
                pool = CreatePool.objects.get(poolId=poolId)
                member = User.objects.get(phone=memberId)
                if JoinPool.objects.filter(poolId=pool, memberId=member):
                    return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)
                elif pool.maxMember == pool.joinedMember:
                    return Response({'error':'pool filled'},status=status.HTTP_401_UNAUTHORIZED)   
                else:
                    create_member = JoinPool.objects.create(poolId=pool, memberId=member)
                    pool.joinedMember = pool.joinedMember + 1 
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
            poolId = data['poolid']
            if CreatePool.objects.filter(poolId=poolId).exists():
                pool = CreatePool.objects.get(poolId=poolId)
                phone = pool.poolOwner
                poolOwner = User.objects.get(phone=phone)
                return_response = {'poolId':pool.poolId,'poolName':pool.poolName,'poolOwner':poolOwner.phone,'poolAmount':pool.poolAmount,'maxMember':pool.maxMember,'joinedMember':pool.joinedMember,'deadline':pool.deadline}
                return Response(return_response, status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            print(e)