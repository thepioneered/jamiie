from rest_framework import serializers
from .models import *
#create your serializers here 


class CreatePoolDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = CreatePool
        fields = ['poolId','poolName','contributionAmount','joinedMember','poolType','totalMember']