from django.urls import path
from . import views

urlpatterns = [
    path('halls/', views.HallsView.as_view()),
    path('halls/<hall_no>/', views.HallView.as_view()),
    path('halls/<hall_no>/rows/', views.SeatsView.as_view()),
]
