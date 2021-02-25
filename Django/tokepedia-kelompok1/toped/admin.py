from django.contrib import admin
from toped.models import *
# Register your models here


'''

class Product(admin.ModelAdmin):
    list_display =['id', 'name_product', 'price','Desc_product','img_product','brand_id' ,'category_id']
    search_fields =  ['id', 'name_product', 'price','Desc_product','img_product','brand_id' ,'category_id']
    list_per_page = 4

class Customer(admin.ModelAdmin):
    list_display =['id', 'password', 'name','contact_num','email_Address','home_Address']
    search_fields =['name']
    list_per_page = 4

class Brand(admin.ModelAdmin):
    list_display =['id','name']
    search_fields =['name']
    list_per_page = 4

class Category(admin.ModelAdmin):
    list_display =['id','name']
    search_fields =['name']
    list_per_page = 4

class Payment(admin.ModelAdmin):
    list_display =['id','payment_type','amount']
    search_fields =['id']
    list_per_page = 4

class Transaction(admin.ModelAdmin):
    list_display=['id','customer_id','payment_id','time','date']
    search_fields =['id']
    list_per_page = 4

class Cart(admin.ModelAdmin):
    list_display=['id','total_cost','cart_item_id']
    search_fields =['id']
    list_per_page = 4

class Checkout(admin.ModelAdmin):
    list_display=['id','time','date','cart_id','payment_id']
    search_fields =['id']
    list_per_page = 4

class BrandCategory(admin.ModelAdmin):
    list_display=['id', 'brand_id','category_id']
    search_fields =['id']
    list_per_page = 4

class Rating(admin.ModelAdmin):
    list_display=['id','comment','rate','customer_id', 'product_id']
    search_fields =['id']
    list_per_page = 4

#admin.site.register(cart, Cart)

#admin.site.register(products, Product)
#admin.site.register(brand, Brand)
##admin.site.register(customer, Customer)
admin.site.register(checkout, Checkout)
admin.site.register(payment, Payment)
#admin.site.register(rating, Rating)
admin.site.register(transaction, Transaction)
#admin.site.register(brand_category, BrandCategory)'''