from django.shortcuts import render
from rest_framework import generics, permissions, request

from order.models import Reservation
from order.serializers import ReservationsSerializer, SeatReservationSerializer

# Create your views here.


class ReservationView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Reservation.objects.filter(user = self.request.user)

    def get_serializer_class(self):
        if self.request.method == "GET":
            return ReservationsSerializer
        return SeatReservationSerializer

    def get_serializer_context(self):
        return {
            'request': self.request,
            'format': self.format_kwarg,
            'view': self,
            'user': self.request.user
        }
