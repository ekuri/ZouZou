from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.get_travels, {'templateName': 'travels.html'}, name='travels'),
    url(r'^follows/$', views.get_follows_travels, {'templateName': 'follows.html'}, name='follows'),
    url(r'^collections/$', views.get_travel_collections, {'templateName': 'collections.html'}, name='collections'),
    url(r'^detail/([0-9]+)/$', views.get_travel_detail, {'templateName': 'travelDetail.html'}, name='travelDetail'),
    url(r'^path/([0-9]+)/$', views.get_travel_path),
    url(r'^paths/$', views.get_all_travel_path),
    url(r'^start/$', views.start_travel),
    url(r'^end/$', views.end_travel),
    url(r'^upload/$', views.upload_travel_item, name='upload'),
    url(r'^favour/$', views.add_favour),
]
