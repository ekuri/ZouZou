# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('travel', '0002_travelitem_country'),
    ]

    operations = [
        migrations.AddField(
            model_name='travelitem',
            name='picture',
            field=models.ImageField(null=True, upload_to=b'/travel/', blank=True),
        ),
    ]
