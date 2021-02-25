from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from django.views.generic import TemplateView
#from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.conf import settings
from toped.models import *

# Create your views here.

def session(request):
    request.session['logIn'] = False
    request.session['user'] = ""

def signup(request):
    
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        username = request.POST['username']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        email = request.POST['email']

        if password1 == password2:
            if User.objects.filter(username=username).exists():
                messages.info(request,"username taken")
            elif User.objects.filter(email=email).exists():
                messages.info('email taken')
                return redirect('/user/signup')
            else:
                user = User.objects.create_user(username=username, password=password1, email=email, first_name=first_name, last_name=last_name,)
                user.save()
                messages.info(request,"user created")
                return redirect('/user/login')
        else:
            messages.info(request,"pasword not matching..")
            return redirect('/signup')
        return redirect('')
    else:
        return render(request, 'signup.html')

def logout(request):
    auth.logout(request)
    return redirect('/')

def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        user = auth.authenticate(username=username, password=password)
        
        if user is not None:
            auth.login(request, user)
            #request.session.set_expiry(1800000)
            return redirect('/')
        else:
            messages.info(request,"invalid ")
            return redirect('/user/login')
    else:
        return render(request, 'login.html')
    
  
@login_required(login_url=settings.LOGIN_URL)
def history_trans(request):
    History = history.objects.all()[:1]
    context = {
        'historydb' : History
    } 
    return render(request,'history.html', context)


@login_required(login_url=settings.LOGIN_URL)
def profile(request, id):
    nomor = id
    profile = User.objects.filter(id= nomor)
    context = {
        'Profile' : profile
    }
    return render(request, 'profile.html')

@login_required(login_url=settings.LOGIN_URL)
def editprofile(request):
    return render(request,'editprofile.html')

class trans_chart(TemplateView):
    template_name = 'transaction.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["qs"] = history.objects.filter(customer_id = 19) 
        return context

