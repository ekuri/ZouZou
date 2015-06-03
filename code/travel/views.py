# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.http import HttpResponse

from django.contrib import auth
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_GET, require_POST
from django.contrib.auth.decorators import login_required

from travel.models import Travel, TravelItem

import json

# Create your views here.

@require_POST
@login_required
def start_travel(request):
    result = False
    message = ''

    travel = Travel.objects.get(user=request.user, finish=False)
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
def end_travel(request):
    result = False
    message = ''

    travel = Travel.objects.get(user=request.user, finish=False)
    if travel is not None:
        travel.close()
        result = True
        message = 'End travel succeed!'
    else:
        message = 'There is no travel that is not ended!'
    return HttpResponse(json.dumps({
        'result': result,
        'message': message,
    }))

@require_GET
def get_travel_detail(request, travelID, templateName):
    travel = Travel.objects.get(id=travelID)
    travelItems = TravelItems.objects.filter(travel=travel)
    return render(templateName, {
        'travel': travel,
        'travelItems': travelItems,
    })
