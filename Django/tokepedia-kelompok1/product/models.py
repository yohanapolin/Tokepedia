from django.db import models
from django.contrib.auth.models import User


class Category(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    category_name = models.CharField(max_length=50, blank=True, null=True)

    def __str_(self):
        return self.category_name

class Brand(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    brand_name = models.CharField(max_length=50, blank=True, null=True)

    def __str_(self):
        return self.brand_name

    # class Meta:
    #     db_table = 'brand'

class Products(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=50, blank=True, null=True)
    brand_name = models.ForeignKey(Brand, on_delete=models.CASCADE, blank=True, null=True)
    price_per_unit = models.IntegerField(blank=True, null=True)
    stock = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    image = models.ImageField(upload_to='img', blank=True, null=True)
    category_id = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True)
    slug = models.SlugField(unique=False)
    # category_id = models.ForeignKey(Category, models.DO_NOTHING, db_column='category_id', blank=True, null=True)

    def __str_(self):
        return self.name

    # class Meta:
    #     db_table = 'products'

class comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Products,  on_delete=models.CASCADE)
    comment = models.TextField()

class reply_comment(models.Model):
    comment_id = models.ForeignKey(comment,  on_delete=models.CASCADE)
    reply_comment = models.TextField()
    user_reply_id = models.ForeignKey(User,  on_delete=models.CASCADE)