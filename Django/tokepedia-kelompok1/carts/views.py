from django.shortcuts import render
from toped.models import *
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.contrib.auth.models import User
from product.models import Products
from .models import cart_item, Order
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, DetailView, View
from users.views import session
from django.http import JsonResponse
from django.shortcuts import redirect
# Create your views here.



@login_required(login_url=settings.LOGIN_URL)
def cart(request):
    request.user.is_authenticated
    carts = cart_item.objects.all()
    user=request.user
    konteks = { 
        'cart':carts,
        'user' :user
        #'logIn': request.session['logIn'],
    }
    return render(request, 'cart.html', konteks)

    

@login_required
def add_to_cart(request):

    if request.user.is_authenticated:
        product_id = request.POST.get('products_id')
        product_obj = Products.objects.get(id=product_id)
        cart_item.objects.create(
        #user = request.POST.get('id'),
        user=request.user,
        products= product_obj,
        quantity = request.POST.get('quantity'))
        return HttpResponseRedirect("/cart")
    else:
        return HttpResponseRedirect("/")

    
    


def cart(request):
    prod = cart_item.objects.filter(user=request.user)
    context = {
        'Prod':prod,
    }
    return render(request, 'cart.html',context)

def cart_home(request):
    cart_obj, new_obj = cart_item.objects.new_or_get(request)
    return render(request, "cart.html", {"cart_item": cart_obj})

### test 1

def cart_detail_api_view(request):
    cart_obj, new_obj = cart_item.objects.new_or_get(request)
    products = [{
            "id": x.id,
            "url": x.get_absolute_url(),
            "name": x.name, 
            "price": x.price
            } 
            for x in cart_obj.products.all()]
    cart_data  = {"products": products, "subtotal": cart_obj.subtotal, "total": cart_obj.total}
    return JsonResponse(cart_data)


@login_required
def cart_update(request):
    
    product_id = request.POST.get('product_id')
    
    if product_id is not None:
        try:
            product_obj = Products.objects.get(id=product_id)
        except Product.DoesNotExist:
            print("Show message to user, product is gone?")
            return redirect("cart:home")
        cart_obj, new_obj = cart_item.objects.new_or_get(request)
        if product_obj in cart_obj.products.all():
            cart_obj.products.remove(product_obj)
            added = False
        else:
            cart_obj.products.add(product_obj) # cart_obj.products.add(product_id)
            added = True
        #request.session['cart_items'] = cart_obj.products.count()
        # return redirect(product_obj.get_absolute_url())
        if request.is_ajax(): # Asynchronous JavaScript And XML / JSON
            print("Ajax request")
            json_data = {
                "added": added,
                "removed": not added,
                "cartItemCount": cart_obj.products.count()
            }
            return JsonResponse(json_data, status=200) # HttpResponse
            # return JsonResponse({"message": "Error 400"}, status=400) # Django Rest Framework
    return redirect("cart:home")

def checkout(request):
    return render(request,'checkout.html')