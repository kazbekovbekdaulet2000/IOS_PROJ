from django.urls import path
from films.views import (
    CountryView,
    DirectorView,
    FilmList, 
    FilmDetail, 
    GenreList, 
    FilmTrailer,
    GenreSearch,
    ActorView
)

urlpatterns = [
    path('', FilmList.as_view()),
    path('<id>/', FilmDetail.as_view()),
    path('<id>/trailer/', FilmTrailer.as_view()),
    path('<id>/actor/', ActorView.as_view()),
    path('<id>/director/', DirectorView.as_view()),
    path('<id>/country/', CountryView.as_view()),

    path('<id>/genres/', GenreList.as_view()),
]
