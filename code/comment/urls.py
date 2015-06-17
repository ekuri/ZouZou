from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.get_comments, {'templateName': 'comments.html'}, name='comments'),
    url(r'^create/$', views.create_comment, name='create'),
]
