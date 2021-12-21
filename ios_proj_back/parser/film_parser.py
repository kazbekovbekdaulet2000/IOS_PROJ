# "name": "asd",
# "name_origin": "asd",
# "name_rus": "asd",
# "large_img": "ads",
# "medium_img": "ads",
# "small_img": "asd",
# "description": "ads",
# "rating": 9.54,
# "age_restriction": 12,
# "start_date": "2021-12-18",
# "finish_date": "2021-12-08"
import requests

headers = {
    'authority': 'api.kino.kz',
    'sec-ch-ua': '"Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"',
    'accept': 'application/json, text/plain, */*',
    'sec-ch-ua-mobile': '?0',
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',
    'sec-ch-ua-platform': '"macOS"',
    'origin': 'https://kino.kz',
    'sec-fetch-site': 'same-site',
    'sec-fetch-mode': 'cors',
    'sec-fetch-dest': 'empty',
    'referer': 'https://kino.kz/',
    'accept-language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
}

params = (
    ('city_id', '2'),
    ('date', '2021-12-19'),
)

response = requests.get(
    'https://api.kino.kz/sessions/v1/movies/today', headers=headers, params=params)

def find_genre(title):
    genre_exist = requests.get('http://23.111.122.219:8000/films/5/genres/')

    for e in genre_exist.json():
        if(e['title_ru'] == title):
            return e['id']


# def find_film(name):
#     all_films = requests.get('http://23.111.122.219:8000/films/')
#     for j in all_films.json():
#         if(film['name_rus'] == j['name']):
#             return True
#     return False


for film in response.json()['result']:
    genres = []
    if(not film['genres'] == None):
        for genre in film['genres']:
            if(find_genre(genre['title']) == None):
                new_genre_data = {
                    "title_ru": genre['title'],
                    "title_eng": genre['title_eng']
                }
                new_genre = requests.post(
                    'http://23.111.122.219:8000/films/5/genres/', data=new_genre_data)
                genres.append(new_genre.json()['id'])
            else:
                genres.append(find_genre(genre['title']))
    try:
        start_date = film['premiere_kaz'].split('T00:00:00Z')[0]
    except:
        start_date = None
    print(genres)
    film_data = {
        "name": film['name_rus'],
        "name_origin": film['name_origin'],
        "name_rus": film['name_rus'],
        "large_img": "",
        "medium_img": "",
        "small_img": film['small_poster'],
        "description": film['presentation'],
        "rating": film['rating'],
        "age_restriction": film['age_restriction'],
        "start_date": start_date,
        "finish_date": "",
        "genres": genres
    }
    
    # if(find_film(film['name_rus']) == False):
    create_film = requests.post('http://23.111.122.219:8000/films/', data=film_data)

    print(create_film.json())
