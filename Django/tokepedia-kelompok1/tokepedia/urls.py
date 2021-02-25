"""tokepedia URL Configuration

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
from toped.views import *
from users.views import *
from carts.views import *
from product.views import *
from statistical.views import *
from rest_framework.authtoken import views

from product.viewset_api import * 
from carts.viewset_api import *
from users.viewset_api import *
from transaction.viewset_api import *
from rest_framework import routers


urlpatterns = [
    path('admin/', admin.site.urls),
    path('user/', include('users.urls')),
    path('', include('toped.urls')),
    path('cart/', include('carts.urls', namespace='cart')),
    path('product/' ,include('product.urls')),
    path('user/chart/', trans_chart.as_view(), name='chart'),
    path('transaction/', include('transaction.urls')),
    
    path('', include('carts.urls_api')),
    path('', include('transaction.urls_api')),
    path('', include('users.urls_api')),
    path('', include('product.urls_api')),


    #path('api/', include(router.urls))
    #path('api-auth/', include('rest_framework.urls'))
]
