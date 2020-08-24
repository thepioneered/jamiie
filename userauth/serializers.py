from rest_framework import serializers
from .models import *
from django.contrib.auth import authenticate
from rest_framework import exceptions
from djoser.serializers import UserCreateSerializer, UserSerializer


class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('phone','password','email','name')

    def create(self,validated_data):
        user = super(RegisterSerializer,self).create(validated_data)
        user.password=validated_data['password']
        user.save()
        return user

class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserInfo
        fields = ('phone','jobAge','family','age','savingMoney','loans','living')
