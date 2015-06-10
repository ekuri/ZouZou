from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^login/$', views.login, {'templateName': 'login.html'}, name='login'),
    url(r'^register/$', views.register, {'templateName': 'login.html'}, name='register'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^fans/$', views.add_follow, name='addFollow'),
]
