from django.db import models
from public.models import PublicDate


class City(models.Model):
    name = models.CharField(max_length=255, null=False)
    name_lat = models.CharField(max_length=255, null=False)
    time_zone = models.IntegerField(default=0, null=True)
    latitude = models.DecimalField(
        default=0, max_digits=9, decimal_places=6, null=True)
    longitude = models.DecimalField(
        default=0, max_digits=9, decimal_places=6, null=True)
    order = models.IntegerField()

    def __str__(self):
        return self.name


class Cinema(PublicDate):
    name = models.CharField(max_length=255, null=False)
    description = models.TextField(null=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE, null=False)
    image_large = models.CharField(max_length=1000, null=True, blank=True)
    image_small = models.CharField(max_length=1000, null=True, blank=True)
    address = models.CharField(max_length=255, null=False, blank=True)
    longitude = models.DecimalField(
        max_digits=9, decimal_places=6, null=True, blank=True)
    latitude = models.DecimalField(
        max_digits=9, decimal_places=6, null=True, blank=True)
    phone = models.CharField(max_length=255, null=True)

    def __str__(self):
        return self.name