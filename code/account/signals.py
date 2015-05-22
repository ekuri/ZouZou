from django.db.models.signals import post_save
from django.contrib.auth.models import User
from models import UserProfile

def createUserProfile(sender, instance, created, **kwargs):
    if created:
        userProfile = UserProfile(user = instance)
        UserProfile.save()

post_save.connect(createUserProfile, sender=User)
