from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

def upload_image_to(instance, filename):
    import os
    from django.utils.timezone import now
    filename_base, filename_ext = os.path.splitext(filename)
    return 'ProfileImages/%s' % (
        instance.phone
    )

# Create your models here.
"""
User Registration and Login is started here...
"""
class UserManager(BaseUserManager):
    def create_user(self, phone, email, name, state, city,securityNumber, password=None, is_active = True, is_staff = False, is_admin = False):
        if not phone:
            raise ValueError("Phone number is required")
        if not password:
            raise ValueError("Password is required")
        user_obj = self.model(
            phone = phone,
            email = self.normalize_email(email),
            name=name,
            state = state,
            city = city,
            securityNumber = securityNumber
        )
        user_obj.set_password(password)
        user_obj.active = is_active
        user_obj.staff = is_staff
        user_obj.admin = is_admin
        user_obj.save(using = self._db)
        return user_obj
    

    def create_staffuser(self, phone, email, name, state, city, securityNumber, password=None):
        user = self.create_user(
            phone,
            email,
            name,
            state,
            city,
            securityNumber,
            password = password,
            is_staff= True
        )
        return user
    
    def create_superuser(self, phone, email, name, state, city, securityNumber, password=None):
        user = self.create_user(
            phone,
            email,
            name,
            state,
            city,
            securityNumber,
            password = password,
            is_staff= True,
            is_admin=True
        )
        return user

class User(AbstractBaseUser):
    phone = models.CharField( primary_key = True, max_length=255,unique=True, null=False, blank= False)
    email = models.EmailField(unique=True, null=False, blank = False)
    name = models.CharField(max_length=255, blank=False, null = False)
    street = models.CharField(max_length=255, blank=False, null = False)
    state = models.CharField(max_length=255, blank=False, null = False)
    city = models.CharField(max_length=255, blank=False, null = False)
    zipCode = models.CharField(max_length=20, blank=False, null = False)
    addressAge = models.CharField(max_length=6, blank=False, null = False)
    DOB = models.DateField(blank=True, null = True)
    employerName = models.CharField(max_length=255, blank=False, null = False)
    employerAge = models.CharField(max_length=6, blank=False, null = False)
    active = models.BooleanField(default=True)
    staff = models.BooleanField(default=False)
    admin = models.BooleanField(default=False)
    createdAt = models.DateTimeField(auto_now_add=True)
    lastLogin = models.DateTimeField(auto_now=True)
    securityNumber = models.CharField(unique=True,max_length=4, null=False, blank=False)
    completeProfile = models.BooleanField(default=False)
    image = models.ImageField(upload_to=upload_image_to, editable=True, null=False, blank=False)
    
    objects = UserManager()
    USERNAME_FIELD = 'phone'
    REQUIRED_FIELDS = ['email','name','state','city','securityNumber']

    def __str__(self):
        phone = self.phone
        return str(phone)

    def get_full_name(self):
        return self.name
    
    def get_short_name(self):
        return self.name

    @property
    def is_staff(self):
        return self.staff
    
    @property
    def is_active(self):
        return self.active

    @property
    def is_admin(self):
        return self.admin

    def has_perm(self, perm, obj=None):
        return self.admin

    def has_module_perms(self, app_label):
        return self.admin

class OTP(models.Model):
    phone = models.CharField(unique=True, max_length=255, blank=False, null=False)
    otp = models.CharField(max_length=255, unique=True)
    validated = models.BooleanField(blank=False, null=False)
    register = models.BooleanField(blank=False, null=False, default=False)

    def __str__(self):
        return self.phone

class RiskCondition(models.Model):
    jobAge = models.CharField(max_length=255)
    family = models.CharField(max_length=255)
    age = models.CharField(max_length=255)
    savingMoney = models.CharField(max_length=255)
    loans = models.CharField(max_length=255)
    living = models.CharField(max_length=255)
    score = models.IntegerField(blank=False, null=False)
    def __str__(self):
        score = self.score
        return 'score = '+str(score)

class UserInfo(models.Model):
    phone = models.ForeignKey(User, related_name='riskStatus', on_delete = models.CASCADE)
    # jobAge = models.CharField(max_length=255)
    # family = models.CharField(max_length=255)
    # age = models.CharField(max_length=255)
    # savingMoney = models.CharField(max_length=255)
    # loans = models.CharField(max_length=255)
    # living = models.CharField(max_length=255)
    riskScore = models.IntegerField(blank=False, null=True,default=56)
    riskBand = models.CharField(max_length=255,null=True,default="Moderate")

    def __str__(self):
        phone=self.phone
        return str(phone)

class Notification(models.Model):
    phone = models.ForeignKey(User, on_delete=models.CASCADE)
    mobileId = models.CharField(max_length=255, unique=True)

    def __str__(self):
        phone = self.phone
        return str(phone)