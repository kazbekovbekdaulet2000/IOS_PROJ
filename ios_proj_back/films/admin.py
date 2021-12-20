from django.contrib import admin

from films.models import Film, Genres, Trailer

# Register your models here.
admin.site.register(Film)
admin.site.register(Genres)
admin.site.register(Trailer)