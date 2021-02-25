from django.shortcuts import render
from .models import Products, comment
from django.views.generic import ListView, DetailView, View
from users.views import session
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
#will be edited soon

def produk_search(request):
    search_name = request.GET['search']
    prod = Products.objects.filter(name__icontains = search_name)[:5]
    prod2 = Products.objects.filter(name__icontains = search_name)[3:8]
    context = {
        'Produk':prod,
        'Produk2': prod2,
        # 'username' :request.session['user'],
        # 'logIn': request.session['logIn'],
    }
    return render(request, 'BrandProduct/search.html',context)
def products(request):
    prodAsus = Products.objects.filter(brand_name='1')[:5]
    prodAsus2 = Products.objects.filter(brand_name='1')[3:8]

    context = {
        'Asusprod':prodAsus,
        'Asusprod2':prodAsus2,
    }
    return render(request, 'BrandProduct/search.html',context)

def detailAsus1(request):
    detailprod = Products.objects.all()[:1]

    context = {
        'Asusdetail':detailprod,

    }
    return render(request, 'BrandProduct/productpage.html',context)
#will be edited soon

#for product views
def productAsus(request):
    prodAsus = Products.objects.filter(brand_name='1')[:4]
    prodAsus2 = Products.objects.filter(brand_name='1')[4:8]

    context = {
        'Asusprod':prodAsus,
        'Asusprod2':prodAsus2,
    }
    return render(request, 'BrandProduct/Asus.html',context)

def productApple(request):
    prodApple = Products.objects.filter(brand_name='2')[:4]
    prodApple2 = Products.objects.filter(brand_name='2')[4:8]

    context = {
        'Appleprod':prodApple,
        'Appleprod2':prodApple2,
    }
    return render(request, 'BrandProduct/Apple.html',context)

def productSamsung(request):
    prodSamsung = Products.objects.filter(brand_name='3')[:4]
    prodSamsung2 = Products.objects.filter(brand_name='3')[4:8]

    context = {
        'Samsungprod':prodSamsung,
        'Samsungprod2':prodSamsung2,
    }
    return render(request, 'BrandProduct/Samsung.html',context)

def productHuawei(request):
    prodHuawei = Products.objects.filter(brand_name='4')[:4]
    prodHuawei2 = Products.objects.filter(brand_name='4')[4:8]

    context = {
        'Huaweiprod':prodHuawei,
        'Huaweiprod2':prodHuawei2,
    }
    return render(request, 'BrandProduct/Huawei.html',context)

def productLogitech(request):
    prodLogitech = Products.objects.filter(brand_name='5')[:4]
    prodLogitech2 = Products.objects.filter(brand_name='5')[4:8]

    context = {
        'Logitechprod':prodLogitech,
        'Logitechprod2':prodLogitech2,
    }
    return render(request, 'BrandProduct/Logitech.html',context)

def productKingston(request):
    prodKingston = Products.objects.filter(brand_name='6')[:4]
    prodKingston2 = Products.objects.filter(brand_name='6')[4:8]

    context = {
        'Kingstonprod':prodKingston,
        'Kingstonprod2':prodKingston2,
    }
    return render(request, 'BrandProduct/Kingston.html',context)

def categoryLaptop(request):
    Laptop = Products.objects.filter(category_id='1')[:4]
    LaptopCat = Products.objects.filter(category_id='1')[4:8]

    context = {
        'Claptop':Laptop,
        'Claptop2':LaptopCat,
    }
    return render(request, 'Category/Laptop.html',context)


def categorySmartphone(request):
    Smartphone = Products.objects.filter(category_id='2')[:4]
    SmartphoneCat = Products.objects.filter(category_id='2')[4:8]

    context = {
        'CSmartphone':Smartphone,
        'CSmartphone2':SmartphoneCat,
    }
    return render(request, 'Category/Smartphone.html',context)

def categoryAccessories(request):
    Accessories = Products.objects.filter(category_id='3')[:4]
    AccessoriesCat = Products.objects.filter(category_id='3')[4:8]

    context = {
        'CAccessories':Accessories,
        'CAccessories2':AccessoriesCat,
    }
    return render(request, 'Category/Accessories.html',context)



def produk_detail(request,q):
    search_id = q
    prod = Products.objects.filter(id = search_id)
    Comment = comment.objects.filter(product__id = search_id)
    if request.method == 'POST':
        product_id = request.POST.get('product')
        product_obj = Products.objects.get(id=product_id)
        comment.objects.create(
            user = request.user,
            product= product_obj,
            comment= request.POST.get('comment')
        )
        return HttpResponseRedirect("/")
    context = {
            'Produk':prod,
            'comment': Comment
        #'username' :request.session['username'],
        #'logIn': request.session['logIn'],
    }
    return render(request, 'BrandProduct/productpage.html',context)

