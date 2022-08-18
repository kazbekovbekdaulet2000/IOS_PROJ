from django.db import models
from public.models import PublicDate


class Actor(PublicDate):
    name = models.CharField(max_length=255, null=False)
    originalName = models.CharField(max_length=255, null=True)
    image_small = models.CharField(max_length=1000, null=True)
    image_large = models.CharField(max_length=1000, null=True)

    def __str__(self):
        return self.name


class Director(PublicDate):
    name = models.CharField(max_length=255, null=False)
    originalName = models.CharField(max_length=255, null=True)
    image_small = models.CharField(max_length=1000, null=True)
    image_large = models.CharField(max_length=1000, null=True)

    def __str__(self):
        return self.name


class County(PublicDate):
    name = models.CharField(max_length=255, null=False)
    originalName = models.CharField(max_length=255, null=True)

    def __str__(self):
        return self.name


class Genres(PublicDate):
    title_ru = models.CharField(max_length=255, null=False)
    title_eng = models.CharField(max_length=255, null=False, default="")

    def __str__(self):
        return self.title_ru


class Trailer(models.Model):
    trailer_url = models.CharField(max_length=1000, null=True, blank=True)

    def __str__(self):
        return f"{self.id} --- {self.trailer_url}"


class Film(PublicDate):
    name = models.CharField(max_length=255, null=False)
    name_origin = models.CharField(max_length=255, null=True)
    name_rus = models.CharField(max_length=255, null=True)
    large_img = models.CharField(max_length=1000, null=True)
    medium_img = models.CharField(max_length=1000, null=True)
    small_img = models.CharField(max_length=1000, null=True)
    description = models.TextField(null=True)
    rating = models.FloatField()
    age_restriction = models.IntegerField()
    duriation = models.BigIntegerField()
    start_date = models.DateField(blank=True, null=True)
    finish_date = models.DateField(blank=True, null=True)

    genres = models.ManyToManyField(Genres, blank=True)
    actors = models.ManyToManyField(Actor, blank=True)
    directors = models.ManyToManyField(Director, blank=True)
    countries = models.ManyToManyField(County, blank=True)
    trailers = models.ManyToManyField(Trailer, blank=True)

    def __str__(self):
        return self.name
