from django.conf.urls import include, url
from django.contrib import admin
import settings

urlpatterns = [
    url(r'', include('base.urls', namespace='base')),
    url(r'^accounts/', include('account.urls', namespace='accounts')),
    url(r'^comment/', include('comment.urls', namespace='comment')),
    url(r'^travel/', include('travel.urls', namespace='travel')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
        'document_root': settings.MEDIA_ROOT,
    }),
]
