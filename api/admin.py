from django.contrib import admin
from .models import *

# Register your models here.
class UserModel(admin.ModelAdmin):
    model = User
    list_display = ['phone','email','name','state','city','createdat','lastlogin']
admin.site.register(User, UserModel)
admin.site.register(OTP)