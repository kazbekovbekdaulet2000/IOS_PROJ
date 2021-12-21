import requests
import urllib.request

alias = "rons-gone-wrong"

url_list = "https://ctx.playfamily.ru/screenapi/v1/noauth/collection/web/1?elementAlias=topfilms&elementType=COLLECTION&limit=40&rating%22%3A7%2C%22"
url_item_single = f"https://ctx.playfamily.ru/screenapi/v1/noauth/moviecard/web/1?elementAlias={alias}&elementType=MOVIE"
 
def film_link(alias):
    return f"https://ctx.playfamily.ru/screenapi/v1/noauth/moviecard/web/1?elementAlias={alias}&elementType=MOVIE"

def find_genre(title):
    genre_exist = requests.get('http://23.111.122.219:8000/films/1/genres/')

    for e in genre_exist.json():
        if(e['title_ru'] == title):
            return e['id']

def find_country(name):
    data = requests.get('http://23.111.122.219:8000/films/1/country/')

    for e in data.json():
        if(e['name'] == name):
            return e['id']

def find_user(name, type):
    data = requests.get(f'http://23.111.122.219:8000/films/1/{type}/')

    for e in data.json():
        if(e['name'] == name):
            return e['id']

def getNormalURL(trailer):
    for t in trailer:
        if(t['media']['width'] < 800 and t['media']['mimeType'] == 'mp4/ts'):
            return t

res = requests.get(url_list)

count=12
for i in res.json()['element']['collectionItems']['items']:
    film = i['element']
    if(film['type'] == "MOVIE"):
        film_detail_res = requests.get(film_link(film['alias']))

        film_detail = film_detail_res.json()['element']
        
        poster = ""
        cover = ""
        for j in film_detail['basicCovers']['items']:
            if(j['imageType']=="PORTRAIT"):
                poster = j['url']
            elif(j['imageType']=="COVER"):
                cover = j['url']
        
        genres = [] # done
        actors = []
        directors = [] # done       
        countries = [] # done
        trailers = [] # done

        trailer = film_detail['trailers']['items']
        url = getNormalURL(trailer)['url']
        res = urllib.request.urlopen(url)
        finalurl = res.geturl()
        trailer_data = {
            "trailer_url": finalurl
        }
        trailer_data = requests.post('http://23.111.122.219:8000/films/1/trailer/', data=trailer_data)
        trailers.append(trailer_data.json()['id'])

        for country in film_detail['countries']['items']:
            data = {
                "name": country['element']['name'],
                "originalName": country['element']['originalName']
            }
            id=find_country(country['element']['name']) 
            
            if(id):
                countries.append(id)    
            else:
                countries_data = requests.post('http://23.111.122.219:8000/films/1/country/', data)
                countries.append(countries_data.json()['id'])

        for director in film_detail['directors']['items']:
            data = {
                "name": director['element']['name'],
                "originalName": director['element']['originalName'],
                "image_small": "_",
                "image_large": "_"
            }

            id=find_user(director['element']['name'], "director") 
            
            if(id):
                directors.append(id)    
            else:
                directors_data = requests.post('http://23.111.122.219:8000/films/1/director/', data)
                directors.append(directors_data.json()['id'])

        for genre in film_detail['genres']['items']:
            new_genre_data = {
                "title_ru": genre['element']['name'],
                "title_eng": genre['element']['originalName']
            }
            id = find_genre(genre['element']['name'])
            if(id):
                genres.append(id)
            else:
                new_genre = requests.post('http://23.111.122.219:8000/films/1/genres/', data=new_genre_data)
                genres.append(new_genre.json()['id'])

        for actor in film_detail['actors']['items']:
            data = {
                "name": actor['element']['name'],
                "originalName": actor['element']['originalName'],
                "image_small": "_",
                "image_large": "_"
            }
            id=find_user(actor['element']['name'], "actor") 
            
            if(id):
                actors.append(id)    
            else:
                actors_data = requests.post('http://23.111.122.219:8000/films/1/actor/', data)
                actors.append(actors_data.json()['id'])

        
        film_data = {
            "name": film_detail['name'],
            "name_origin": film_detail['originalName'],
            "name_rus": film_detail['name'],
            "large_img": cover,
            "medium_img": cover,
            "small_img": poster,
            "description": film_detail['description'],
            "rating": film_detail['kinopoiskRating'],
            "age_restriction": film_detail['ageAccessType'],
            "duriation": film_detail['duration'],
            "start_date": None,
            "finish_date": None,
            "genres": genres,
            "actors": actors,
            "directors": directors,
            "countries": countries,
            "trailers": trailers,            
        }
        print(film_detail)
        create_film = requests.post('http://23.111.122.219:8000/films/', data=film_data)

        print(create_film.json())
