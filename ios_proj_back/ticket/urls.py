from django.urls import path

from . import views

urlpatterns = [
    path('sessions/', views.SessionsView.as_view()),
    path('sessions/<session_id>/', views.HallView.as_view()),
    path('halls/', views.HallsView.as_view()),
    path('halls/<hall_id>/', views.RowCreateView.as_view()),
    path('halls/<hall_no>/rows/', views.SeatsView.as_view()),
    path('halls/<hall_no>/rows/', views.SeatsView.as_view()),
]
