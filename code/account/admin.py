from django.contrib import admin

from account.models import Relation, Collection

# Register your models here.

class RelationAdmin(admin.ModelAdmin):
    list_display = ('id', 'follow', 'fans', 'time')

class CollectionAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'travelItem', 'time')

admin.site.register(Relation, RelationAdmin)
admin.site.register(Collection, CollectionAdmin)