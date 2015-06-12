from django.shortcuts import render

from django.contrib.auth.decorators import login_required

from travel.models import Travel, TravelItem
from account.models import Relation, Collection
from django.contrib.auth.models import User
from comment.models import Comment

# Create your views here.

@login_required
def index(request, templateName):
    fans = Relation.objects.getAllFans(request.user)
    follows = Relation.objects.getAllFollows(request.user)
    travels = Travel.objects.filter(user=request.user, finish=True)
    traveling = Travel.objects.get(finish=False)
    traveling.items = TravelItem.objects.filter(travel=traveling)
    count = Travel.objects.getCount(request.user)
    collections = Collection.objects.filter(user=request.user)
    comments = Comment.objects.filter(user=request.user)
    return render(request, templateName, {
        'fans': fans,
        'follows': follows,
        'travels': travels,
        'countCountry': count['country'],
        'countCity': count['city'],
        'news': getFollowsNews(request.user),
        'traveling': traveling,
    })

def getFollowsNews(user):
    follows = list(Relation.objects.getAllFollows(user))
    travels = list(Travel.objects.filter(user__in=follows))
    items = TravelItem.objects.filter(travel__in=travels).order_by('-time')[:5]
    return items