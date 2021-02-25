from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from product import viewset_api

urlpatterns = [
    path('products/list-product', viewset_api.productlist, name="products"),
	path('products/<str:pk>/detail-product/', viewset_api.productdetail, name="product-detail"),
	path('products/add-product', viewset_api.add_product, name="product-create"),
	path('products/<str:pk>/update-product', viewset_api.product_update, name="product-update"),
	path('products/<str:pk>/delete-product', viewset_api.delete_product, name="product-delete"),
	
	path('products/<str:pk>/list-comment-product', viewset_api.commentproductlist, name="products"),
	path('products/list-comment', viewset_api.commentlist, name="products"),
	path('products/add-comment', viewset_api.add_comment, name="product-create"),
	path('products/<str:pk>/<id_comment>/update-comment', viewset_api.commentupdate, name="product-update"),
	path('products/<str:pk>/<id_comment>/delete-comment', viewset_api.deletecomment, name="product-delete"),

	path('products/reply-list', viewset_api.repcommentlist, name="reply"),
	path('products/add-reply', viewset_api.addreply, name="add-reply"),
	path('products/<str:pk>/delete-reply', viewset_api.delete_reply, name="reply-delete"),
	path('products/<str:pk>/update-reply', viewset_api.reply_update, name="reply-update"),

	path('product-collection-api', viewset_api.apiOverviewProduct, name="api-overview"),
]
