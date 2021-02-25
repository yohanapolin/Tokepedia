from django.contrib import admin
from django.urls import path, include
from . import views
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from carts import viewset_api

app_name ='cart'
urlpatterns = [
    
    path('add_cart', views.add_to_cart),
    path('cart-list', views.cart_home, name='home'),
    path('update/', views.cart_update, name='update'),
    path('checkout', views.checkout, name='checkout'),
    
]
