from datetime import datetime, timedelta
from cinema.models import Cinema
from .models import Row, Seat, Hall, Session
from . import serializers
from rest_framework import generics, status
from rest_framework import permissions
from django.shortcuts import get_object_or_404


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
        session = get_object_or_404(Session, id=self.kwargs['session_id'])
        for i in Hall.objects.filter(cinema_id=self.kwargs['cinema_id']):
            if int(i.id) == int(session.hall.id):
                return Row.objects.filter(hall_id=i.id)
        return {}

class RowCreateView(generics.CreateAPIView):
    serializer_class = serializers.RowSerializer
    permission_classes = [permissions.AllowAny]


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


class SessionsView(generics.ListCreateAPIView):
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        now_date = datetime.now()+timedelta(hours=6)
        return Session.objects.filter(cinema_id=self.kwargs['cinema_id'], time__gte=now_date)


    def get_serializer_class(self):
        if self.request.method == "POST":
            return serializers.SessionCreateSerializer
        return serializers.SessionsSerializer