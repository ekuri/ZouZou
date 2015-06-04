from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, {'templateName': 'index.html'}, name='index'),
]
