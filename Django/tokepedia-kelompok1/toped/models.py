from django.db import models
from product.models import Products, Brand, Category
from django.contrib.auth.models import User

# Create your models here.

class history(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    customer_id = models.CharField(max_length=50)
    payment_id = models.CharField(max_length=50)
    time = models.TimeField()
    date = models.DateField()
    payment_method = models.CharField(max_length=50, null=True)
    total_cost = models.BigIntegerField(null=True)
    delivery = models.BigIntegerField(null=True)	
    price = models.BigIntegerField(null=True)
    name = models.CharField(max_length=100, null=True)
    adress = models.CharField(max_length=100, null=True)
    product_name = models.CharField(max_length=50)
    image = models.CharField(max_length=100, null=True)
    def _str_(self):
        return self.id

'''class brand(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    name = models.CharField(max_length=20)
    def __str__(self):
        return self.name
    
class category(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    name = models.CharField(max_length=20)
    def __str__(self):
        return self.name'''
     

'''
class payment(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    payment_type = models.CharField(max_length=100)
    amount = models.IntegerField(null=True)
    def __str__(self):
        return self.id

'''

'''class products(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    name_product = models.CharField(max_length=100)
    price = models.BigIntegerField(null=True)
    Desc_product = models.CharField(max_length=1000)
    img_product = models.ImageField(null = True)
    brand_id = models.ForeignKey(brand,on_delete=models.CASCADE,null=True)
    category_id = models.ForeignKey(category,on_delete=models.CASCADE,null=True)
    def __str__(self):
        return self.name_product'''
'''
class rating(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    comment = models.CharField(max_length=1000)
    rate = models.IntegerField(null=True)
    customer_id = models.ForeignKey(customer,on_delete=models.CASCADE,null=True )
    products_id = models.ForeignKey(Products, on_delete=models.CASCADE,null=True )
    def __str__(self):
        return self.id


class checkout(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    time = models.TimeField()
    date = models.DateField()
    cart_id = models.ForeignKey(cart,on_delete=models.CASCADE,null=True)
    payment_id = models.ForeignKey(payment,on_delete=models.CASCADE,null=True)
    def __str__(self):
        return self.id '''

'''class brand_category(models.Model):
    id = models.CharField(max_length=50,primary_key=True)
    brand_id = models.ForeignKey(brand,on_delete=models.CASCADE,null=True)
    category_id = models.ForeignKey(category,on_delete=models.CASCADE,null=True)
    def __str__(self):
        return self.id'''
    