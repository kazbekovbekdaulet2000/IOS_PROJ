from django.shortcuts import render
from rest_framework import generics, permissions, pagination, status

from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.response import Response
from rest_framework.views import APIView
from films.models import Actor, County, Director, Film, Genres, Trailer
from films.serializers import ActorSerializer, CountrySerializer, DirectorSerializer, FilmCreateSerializer, FilmGeneralSerializer, FilmTrailerSerializer, GenresSerializer

# Create your views here.


class FilmList(generics.ListCreateAPIView):
    serializer_class = FilmGeneralSerializer
    permission_classes = [permissions.AllowAny]
    queryset = Film.objects.all()
    filter_backends = [filters.SearchFilter,
                       DjangoFilterBackend, filters.OrderingFilter]
    search_fields = ['name']
    filterset_fields = ['start_date']

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return FilmGeneralSerializer
        if self.request.method == 'POST':
            return FilmCreateSerializer
        return FilmGeneralSerializer


class FilmDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    serializer_class = FilmGeneralSerializer
    permission_classes = [permissions.AllowAny]
    queryset = Film.objects.all()

class FilmTrailer(generics.ListCreateAPIView):
    serializer_class = FilmTrailerSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None
    queryset = Trailer.objects.all()

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


class ActorView(generics.ListCreateAPIView):
    serializer_class = ActorSerializer
    queryset = Actor.objects.all()
    permission_classes = [permissions.AllowAny]
    pagination_class = None


class DirectorView(generics.ListCreateAPIView):
    serializer_class = DirectorSerializer
    queryset = Director.objects.all()
    permission_classes = [permissions.AllowAny]
    pagination_class = None


class CountryView(generics.ListCreateAPIView):
    serializer_class = CountrySerializer
    queryset = County.objects.all()
    permission_classes = [permissions.AllowAny]
    pagination_class = None
