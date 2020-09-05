"""practiceapi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from .views import *

urlpatterns = [
    path('createpool',CreatePoolApi.as_view(),name='create pool'),
    path('joinpool',JoinPoolApi.as_view(),name = 'join pool'),
    path('searchpool',SearchPoolApi.as_view(), name = 'search pool'),
    path('createpooldetail/<int:id>/',CreatePoolDetailApi.as_view(),name = 'create pool'),
    path('poolusers/<str:id>/',PoolUsersDetailApi.as_view(), name='pool users detail'),
    path('pooldetails',PoolDetailsAdminApi.as_view(), name = 'pool detail admin'),
    path('pooldetail/<str:id>/',PoolDetailApi.as_view(), name = 'pool detail'),
    path('singlepool/<str:id>/',SinglePoolDetailApi.as_view(),name = 'single pool'),
    path('adminsinglepool/<str:id>/',AdminSinglePoolDetailApi.as_view(),name = 'Admin single pool'),
    path('notification',NotificationApi.as_view(), name = 'Notification'),
]