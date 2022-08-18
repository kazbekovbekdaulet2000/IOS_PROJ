import requests
import json 

headers = {
    'sec-ch-ua': '"Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"',
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',
}

date = "2021-12-04"
params = (
    ('cinemaId', '1'),
    ('date', f'{date}'),
)

response = requests.get(
    'https://kino.kz/api/movie/sessions?date=2021-12-05&city_id=2', headers=headers)

with open(f'kinoplex_data_{date}.json', 'w') as f:
    json.dump(response.json(), f)