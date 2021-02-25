from django.db import models
from product.models import Products, Brand, Category
from toped.models import *
from django.conf import settings
from django.contrib.auth.models import User
from decimal import Decimal
from django.db.models.signals import pre_save, post_save, m2m_changed


# Create your models here.
class CartManager(models.Manager):
    def new_or_get(self, request):

        cart_id = request.session.get("cart_id", None)
        qs = self.get_queryset().filter(id=cart_id)
        if qs.count() == 1:
            new_obj = False
            cart_obj = qs.first()
            if request.user.is_authenticated and cart_obj.user is None:
                cart_obj.user = request.user
                cart_obj.save()
        else:
            cart_obj = cart_item.objects.new(user=request.user)
            new_obj = True
            request.session['cart_id'] = cart_obj.id
        return cart_obj, new_obj

    def new(self, user=None):
        user_obj = None
        if user is not None:
            if user.is_authenticated :
                user_obj = user
        return self.model.objects.create(user=user_obj)

class cart_item(models.Model):
    user        = models.ForeignKey(User,  null=True, blank=True, on_delete=models.CASCADE)
    ordered     = models.BooleanField(default=False )
    products    = models.ManyToManyField(Products,  blank=True)
    quantity    = models.IntegerField(default=1)
    subtotal    = models.IntegerField(default=0)
    total       = models.IntegerField(default=0)
    updated     = models.DateTimeField(auto_now=True)
    timestamp   = models.DateTimeField(auto_now_add=True)
    objects     = CartManager()
    def __str__(self):
        return str(self.id)

    def get_total_item_price(self):
        return self.quantity * self.products.price

    def get_final_price(self):
        return self.get_total_item_price()

def m2m_changed_cart_receiver(sender, instance, action, *args, **kwargs):
    if action == 'post_add' or action == 'post_remove' or action == 'post_clear':
        products = instance.products.all()
        total = 0
        for x in products:
            total += x.price_per_unit
        if instance.subtotal != total:
            instance.subtotal = total
            instance.save()
m2m_changed.connect(m2m_changed_cart_receiver, sender=cart_item.products.through)



def pre_save_cart_receiver(sender, instance, *args, **kwargs):
    if instance.subtotal > 0:
        instance.total = instance.subtotal + 20000 # 8% tax
    else:
        instance.total = 0.00

pre_save.connect(pre_save_cart_receiver, sender=cart_item)




class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    ref_code = models.CharField(max_length=20, blank=True, null=True)
    items = models.ManyToManyField(cart_item)
    start_date = models.DateTimeField(auto_now_add=True)
    ordered_date = models.DateTimeField()
    ordered = models.BooleanField(default=False)
    received = models.BooleanField(default=False)


    def __str__(self):
        return self.user.username

    def get_total(self):
        total = 0
        for order_item in self.items.all():
            total += order_item.get_final_price
        return total
 