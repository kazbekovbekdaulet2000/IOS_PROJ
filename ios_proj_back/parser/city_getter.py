import requests
from bs4 import BeautifulSoup as BS


cities = [
    {
        "id": 1,
        "name": "Нур-Султан",
        "name_lat": "Nur-Sultan",
        "time_zone": 0,
        "latitude": 51.143969,
        "longitude": 71.435801,
        "order": 0
    },
    {
        "id": 2,
        "name": "Алматы",
        "name_lat": "Almaty",
        "time_zone": 0,
        "latitude": 43.238293,
        "longitude": 76.945465,
        "order": 1
    },
    {
        "id": 31,
        "name": "Аксу",
        "name_lat": "Aksu",
        "time_zone": 0,
        "latitude": 52.040616,
        "longitude": 76.926367,
        "order": 3
    },
    {
        "id": 3,
        "name": "Актау",
        "name_lat": "Aktau",
        "time_zone": -1,
        "latitude": 43.635379,
        "longitude": 51.169135,
        "order": 4
    },
    {
        "id": 4,
        "name": "Актобе",
        "name_lat": "Aktobe",
        "time_zone": -1,
        "latitude": 50.300371,
        "longitude": 57.154555,
        "order": 5
    },
    {
        "id": 5,
        "name": "Атырау",
        "name_lat": "Atyrau",
        "time_zone": -1,
        "latitude": 47.106615,
        "longitude": 51.91338,
        "order": 7
    },
    {
        "id": 6,
        "name": "Балхаш",
        "name_lat": "Balkhash",
        "time_zone": 0,
        "latitude": 46.839326,
        "longitude": 74.983356,
        "order": 8
    },
    {
        "id": 23,
        "name": "Жанаозен",
        "name_lat": "Tzanaozen",
        "time_zone": 0,
        "latitude": 43.343266,
        "longitude": 52.865792,
        "order": 11
    },
    {
        "id": 40,
        "name": "Жезказган",
        "name_lat": "Zhezkazgan",
        "time_zone": 0,
        "latitude": 47.79025,
        "longitude": 67.710714,
        "order": 13
    },
    {
        "id": 7,
        "name": "Караганда",
        "name_lat": "Karaganda",
        "time_zone": 0,
        "latitude": 49.807754,
        "longitude": 73.088504,
        "order": 16
    },
    {
        "id": 8,
        "name": "Костанай",
        "name_lat": "Kostanay",
        "time_zone": 0,
        "latitude": 53.21448,
        "longitude": 63.632073,
        "order": 18
    },
    {
        "id": 9,
        "name": "Кызылорда",
        "name_lat": "Kyzylorda",
        "time_zone": -1,
        "latitude": 44.842557,
        "longitude": 65.502545,
        "order": 20
    },
    {
        "id": 10,
        "name": "Павлодар",
        "name_lat": "Pavlodar",
        "time_zone": 0,
        "latitude": 52.285577,
        "longitude": 76.940947,
        "order": 23
    },
    {
        "id": 11,
        "name": "Петропавловск",
        "name_lat": "Petropavlovsk",
        "time_zone": 0,
        "latitude": 54.865472,
        "longitude": 69.135602,
        "order": 24
    },
    {
        "id": 28,
        "name": "Рудный",
        "name_lat": "Rudnyi",
        "time_zone": 0,
        "latitude": 52.964432,
        "longitude": 63.133392,
        "order": 25
    },
    {
        "id": 38,
        "name": "Сатпаев",
        "name_lat": "Satpayev",
        "time_zone": 0,
        "latitude": 47.8967,
        "longitude": 67.5333,
        "order": 26
    },
    {
        "id": 12,
        "name": "Семей",
        "name_lat": "Semey",
        "time_zone": 0,
        "latitude": 50.416526,
        "longitude": 80.25617,
        "order": 27
    },
    {
        "id": 13,
        "name": "Талдыкорган",
        "name_lat": "Taldykorgan",
        "time_zone": 0,
        "latitude": 45.017837,
        "longitude": 78.382096,
        "order": 29
    },
    {
        "id": 14,
        "name": "Тараз",
        "name_lat": "Taraz",
        "time_zone": 0,
        "latitude": 42.901183,
        "longitude": 71.378309,
        "order": 30
    },
    {
        "id": 15,
        "name": "Темиртау",
        "name_lat": "Temirtau",
        "time_zone": 0,
        "latitude": 50.058756,
        "longitude": 72.953424,
        "order": 31
    },
    {
        "id": 47,
        "name": "Туркестан",
        "name_lat": "Turkestan",
        "time_zone": 0,
        "latitude": 43.301986,
        "longitude": 68.270345,
        "order": 32
    },
    {
        "id": 16,
        "name": "Уральск",
        "name_lat": "Oral",
        "time_zone": -1,
        "latitude": 51.20398,
        "longitude": 51.370375,
        "order": 33
    },
    {
        "id": 17,
        "name": "Усть-Каменогорск",
        "name_lat": "Oskemen",
        "time_zone": 0,
        "latitude": 49.948759,
        "longitude": 82.628459,
        "order": 34
    },
    {
        "id": 29,
        "name": "Шу",
        "name_lat": "Shu",
        "time_zone": 0,
        "latitude": 43.611782,
        "longitude": 73.760237,
        "order": 35
    },
    {
        "id": 18,
        "name": "Шымкент",
        "name_lat": "Shymkent",
        "time_zone": 0,
        "latitude": 42.315514,
        "longitude": 69.586907,
        "order": 36
    },
    {
        "id": 22,
        "name": "Щучинск",
        "name_lat": "Shchuchinsk",
        "time_zone": 0,
        "latitude": 52.942107,
        "longitude": 70.210131,
        "order": 37
    },
    {
        "id": 19,
        "name": "Экибастуз",
        "name_lat": "Ekibastuz",
        "time_zone": 0,
        "latitude": 51.729692,
        "longitude": 75.32662,
        "order": 38
    }
]

headers = {
    'authority': 'api.kino.kz',
    'pragma': 'no-cache',
    'cache-control': 'no-cache',
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

for i in range(len(cities)):
    params = (
        ('city', f'{cities[i]["id"]}'),
        ('state', '1'),
    )

    response = requests.get(
        'https://api.kino.kz/catalog/v1/cinemas', headers=headers, params=params)

    data = response.json()

    city_data = {
        "name": cities[i]['name'],
        "name_lat": cities[i]['name_lat'],
        "time_zone": cities[i]['time_zone'],
        "latitude": cities[i]['latitude'],
        "longitude": cities[i]['longitude'],
        "order": cities[i]['order']
    }

    response = requests.post('http://23.111.122.219:8000/cinema/cities/', data=city_data)
    
    # print(data['result'][0]['name'])
    city_id = response.json()

    print(city_id['name'])

    for res in data['result']:
        print("--------> ", cities[i]['name'], res['name'] )
        
        try: 
            soup = BS(res['description'], 'lxml')
            desc = soup.get_text()
        except: 
            desc = ""

        req_data = {
            "name": res['name'],
            "description": desc,
            "image_large": res['big_poster'],
            "image_small": res['small_poster'],
            "address": res['address'],
            "longitude": res['longitude'],
            "latitude": res['latitude'],
            "phone": res['phone'],
            "city": city_id['id']
        }

        response = requests.post('http://23.111.122.219:8000/cinema/', data=req_data)

# address: "Самал-2, д. 111, уг.ул. Жолдасбекова, ТРЦ «Достык Плаза», "
# # big_poster: "https://cdn.kino.kz/cinema/119/p1000x1000.jpg"
# latitude: "43.233518"
# longitude: "76.957576"
# name: "Cinemax (Dostyk Plaza) Dolby Atmos"
# phone: "+7 (727) 222 00 77, +7 701 026 73 69 (администрация), бронирование билетов не предусмотрено"
# provider_link: ""
# # small_poster: "https://cdn.kino.kz/cinema/119/p223x267.jpg"
