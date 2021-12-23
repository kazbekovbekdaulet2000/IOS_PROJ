from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from user.views import LogoutView, AboutView

urlpatterns = [
    path('sign-in/', TokenObtainPairView.as_view(), name='login'),
    path('sign-in/refresh/', TokenRefreshView.as_view(), name='refresh token'),
    path('logout/', LogoutView.as_view(), name='auth_logout'),
    path('about/', AboutView.as_view())
]
