from django.db import models
from api.models import *
# Create your models here.
class CreatePool(models.Model):
    poolid = models.CharField(primary_key=True, unique=True, blank=False, null=False, max_length=255)
    poolowner = models.ForeignKey(User, related_name='poolowner', on_delete=models.CASCADE)
    poolname = models.CharField(blank=False,null=False,max_length=255)
    poolamount = models.FloatField(null=False)
    deadline = models.DateField()
    pooltype = models.CharField(null=False, max_length=255)
    minmember = models.IntegerField(null=False)
    maxmember = models.IntegerField(null=False)
    joinedmember = models.IntegerField(default=0)
    createdat = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        poolid = self.poolid
        return str(poolid)

class JoinPool(models.Model):
    poolid = models.ForeignKey(CreatePool, related_name='joinedpool', on_delete=models.CASCADE)
    memberid = models.ForeignKey(User, related_name='joinedmember', on_delete=models.CASCADE)
    joinedat = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        memberid = self.memberid
        return str(memberid)