# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse

from django.contrib import auth
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_GET, require_POST
from django.contrib.auth.decorators import login_required

from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from account.models import UserProfile, Relation

import json

# Create your views here.
@require_http_methods(['GET', 'POST'])
def login(request, templateName):
    if request.user.is_authenticated():
        return redirect('/')

    nextPage = request.GET.get('next', '/')
    errorMessage = ''

    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            return redirect(nextPage)
        errorMessage = '用户名或密码错误'
    return render(templateName, {
        'error': errorMessage,
        'next': nextPage,
        })

@require_GET
def logout(request):
    auth.logout(request)
    return redirect('/')

@require_http_methods(['GET', 'POST'])
def register(request, templateName):
    nextPage = request.GET.get('next', '/')
    errorMessage = ''

    if request.method == 'POST':
        userForm = UserCreationForm(request.POST)
        username = request.POST.get('username', None)
        password = request.POSt.get('password', None)
        if userForm.is_valid():
            user = userForm.save()
            auth.login(request, user)
            return redirect(next)
        else:
            errorMessage = '注册信息有错'
    return render(templateName, {
        'error': errorMessage,
        })

@require_POST
@login_required
def add_follow(request):
    result = False
    message = ''

    userID = request.POST.get('userID', None)
    user = User.objects.get(id=userID)
    if user is not None:
        relation = Relation.objects.create(
            fans = request.user,
            follow = user,
            )
        message = 'success'
        result = True
    else:
        message = 'The userID is not exist'
    
    return HttpResponse(json.dumps({
        'result': result,
        'message': message,
        }))
