from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import *
import random
import boto3
from twilio.rest import Client
from rest_framework import status
from .models import *
#Create your views here.
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.hashers import check_password
from django.http import HttpResponse
import json
from dotenv import load_dotenv
from pathlib import Path
import os
env_file = Path('.') / '.env'
load_dotenv(dotenv_path=env_file)


#OTP GENERATOR
def otpGenerator():
    otp = random.randrange(10000,100000)
    return otp

class Phone(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        try:
            data = request.data
            phone = data["phone"]
            if OTP.objects.filter(phone=phone).exists():
                user_instance = OTP.objects.get(phone=phone)
                if user_instance.validated == True and user_instance.register==True:
                    return Response({'response':'User already exists'},status = status.HTTP_409_CONFLICT)
                else:
                    otp = otpGenerator()
                    user_instance.otp = otp
                    user_instance.save()
                    account_sid = os.getenv('ACCOUNT_SID')
                    auth_token = os.getenv('AUTH')
                    client = Client(account_sid, auth_token)
                    message = client.messages \
                        .create(
                            body="Your otp number is "+str(otp),
                            from_=os.getenv('FROM_NUMBER'),
                            to=str(phone)
                        )
                    print(message.sid)
                    return Response(status=status.HTTP_201_CREATED)
            else:
                otp = otpGenerator()
                OTP.objects.create(phone=phone, otp = otp, validated=False)
                '''
                Otp service created here using AWS SNS
                +18123704981
                '''
                account_sid = os.getenv('ACCOUNT_SID')
                auth_token = os.getenv('AUTH_TOKEN')
                client = Client(account_sid, auth_token)
                message = client.messages \
                        .create(
                            body="Your otp number is "+str(otp),
                            from_=os.getenv('FROM_NUMBER'),
                            to=str(phone)
                        )
                print(message.sid)
                return Response(status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)       

class PhoneVerification(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        try:
            data = request.data
            phone = data["phone"]
            otp = data["otp"]
            user = OTP.objects.get(phone=phone)
            if user.otp == otp:
                user.validated=True
                user.save()
                return Response(status = status.HTTP_201_CREATED)
            else:
                return Response ({'response':'Invalid authorization code'},status = status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            print(e)

class ResendOtp(APIView):  
    authentication_classes = []
    permission_classes=[]  
    def post(self,request):
        try:
            data = request.data
            phone = data["phone"]
            user_instance = OTP.objects.get(phone=phone)
            if user_instance.validated == False:
                otp = otpGenerator()
                user_instance.otp = otp
                user_instance.save()
                account_sid = os.getenv('ACCOUNT_SID')
                auth_token = os.getenv('AUTH_TOKEN')
                client = Client(account_sid, auth_token)
                message = client.messages \
                        .create(
                            body="Your otp number is "+str(otp),
                            from_=os.getenv('FROM_NUMBER'),
                            to=str(phone)
                        )
                print(message.sid)
                return Response(status=status.HTTP_201_CREATED)  
            else: 
                return Response(status=status.HTTP_302_FOUND)
        except Exception as e:
            print(e)

class Register(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        try:
            data = request.data
            phone = data["phone"]
            serializer = RegisterSerializer(data = data)
            if serializer.is_valid():
                user = OTP.objects.get(phone=phone)
                user.register = True
                user.save()
                serializer.save()
                return Response(status=status.HTTP_201_CREATED)
            else:
                return Response(status=status.HTTP_406_NOT_ACCEPTABLE)
        except Exception as e:
            print(e)

class Login(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        try:
            value = request.data
            phone  = value["phone"]
            password = value["password"]
            if User.objects.filter(phone = phone).exists():
                user = User.objects.get(phone = phone)
                if user is not None:
                    real_password = user.password
                    if password == real_password:
                        token, created = Token.objects.get_or_create(user=user)
                        user.save()
                        completeProfile = User.objects.get(phone=phone).completeProfile
                        riskCalculator = UserInfo.objects.filter(phone=phone).exists()
                        return Response({'token': token.key,'completeProfile':completeProfile,'riskCalculator':riskCalculator},status=status.HTTP_200_OK)
                    else:
                        return Response({'response':'Wrong Credentials'},status=status.HTTP_401_UNAUTHORIZED)
                else:
                    return Response(status=status.HTTP_404_NOT_FOUND)        
            else:
                return Response({'response':'User does not exists'},status=status.HTTP_403_FORBIDDEN)
        except Exception as e:
            print(e)

class CompleteProfileApi(APIView):
    authentication_classes = []
    permission_classes=[]
    try:
        def post(self,request):
            data = request.data
            phone = data['phone']
            user = User.objects.get(phone=phone)
            user.image = data['image']
            user.street = data['street']
            user.city = data['city']
            user.state = data['state']
            user.zipCode = data['zipCode']
            user.addressAge = data['addressAge']
            user.DOB = data['DOB']
            user.securityNumber = data['securityNumber']
            user.employerName = data['employerName']
            user.employerAge = data['employerAge']
            user.completeProfile = True
            user.save()
            return Response(status = status.HTTP_201_CREATED)

    except Exception as e:
        print(e)

class ForgotPassword(APIView):
    authentication_classes = []
    permission_classes=[]
    def post(self,request,):
        try:
            data = request.data
            phone = data["phone"]
            if User.objects.filter(phone=phone).exists():
                user = OTP.objects.get(phone=phone)
                otp = otpGenerator()
                user.otp = otp
                user.save()
                account_sid = os.getenv('ACCOUNT_SID')
                auth_token = os.getenv('AUTH_TOKEN')
                client = Client(account_sid, auth_token)
                message = client.messages \
                        .create(
                            body="Your otp number is "+str(otp),                        
                            from_=os.getenv('FROM_NUMBER'),
                            to=str(phone)
                        )
                print(message.sid)
                return Response(status=status.HTTP_201_CREATED)
            else:
                return Response({'response':'User does not exists'},status=status.HTTP_403_FORBIDDEN)
        except Exception as e:
            print(e)        

    def put(self,request,id):
        try:
            data = request.data
            phone = "+"+str(id)
            password = data["password"]
            user = User.objects.get(phone=phone)
            user.password=password
            user.save()
            return Response(status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)

class Logout(APIView):
    authentication_classes = []
    permission_classes=[]
    def post(self, request):
        try:
            data = request.data
            phone = data["phone"]
            user = User.objects.get(phone=phone) 
            user = Token.objects.get(user=user)
            user.delete()
            return Response(status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)

class AdminLogin(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        try:
            value = request.data
            phone  = value["phone"]
            password = value["password"]
            user = User.objects.get(phone = phone)
            if user is not None:
                valid_password = check_password(password,user.password)
                if valid_password==True:
                    token, created = Token.objects.get_or_create(user=user)
                    return_data = {'name':user.name,'phone':user.phone,'email':user.email}
                    response = HttpResponse(json.dumps(return_data),status=status.HTTP_200_OK)
                    response.set_cookie(phone, value = token, max_age=None, expires=None, path='/', domain=None, secure=None, httponly=True, samesite='none')
                    return response
                else:
                    return Response(status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            print(e)

class AdminLogout(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self, request):
        try:
            val = request.COOKIES
            print("cookies=",val)
            count = 0
            for i in val:
                count=count+1
                if (count == 1):
                    user = User.objects.get(phone = i)
                    if Token.objects.filter(user=user).exists():
                        user_token = Token.objects.get(user=user)
                        user_cookies = request.COOKIES[i]
                        if str(user_token) == str(user_cookies):
                            user_token.delete()
                            response = HttpResponse(status = status.HTTP_200_OK)
                            response.delete_cookie(i)
                            return response
                        else:
                            return HttpResponse(status = status.HTTP_401_UNAUTHORIZED)
                    else:
                        return HttpResponse(status = status.HTTP_401_UNAUTHORIZED)
        except Exception as e:
            print(e)    

class Check(APIView):
    authentication_classes = []
    permission_classes = []
    def post(self,request):
        try:
            val = request.COOKIES
            count = 0
            for i in val:
                count=count+1
                if (count == 1):
                    user = User.objects.get(phone = i)
                    if Token.objects.filter(user=user).exists():
                        if str(Token.objects.get(user=user)) == str(request.COOKIES[i]):
                            return_data = {'name':user.name,'phone':user.phone,'email':user.email}
                            return HttpResponse(json.dumps(return_data),status = status.HTTP_200_OK)
                        else:
                            return HttpResponse(status = status.HTTP_401_UNAUTHORIZED)
                    else:
                        return HttpResponse(status = status.HTTP_401_UNAUTHORIZED)                  
        except Exception as e:
            print(e)

class ScoreCalculator(APIView):
    authentication_classes = []
    permission_classes = []
    def post(self,request):
        try:
            data  = request.data
            phone = data['phone']
            jobAge = data['jobAge']
            family = data['family']
            age = data['age']
            savingMoney = data['savingMoney']
            loans  = data['loans']
            living = data['living']
            jobAge = RiskCondition.objects.get(jobage=jobAge)
            family = RiskCondition.objects.get(family=family)
            age = RiskCondition.objects.get(age=age)
            savingMoney = RiskCondition.objects.get(savingmoney=savingMoney)
            loans = RiskCondition.objects.get(loans=loans)
            living = RiskCondition.objects.get(living=living)
            riskScore = jobAge.score + family.score + age.score + savingMoney.score + loans.score + living.score
            serializer = UserInfoSerializer(data = data)
            if serializer.is_valid():
                    serializer.save()
                    user = UserInfo.objects.get(phone=phone)
                    user.riskScore = riskScore
                    if riskScore >=24 and riskScore<=50:
                        user.riskBand = 'Risky'
                    elif riskScore >=51 and riskScore<=70:
                        user.riskBand = 'Moderate'
                    else:
                        user.riskBand = 'Low'
                    user.save()
                    return Response(status=status.HTTP_201_CREATED)
            else:
                return Response(status=status.HTTP_406_NOT_ACCEPTABLE)
        except Exception as e:
            print(e)        

class UserDataApi(APIView):
    authentication_classes = []
    permission_classes = []
    try:
        def get(self,request):
            usernames = [user.phone for user in User.objects.all()]
            return Response(usernames)
    
    except Exception as e:
        print(e)