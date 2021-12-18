from django.contrib import admin

from films.models import Film, Genres

# Register your models here.
admin.site.register(Film)
admin.site.register(Genres)