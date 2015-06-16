# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.template import RequestContext, loader

from django.contrib import auth
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_GET, require_POST
from django.contrib.auth.decorators import login_required

from travel.models import Travel, TravelItem
from account.models import Relation, Collection
from comment.models import Comment

from travel.forms import TravelItemForm

import datetime
import json


# Create your views here.

@require_POST
@login_required
@csrf_exempt
def start_travel(request):
    result = False
    message = ''
    try:
        travel = Travel.objects.get(user=request.user, finish=False)
    except:
        travel = None
    if travel is None:
        travel = Travel.objects.create(user=request.user)
        result = True
        message = 'Start travel succeed!'
    else:
        message = 'The last travel has not ended.'
    return HttpResponse(json.dumps({
        'result': result,
        'message': message,
    }))

@require_POST
@login_required
@csrf_exempt
def end_travel(request):
    result = False
    message = ''
    try:
        travel = Travel.objects.get(user=request.user, finish=False)
    except:
        travel = None
    if travel is not None:
        items = TravelItem.objects.filter(travel=travel)
        if len(items) == 0:
            travel.delete()
        else:
            travel.finish = True
            travel.save()
        result = True
        message = 'End travel succeed!'
    else:
        message = 'There is no travel that is not ended!'
    return HttpResponse(json.dumps({
        'result': result,
        'message': message,
    }))

@require_GET
@login_required
def get_travels(request, templateName):
    travels = Travel.objects.filter(user=request.user).order_by('-id')
    for travel in travels:
        travel.items = TravelItem.objects.filter(travel=travel).order_by('id')
        if travel.items:
            travel.startDate = travel.items.first().time
            travel.endDate = travel.items.last().time
        else:
            travel.startDate = None
            travel.endDate = None
    return render(request, templateName, {
        'travels': travels,
    })

@require_GET
def get_travel_detail(request, travelID, templateName):
    travel = Travel.objects.get(id=travelID)
    travel.items = TravelItem.objects.filter(travel=travel)
    for item in travel.items:
        item.comments = Comment.objects.filter(travelItem=item).order_by('time')
    if travel.items:
        travel.startDate = travel.items.first().time
        travel.endDate = travel.items.last().time
    else:
        travel.startDate = None
        travel.endDate = None
    return render(request, templateName, {
        'travel': travel,
    })

@login_required
@require_GET
def get_follows_travels(request, templateName):
    follows = Relation.objects.getAllFollows(request.user)
    for item in follows:
        travels = list(Travel.objects.filter(user=item))
        item.travels = TravelItem.objects.filter(travel__in=travels)[:3]
    return render(request, templateName, {
        'follows': follows,
    })

@login_required
@require_GET
def get_travel_collections(request, templateName):
    collections = Collection.objects.filter(user=request.user).values_list('travelItem', flat=True)
    travelItems = TravelItem.objects.filter(id__in=collections)
    for item in travelItems:
        item.comments = Comment.objects.filter(travelItem=item).count()
    return render(request, templateName, {
        'travelItems': travelItems,
    })

@login_required
@require_GET
def get_travel_path(request, travelID):
    travel = Travel.objects.get(id=travelID)
    items = TravelItem.objects.filter(travel=travel).order_by('time').values('longtitude', 'latitude', 'picture', 'content', 'time')
    map(mapper, items)
    return HttpResponse(json.dumps(list(items)))

@login_required
@require_GET
def get_all_travel_path(request):
    travels = Travel.objects.filter(user=request.user)
    result = []
    for travel in travels:
        result.append(map(mapper, list(TravelItem.objects.filter(travel=travel).order_by('time').values('longtitude', 'latitude', 'picture', 'content', 'time'))))
    return HttpResponse(json.dumps(result))

def mapper(item):
    item['time'] = str(item['time'])
    return item


@login_required
@require_POST
def upload_travel_item(request):
    result = False
    message = ''
    picture = None
    content = None
    try:
        travel = Travel.objects.get(user=request.user, finish=False)
    except:
        travel = None
        message = '尚未开始任何旅行'
    if travel:
        form = TravelItemForm(request.POST, request.FILES)
        if form.is_valid():
            content = form.cleaned_data['content']
            longtitude = float(form.cleaned_data['longtitude'])
            latitude = float(form.cleaned_data['latitude'])
            picture = form.cleaned_data['picture']
            time = str(form.cleaned_data['date']) + ' ' + str(form.cleaned_data['time'])
            travelItem = TravelItem.objects.create(content=content, latitude=latitude,
                longtitude=longtitude, travel=travel, picture=picture,
                time=datetime.datetime.strptime(time, '%Y-%m-%d %H:%M:%S'))
            picture = travelItem.picture.url
            content = travelItem.content
            result = True
            message = 'Succeed'
        else:
            message = '提交表单的信息不全'
    return HttpResponse(json.dumps({
        'result': result,
        'message': message,
        'picture': picture,
        'content': content,
    }))
