from django.shortcuts import render
from rest_framework import generics, permissions
from cinema.models import Cinema, City
from . import serializers
from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
# Create your views here.


class CinemaList(generics.ListCreateAPIView):
    serializer_class = serializers.CinemaSerializer
    queryset = Cinema.objects.all()
    permission_classes = [permissions.AllowAny]
    filter_backends = [filters.SearchFilter,
                       DjangoFilterBackend, filters.OrderingFilter]
    ordering_fields = ['city', ]
    search_fields = ['name', 'city']
    filterset_fields = ['city']


class CinemaSingle(generics.RetrieveAPIView):
    lookup_field = 'id'
    serializer_class = serializers.CinemaSerializer
    queryset = Cinema.objects.all()
    permission_classes = [permissions.AllowAny]


class CityList(generics.ListCreateAPIView):
    serializer_class = serializers.CitySerializer
    queryset = City.objects.all()
    permission_classes = [permissions.AllowAny]