from django.contrib import admin

from . import models

admin.site.register(models.District)
admin.site.register(models.Case)
admin.site.register(models.Event)
admin.site.register(models.Person)
admin.site.register(models.Binder)
admin.site.register(models.History)
