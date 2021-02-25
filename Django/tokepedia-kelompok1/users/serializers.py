from users.models import *
from rest_framework import serializers    
from django.contrib.auth.models import User
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class profileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ['name', 'birth', 'email', 'address', 'phone_number']
        
class profileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ['name', 'birth', 'email', 'address', 'phone_number']