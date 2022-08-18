from rest_framework import serializers

from cinema.serializers import CinemaSerializer
from .models import Reservation


class ReservationsSerializer(serializers.ModelSerializer):
    cinema = CinemaSerializer()
    class Meta:
        model = Reservation
        exclude = ['user']

class SeatReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        exclude = ['user']

    def validate(self, attrs):
        print(attrs['seat'])
        if(attrs['seat'].picked): 
            raise serializers.ValidationError('Это место уже занято') 
        else:
            return super().validate(attrs)
      
    def create(self, validated_data):
        seat = validated_data['seat']
        validated_data['user'] = self.context['user']
        seat.picked = not seat.picked
        seat.save()
        return super().create(validated_data)