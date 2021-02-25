from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from users import viewset_api

urlpatterns = [
    path('customers/', viewset_api.ProfileList, name="users"),
	path('customers/<int:pk>/profile-data', viewset_api.profiledetail, name="profile-detail"),
	path('customers/<int:pk>/add-address', viewset_api.addAddress, name="add-data"),
	path('customers/<int:pk>/edit-profile', viewset_api.editProfile, name="modify-data"),
    path('customers/<int:pk>/delete-profile', viewset_api.profiledelete, name="delete-data"),
    
    path('users', viewset_api.listuser, name="list-user"),
    path('users/add', viewset_api.adduser, name="add-user"),
    path('users/<pk>/change', viewset_api.updateuser, name="update-user"),
    path('users/<pk>/remove', viewset_api.deleteuser, name="delete-user"),

    path('profile-collection-api', viewset_api.apiOverviewProfile, name="api-overview"),
    path('account-collection-api', viewset_api.apiOverviewAccount, name="api-overview"),
]
