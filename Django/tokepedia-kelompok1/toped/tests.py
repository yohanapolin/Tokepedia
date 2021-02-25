from django.contrib import admin
from django.urls import path, include
from . import views
urlpatterns = [
    path('', views.HomeView.as_view())

]
'''class HomeView(ListView):
    model = Products
    paginate_by = 10
    template_name = "index.html"'''