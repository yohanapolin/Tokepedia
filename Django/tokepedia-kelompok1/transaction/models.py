from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class PaymentType(models.Model):
    payment_name = models.CharField(max_length=20)
    payment_method = models.CharField(max_length=20)
    
    def __str_(self):
        return self.payment_name

class Payment(models.Model):
    payment_type = models.ForeignKey(PaymentType, on_delete=models.CASCADE, blank=True, null=True)
    amount = models.IntegerField(null=True)

    def __str_(self):
        return self.payment_type

