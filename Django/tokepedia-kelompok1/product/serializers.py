from product.models import *
from rest_framework import serializers

class ProductsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Products
        fields = ['id', 'name', 'price_per_unit', 'stock', 'description']

class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ['id', 'brand_name']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'category_name']

class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = comment
        fields = '__all__'

class ReplyCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = reply_comment
        fields = ['id', 'comment_id', 'user_reply_id', 'reply_comment']

    

