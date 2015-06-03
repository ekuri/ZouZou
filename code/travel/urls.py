from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^start/$', views.start_travel),
    url(r'^end/$', views.end_travel),
    url(r'^detail/([0-9]+)/$', views.get_travel_detail, {'templateName': 'detail.html'}, name='travelDetail'),
]
