from django.contrib import admin

from travel.models import Travel, TravelItem
# Register your models here.

class TravelAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'finish', 'time')

class TravelItemAdmin(admin.ModelAdmin):
    list_display = ('id', 'travel', 'content', 'picture', 'longtitude', 'latitude', 'city', 'country', 'favour', 'time')

admin.site.register(Travel, TravelAdmin)
admin.site.register(TravelItem, TravelItemAdmin)