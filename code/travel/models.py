#-*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

# Create your models here.

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

    def __unicode__(self):
        return self.user.username + '\'s travel'

    class Meta:
        verbose_name = 'Travel'
        verbose_name_plural = 'Travels'

class TravelItem(models.Model):
    travel = models.ForeignKey(Travel)
    type = models.CharField(max_length=32, choices=(
        ('image', u'图片'),
        ('text', u'文字'),
        ('sound', u'录音'),
        ('video', u'视频'),
    ))
    content = models.TextField()
    longtitude = models.FloatField()
    latitude = models.FloatField()
    city = models.CharField(max_length=32, null=True, blank=True)
    favour = models.IntegerField(default=0)
    next = models.ForeignKey('self', null=True, blank=True)
    time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return 'Item of ' + self.travel.user.username + '\'s travel'

    class Meta:
        ordering = ['travel', 'time']
        verbose_name = 'Travel Item'
        verbose_name_plural = 'Travel Items'