from django.shortcuts import render
from django.views.generic import TemplateView
from toped.models import *
# Create your views here

class trans_chart(TemplateView):
    template_name = 'transaction.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["qs"] = history .objects.filter(customer_id = 19) 
        return context


