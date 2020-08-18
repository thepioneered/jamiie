from rest_framework import serializers
from .models import *
#create your serializers here 
class SearchPoolSeriailzier(serializers.Serializer):
    poolid = models.CharField()
    poolname = models.CharField()
    poolowner = models.ForeignKey(User,on_delete=models.CASCADE)
    poolamount = models.FloatField()
    maxmember = models.IntegerField()
    joinedmember = models.IntegerField()
    deadline = models.CharField()
