# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('travel', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='travelitem',
            name='country',
            field=models.CharField(max_length=32, null=True, blank=True),
        ),
    ]
