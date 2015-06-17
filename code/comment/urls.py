from django.conf.urls import url

from . import views
from base.views import index

urlpatterns = [
    url(r'^$', index, {'templateName': 'comments.html'}, name='comments'),
    url(r'^create/$', views.create_comment, name='create'),
    url(r'^delete/([0-9]+)/$', views.delete_comment, name='delete'),
]
