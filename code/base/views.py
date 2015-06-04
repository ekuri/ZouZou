from django.shortcuts import render

# Create your views here.

def index(request, templateName):
    return render(request, templateName)