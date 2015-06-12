# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('travel', '0003_travelitem_picture'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='travelitem',
            name='type',
        ),
    ]
