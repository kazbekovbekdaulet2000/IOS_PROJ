from django.db.models import fields
from rest_framework import serializers
from cinema.models import Cinema, City


class CinemaSerializer(serializers.ModelSerializer):
  class Meta:
    model = Cinema
    fields = '__all__'

class CitySerializer(serializers.ModelSerializer):
  class Meta:
    model = City
    fields = '__all__'