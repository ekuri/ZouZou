# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('user', models.OneToOneField(primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('qq', models.CharField(max_length=16, null=True, blank=True)),
                ('phone', models.CharField(max_length=16, null=True, blank=True)),
                ('email', models.CharField(max_length=64, null=True, blank=True)),
            ],
        ),
    ]
