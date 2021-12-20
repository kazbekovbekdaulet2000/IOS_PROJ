from rest_framework import serializers
from films.models import Actor, County, Director, Film, Genres, Trailer


class FilmTrailerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trailer
        fields = "__all__"

class ActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = "__all__"

class DirectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Director
        fields = "__all__"

class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = County
        fields = "__all__"

class GenresSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genres
        fields = ['id', 'title_ru', 'title_eng']

class FilmGeneralSerializer(serializers.ModelSerializer):
    genres = GenresSerializer(many=True, read_only=True)
    trailers = FilmTrailerSerializer(many=True, read_only=True)
    actors = ActorSerializer(many=True)
    directors = DirectorSerializer(many=True) 
    countries = CountrySerializer(many=True)
    class Meta:
        model = Film
        exclude = ['created_at', 'updated_at']

class FilmCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Film
        exclude = ['created_at', 'updated_at']
