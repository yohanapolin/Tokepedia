from django.contrib import admin
from django.urls import path, include
from . import views
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from carts import viewset_api

app_name ='cart'
urlpatterns = [   
    
    path('carts/list', viewset_api.cartlist, name="carts"),
	path('carts/<int:pk>/cart-detail', viewset_api.cartdetail, name="carts-detail"),
	path('carts/add-cart', viewset_api.addcart, name="cart-create"),
	path('carts/<int:pk>/update-quantity', viewset_api.cartupdate, name="cart-update"),
	path('carts/<int:pk>/remove-cart', viewset_api.cartdelete, name="cart-delete"),
    path('carts/<int:pk>/<str:id_product>/remove-cart', viewset_api.productcartdelete, name="cart-delete"),
	path('carts/<product_id>/<cart_id>/add-to-cart', viewset_api.addproductcart, name ='add to carts'),
	path('carts/<product_id>/<cart_id>/delete-product', viewset_api.productcartdelete),
    path('cart-collection-api/', viewset_api.apiOverviewCart, name="api-overview"),

]
