import requests
import json 

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

# for i in range(0,30): 
#   print(i)
#   params = (
#       ('city', i),
#       # ('state', ),
#   )
#   response = requests.get('https://api.kino.kz/catalog/v1/cinemas', headers=headers, params=params)

#   with open(f'city_info/city_{i}.json', 'w') as f:
#     json.dump(response.json(), f)


response = requests.get('https://api.kino.kz/catalog/v1/cinemas', headers=headers)
# print(response.json())

with open(f'city_info/all.json', 'w') as f:
    json.dump(response.json(), f)