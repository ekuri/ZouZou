from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^access/$', views.accessInterface),
]
