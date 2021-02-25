from carts.models import *
from rest_framework import serializers

class cart_itemSerializer(serializers.ModelSerializer):
    class Meta:
        model = cart_item
        fields = ['id','user', 'ordered', 'products', 'quantity', 'subtotal', 'total', 'updated', 'timestamp' ]

class cartSerializer(serializers.ModelSerializer):
    class Meta:
        model = cart_item
        fields = ['id','user',  'products']
class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = cart_item
        fields = ['user', 'ref_code', 'items', 'start_date', 'ordered_date', 'ordered', 'received' ]

