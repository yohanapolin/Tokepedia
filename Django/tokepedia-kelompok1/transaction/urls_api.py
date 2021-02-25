from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from transaction import viewset_api

urlpatterns = [
    path('payment/payment-list', viewset_api.paymentList, name="payment"),
	path('payment/<int:pk>/detail-payment', viewset_api.paymentDetail, name="detail-payment"),
	path('payment/add-payment', viewset_api.addPayment, name="add-payment"),
	path('payment/<int:pk>/edit-payment', viewset_api.editPayment, name="edit-payment"),
	path('payment/<int:pk>/delete-payment', viewset_api.deletePayment, name="delete-payment"),

	path('payment/payment-type', viewset_api.paymentType, name="payment-type"),
	path('payment/<int:pk>/detail-payment-type', viewset_api.paymentTypeDetail, name="detail-payment-type"),
	path('payment/add-payment-type', viewset_api.addPaymentType, name="add-payment-type"),
	path('payment/<int:pk>/edit-payment-type', viewset_api.editPaymentType, name="edit-payment-type"),
	path('payment/<int:pk>/delete-payment-type', viewset_api.deletePaymentType, name="delete-payment-type"),

	path('payment-collection-api', viewset_api.apiOverviewPayment, name="api-overview"),
]
