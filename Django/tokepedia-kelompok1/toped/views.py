from django.shortcuts import render
from toped.models import *
from product.models import Products
from django.views.generic import ListView, DetailView, View
# Create your views here.
'''
def cart(request):
    carts = cart_item.objects.all()
    konteks = { 
        'carts' : carts
    }
    return render(request, 'cart.html', konteks)
    
def checkout(request):
    return render(request, 'checkout.html')

def homepage(request):
    return render(request,'index.html')'''


#class HomeView(ListView):
#    model = Products
#    paginate_by = 10
#    template_name = "index.html"
def home(request):
    home1 = Products.objects.all()[:3]
    home2 = Products.objects.all()[4:7]

    konteks = {
        'home1': home1,
        'home2':home2,
    }
    return render(request, 'index.html', konteks)

    