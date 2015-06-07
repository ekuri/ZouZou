from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'', include('base.urls', namespace='base')),
    url(r'^account/', include('account.urls', namespace='account')),
    # url(r'^comment/', include('comment.urls', namespace='comment')),
    url(r'^travel/', include('travel.urls', namespace='travel')),
    url(r'^weixin/', include('weixin.urls', namespace='weixin')),
    url(r'^admin/', include(admin.site.urls)),
]
