# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse

from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_GET, require_POST
from django.contrib.auth.decorators import login_required

from comment.models import Comment
from travel.models import TravelItem

import json

# Create your views here.

@require_GET
@login_required
def get_comments(request, templateName):
    comments = Comment.objects.filter(user=request.user)
    return render(request, templateName, {
        'comments': comments,
    })

@login_required
@require_POST
def create_comment(request):
    result = False
    message = ''
    content = request.POST.get('content', None)
    travelItemId = request.POST.get('travelItem', None)
    if content and travelItemId:
        try:
            travelItem = TravelItem.objects.get(id=travelItemId)
        except:
            travelItem = None
        if travelItem:
            comment = Comment.objects.create(travelItem=travelItem, content=content, user=request.user)
            result = True
            message = 'Succeed'
        else:
            message = '该旅行信息不存在'
    else:
        message = '提交信息有误'
    return HttpResponse(json.dumps({
        'result': result,
        'message': message,
        'content': content,
        'travelItem': travelItemId,
        'username': request.user.username,
        'image': '/static/images/default-avatar.png',
        }))

@login_required
@require_GET
def delete_comment(request, id):
    try:
        comment = Comment.objects.get(id=id)
    except:
        comment = None
    if comment:
        if comment.user == request.user:
            comment.delete()
    return redirect('/comment/')