from django.contrib import admin
from product.models import Products, Brand, Category

'''
class ProductsAdmin(admin.ModelAdmin):
    list_display = ['name', 'image',  'description']
    search_fields = ['name', 'image',  'description']
    # list_filter = ['kelompok_id']
    list_per_page = 10

admin.site.register(Products, ProductsAdmin)
admin.site.register(Brand)
admin.site.register(Category)'''
