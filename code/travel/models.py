#-*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

from zouzou.settings import BAIDU_AK
import urllib2
import json

# Create your models here.

class TravelManager(models.Manager):
    def getCount(self, user):
        travels = self.filter(user=user)
        countries = set()
        cities = set()
        for travel in travels:
            items = TravelItem.objects.filter(travel=travel)
            for item in items:
                if item.country is not None and item.country != '':
                    countries.add(item.country)
                if item.city is not None and item.city != '':
                    cities.add(item.city)
        return {'country': len(countries), 'city': len(cities)}

class Travel(models.Model):
    user = models.ForeignKey(User)
    finish = models.BooleanField(default=False)
    time = models.DateTimeField(auto_now_add=True)
    startItem = models.ForeignKey('TravelItem', blank=True, null=True,
        related_name='startItem')
    nowItem = models.ForeignKey('TravelItem', blank=True, null=True,
        related_name='nowItem')
    endItem = models.ForeignKey('TravelItem', blank=True, null=True,
        related_name='endItem')
    objects = TravelManager()

    def __unicode__(self):
        return self.user.username + '\'s travel'

    def addItems(self, travelItem):
        if not self.finish:
            if self.startItem is None:
                self.startItem = travelItem
                self.nowItem = travelItem
            else:
                self.nowItem.next = travelItem
                self.nowItem.save()
                self.nowItem = travelItem
            self.save()
            return True
        else:
            return False

    def close(self):
        self.endItem = self.nowItem
        self.finish = True
        self.save()

    class Meta:
        verbose_name = 'Travel'
        verbose_name_plural = 'Travels'

class TravelItem(models.Model):
    travel = models.ForeignKey(Travel)
    content = models.TextField()
    longtitude = models.FloatField()
    latitude = models.FloatField()
    picture = models.ImageField(upload_to='travel', null=True, blank=True)
    city = models.CharField(max_length=32, null=True, blank=True)
    country = models.CharField(max_length=32, null=True, blank=True)
    favour = models.IntegerField(default=0)
    next = models.ForeignKey('self', null=True, blank=True)
    time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return 'Item of ' + self.travel.user.username + '\'s travel'

    def save(self, *args, **kwargs):
        if not self.city or not self.country:
            if self.longtitude and self.latitude:
                req = urllib2.Request('http://api.map.baidu.com/geocoder/v2/?ak=%s&location=%f,%f&output=json' % (BAIDU_AK, self.latitude, self.longtitude))
                res = urllib2.urlopen(req)
                result = res.read()
                result = json.loads(result)
                res.close()
                self.city = result['result']['addressComponent']['city']
                self.country = result['result']['addressComponent']['country']
        super(TravelItem, self).save()

    def getLocation(self):
        pass

    class Meta:
        ordering = ['travel', 'time']
        verbose_name = 'Travel Item'
        verbose_name_plural = 'Travel Items'
