from django.urls import path

from . import views

urlpatterns = [
    path('sessions/', views.SessionsView.as_view()),
    path('sessions/<session_id>/', views.HallView.as_view()),
    path('sessions/<session_id>/halls/<hall_no>/rows/', views.SeatsView.as_view()),
]
