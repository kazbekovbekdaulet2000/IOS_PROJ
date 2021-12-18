from django.db import models
from public.models import PublicDate


class Genres(PublicDate):
    title_ru = models.CharField(max_length=255, null=False)
    title_eng = models.CharField(max_length=255, null=False, default="")

    def __str__(self):
        return self.title_ru


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

    start_date = models.DateField(blank=True)
    finish_date = models.DateField(null=True)

    genres = models.ManyToManyField(Genres, blank=True)
    
    def __str__(self):
        return self.name

class Posters(models.Model):
    poster_large = models.CharField(max_length=1000, null=True, blank=True)
    poster_small = models.CharField(max_length=1000, null=True, blank=True)
    film = models.ForeignKey(Film, on_delete=models.CASCADE, null=False)

class Trailer(models.Model):
    trailer_url = models.CharField(max_length=1000, null=True, blank=True)
    film = models.ForeignKey(Film, on_delete=models.CASCADE, null=False)