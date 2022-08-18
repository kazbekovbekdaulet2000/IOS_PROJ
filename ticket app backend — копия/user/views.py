from django.contrib.auth.models import User
from rest_framework import generics, permissions
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.response import Response
from rest_framework import status
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = "__all__"

# Create your views here.
class LogoutView(APIView):
    permission_classes = (permissions.IsAuthenticated,)
    def post(self, request):
        try:
            refresh_token = request.data["refresh"]
            print(refresh_token)
            token = RefreshToken(refresh_token)
            token.blacklist()

            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response({"refresh": "not valid"},status=status.HTTP_400_BAD_REQUEST)


class AboutView(generics.ListAPIView):
    serializer_class = UserSerializer
    permissions = [permissions.IsAuthenticated]
    pagination_class= None
    def get_queryset(self):
        return User.objects.filter(id = self.request.user.id)