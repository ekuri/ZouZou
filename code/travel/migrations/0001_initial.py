# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Travel',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('finish', models.BooleanField(default=False)),
                ('time', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'Travel',
                'verbose_name_plural': 'Travels',
            },
        ),
        migrations.CreateModel(
            name='TravelItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=32, choices=[(b'image', '\u56fe\u7247'), (b'text', '\u6587\u5b57'), (b'sound', '\u5f55\u97f3'), (b'video', '\u89c6\u9891')])),
                ('content', models.TextField()),
                ('longtitude', models.FloatField()),
                ('latitude', models.FloatField()),
                ('city', models.CharField(max_length=32, null=True, blank=True)),
                ('favour', models.IntegerField(default=0)),
                ('time', models.DateTimeField(auto_now_add=True)),
                ('next', models.ForeignKey(blank=True, to='travel.TravelItem', null=True)),
                ('travel', models.ForeignKey(to='travel.Travel')),
            ],
            options={
                'ordering': ['travel', 'time'],
                'verbose_name': 'Travel Item',
                'verbose_name_plural': 'Travel Items',
            },
        ),
        migrations.AddField(
            model_name='travel',
            name='endItem',
            field=models.ForeignKey(related_name='endItem', blank=True, to='travel.TravelItem', null=True),
        ),
        migrations.AddField(
            model_name='travel',
            name='nowItem',
            field=models.ForeignKey(related_name='nowItem', blank=True, to='travel.TravelItem', null=True),
        ),
        migrations.AddField(
            model_name='travel',
            name='startItem',
            field=models.ForeignKey(related_name='startItem', blank=True, to='travel.TravelItem', null=True),
        ),
        migrations.AddField(
            model_name='travel',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
    ]
