from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from users import viewset_api
from users import views

urlpatterns = [
    path('signup', views.signup),
    path('login', views.login),
    path('history/', views.history_trans),
    path('chart/', views.trans_chart.as_view(), name='chart'),
    path('profile/<id>', views.profile),
    path('editprofile/', views.editprofile),
    path('logout', views.logout),

]
