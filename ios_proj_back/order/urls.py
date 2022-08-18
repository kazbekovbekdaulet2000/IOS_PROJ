from django.urls import path

from order.views import ReservationView

urlpatterns = [
    path('', ReservationView.as_view()),
]
