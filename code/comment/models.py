from django.db import models
from django.contrib.auth.models import User
from travel.models import TravelItem

# Create your models here.

class Comment(models.Model):
    user = models.ForeignKey(User)
    travelItem = models.ForeignKey(TravelItem)
    content = models.TextField(null=True, blank=True)
    time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return 'Comment from ' + self.user.username

    class Meta:
        ordering = ['travelItem', 'time']
        verbose_name = 'Comment'
        verbose_name_plural = 'Comments'