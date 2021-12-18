from django.shortcuts import render
from rest_framework import generics, permissions, pagination

from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.response import Response
from rest_framework.views import APIView
from films.models import Film, Genres, Posters, Trailer
from films.serializers import FilmGeneralSerializer, FilmPosterSerializer, FilmTrailerSerializer, GenresSerializer
# Create your views here.


class FilmList(generics.ListCreateAPIView):
    serializer_class = FilmGeneralSerializer
    permission_classes = [permissions.AllowAny]
    queryset = Film.objects.all()
    filter_backends = [filters.SearchFilter,
                       DjangoFilterBackend, filters.OrderingFilter]
    search_fields = ['name']
    filterset_fields = ['start_date']


# , FilmDetail, FilmPoster, FilmTrailer
class FilmDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    serializer_class = FilmGeneralSerializer
    permission_classes = [permissions.AllowAny]
    queryset = Film.objects.all()


class FilmPoster(generics.ListCreateAPIView):
    serializer_class = FilmPosterSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def get_queryset(self):
        return Posters.objects.filter(film_id=self.kwargs['id'])


class FilmTrailer(generics.ListCreateAPIView):
    serializer_class = FilmTrailerSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def get_queryset(self):
        return Trailer.objects.filter(film_id=self.kwargs['id'])


class GenreList(generics.ListCreateAPIView):
    serializer_class = GenresSerializer
    queryset = Genres.objects.all()
    permission_classes = [permissions.AllowAny]
    pagination_class = None


class GenreSearch(APIView):
    def get(self, request, *args, **kwargs):
        try:
            instance = Genres.objects.get(title_ru=kwargs['search'])
            serializer = GenresSerializer(instance)
            return Response(serializer.data)
        except:
            return Response({'error': True})