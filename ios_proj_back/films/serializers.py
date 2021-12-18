from rest_framework import serializers
from films.models import Film, Genres, Posters, Trailer

class FilmPosterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Posters
        fields = "__all__"


class FilmTrailerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trailer
        fields = "__all__"


class GenresSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genres
        fields = ['id', 'title_ru', 'title_eng']

class FilmGeneralSerializer(serializers.ModelSerializer):
    genres = GenresSerializer(many=True)
    class Meta:
        model = Film
        exclude = ['created_at', 'updated_at']