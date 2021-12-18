from rest_framework.response import Response

from cinema.models import Cinema
from .models import Row, Seat, Hall
from . import serializers
from rest_framework import generics, status
from rest_framework import permissions
from rest_framework import pagination


class HallsView(generics.ListCreateAPIView):
    serializer_class = serializers.BaseHallSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def get_queryset(self):
        return Hall.objects.filter(cinema_id=self.kwargs['cinema_id'])


class HallView(generics.ListCreateAPIView):
    serializer_class = serializers.RowSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def get_serializer_context(self):
        return {
            'request': self.request,
            'format': self.format_kwarg,
            'view': self,
            'kwargs': self.kwargs
        }

    def get_queryset(self):
        for i in Hall.objects.filter(cinema_id=self.kwargs['cinema_id']):
            if int(i.hall_no) == int(self.kwargs['hall_no']):
                return Row.objects.filter(hall_id=i.id)
        return {}


class SeatsView(generics.ListCreateAPIView):
    serializer_class = serializers.SeatSerializer
    permission_classes = [permissions.AllowAny]
    pagination_class = None

    def get_queryset(self):
        for i in Hall.objects.filter(cinema_id=self.kwargs['cinema_id']):
            if int(i.hall_no) == int(self.kwargs['hall_no']):
                list = []
                for j in Row.objects.filter(hall_id=i.id):
                    for seat in j.seats.all():
                        list.append(seat)
                return list
        return {}
