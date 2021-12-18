from django.contrib import admin
from .models import Hall, Seat, Row
# Register your models here.

admin.site.register(Hall)
admin.site.register(Row)
admin.site.register(Seat)