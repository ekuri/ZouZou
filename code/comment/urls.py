from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.get_comments, {'templateName': 'comments.html'}, name='comments'),
]
