from django.urls import path
from films.views import FilmList, FilmDetail, FilmPoster, GenreList, FilmTrailer, GenreSearch


urlpatterns = [
    path('', FilmList.as_view()),
    path('<id>/', FilmDetail.as_view()),
    path('<id>/posters/', FilmPoster.as_view()),
    path('<id>/trailer/', FilmTrailer.as_view()),
    path('<id>/genres/', GenreList.as_view()),
    path('<id>/genres/<search>/', GenreSearch.as_view())
]
