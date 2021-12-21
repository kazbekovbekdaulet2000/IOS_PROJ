from django.urls import path, include
from . import views

urlpatterns = [
    path('cities/', views.CityList.as_view()),
    path('', views.CinemaList.as_view()),
    path('<id>/', views.CinemaSingle.as_view()),
    path('<cinema_id>/', include('ticket.urls')),
]
