from django.db import models
from django.db.models.signals import post_save, pre_delete
from django.contrib.auth.models import User

# Create your models here.

class RelationManager(models.Manager):
    def getAllFans(self, user):
        return self.filter(fans = user)

    def getAllFollow(self, user):
        return self.filter(follow = user)

class Relation(models.Model):
    fans = models.ForeignKey(User, related_name='fans')
    follow = models.ForeignKey(User, related_name='follow')
    time = models.DateTimeField(auto_now_add=True)
    objects = RelationManager()

    class Meta:
        ordering = ['time']

class UserProfile(models.Model):
    user = models.OneToOneField(User, primary_key=True)
    nickname = models.CharField(max_length=64, blank=True, null=True)
    qq = models.CharField(max_length=16, blank=True, null=True)
    phone = models.CharField(max_length=16, blank=True, null=True)
    email = models.CharField(max_length=64, blank=True, null=True)
    avatar = models.ImageField(upload_to='avatar', null=True, blank=True)
    remark = models.CharField(max_length=256, blank=True, null=True)

    def __unicode__(self):
        return self.user.username + '\'s information'

    class Meta:
        verbose_name = 'Comment'
        verbose_name_plural = 'Comments'

def createUserProfile(sender, instance, created, **kwargs):
    if created:
        userProfile = UserProfile()
        userProfile.user = instance
        userProfile.save()

def deleteUserProfile(sender, instance, **kwargs):
    userProfile = UserProfile.objects.get(user=instance)
    userProfile.delete()

post_save.connect(createUserProfile, sender=User)
pre_delete.connect(deleteUserProfile, sender=User)