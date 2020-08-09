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


#OTP GENERATOR
def otpGenerator():
    otp = random.randrange(10000,100000)
    return otp

class Phone(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        data = request.data
        phone = data["phone"]
        if OTP.objects.filter(phone=phone).exists():
            user_instance = OTP.objects.get(phone=phone)
            if user_instance.validated == True:
                return Response(status = status.HTTP_409_CONFLICT)
            else:
                otp = otpGenerator()
                user_instance.otp = otp
                user_instance.save()
                account_sid = 'AC682a134035589f334183428895b1bbe2'
                auth_token = 'd0334f39bc9f3a6294aca45badc2ba55'
                client = Client(account_sid, auth_token)
                message = client.messages \
                       .create(
                           body="Your otp number is "+str(otp),
                          from_='+18123704981',
                          to=str(phone)
                      )
                print(message.sid)
                return Response(status=status.HTTP_200_OK)
        else:
            otp = otpGenerator()
            OTP.objects.create(phone=phone, otp = otp, validated=False)
            '''
            Otp service created here using AWS SNS
            +18123704981
            '''
            account_sid = 'AC682a134035589f334183428895b1bbe2'
            auth_token = 'd0334f39bc9f3a6294aca45badc2ba55'
            client = Client(account_sid, auth_token)
            message = client.messages \
                    .create(
                        body="Your otp number is "+str(otp),
                        from_='+18123704981',
                        to=str(phone)
                    )
            print(message.sid)
            return Response(status=status.HTTP_200_OK)       

class PhoneVerification(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        data = request.data
        phone = data["phone"]
        otp = data["otp"]
        user = OTP.objects.get(phone=phone)
        if user.otp == otp:
            user.validated=True
            user.save()
            return Response(status = status.HTTP_200_OK)
        else:
            return Response (status = status.HTTP_401_UNAUTHORIZED)

class resendotp(APIView):  
    authentication_classes = []
    permission_classes=[]  
    def post(self,request):
        data = request.data
        phone = data["phone"]
        user_instance = OTP.objects.get(phone=phone)
        if user_instance.validated == False:
            otp = otpGenerator()
            user_instance.otp = otp
            user_instance.save()
            account_sid = 'AC682a134035589f334183428895b1bbe2'
            auth_token = 'd0334f39bc9f3a6294aca45badc2ba55'
            client = Client(account_sid, auth_token)
            message = client.messages \
                    .create(
                        body="Your otp number is "+str(otp),
                        from_='+18123704981',
                        to=str(phone)
                    )
            print(message.sid)
            return Response(status=status.HTTP_200_OK)  
        else: 
            return Response(status=status.HTTP_302_FOUND)

class Register(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        serializer = RegisterSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_401_UNAUTHORIZED)

class Login(APIView):
    authentication_classes = []
    permission_classes=[] 
    def post(self,request):
        value = request.data
        phone  = value["phone"]
        password = value["password"]
        user = User.objects.get(phone = phone)
        if user is not None:
            real_password = user.password
            if password == real_password:
                token, created = Token.objects.get_or_create(user=user)
                return Response({'token': token.key},status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(status=status.HTTP_404_NOT_FOUND)

class ForgotPassword(APIView):
    authentication_classes = []
    permission_classes=[]
    def post(self,request,):
        data = request.data
        phone = data["phone"]
        user = OTP.objects.get(phone=phone)
        otp = otpGenerator()
        user.otp = otp
        user.save()
        account_sid = 'AC682a134035589f334183428895b1bbe2'
        auth_token = 'd0334f39bc9f3a6294aca45badc2ba55'
        client = Client(account_sid, auth_token)
        message = client.messages \
                .create(
                    body="Your otp number is "+str(otp),                        
                    from_='+18123704981',
                    to=str(phone)
                )
        print(message.sid)
        return Response(status=status.HTTP_200_OK) 
    def put(self,request,id):
        data = request.data
        phone = id
        password = data["password"]
        user = User.objects.get(phone=phone)
        user.set_password(password)
        user.save()
        return Response(status=status.HTTP_200_OK)

class Logout(APIView):
    authentication_classes = []
    permission_classes=[]
    def post(self, request):
        data = request.data
        phone = data["phone"]
        user = User.objects.get(phone=phone) 
        user = Token.objects.get(user=user)
        user.delete()
        return Response(status=status.HTTP_200_OK)