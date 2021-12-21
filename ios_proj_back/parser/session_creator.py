import requests

headers = {
    'authority': 'kino.kz',
    'sec-ch-ua': '"Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"',
    'sec-ch-ua-mobile': '?0',
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',
    'sec-ch-ua-platform': '"macOS"',
    'accept': '*/*',
    'sec-fetch-site': 'same-origin',
    'sec-fetch-mode': 'cors',
    'sec-fetch-dest': 'empty',
    'referer': 'https://kino.kz/movie/9238',
    'accept-language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
    'cookie': '_ga=GA1.2.1220270013.1638614551; _ym_uid=1638614551945410463; _ym_d=1638614551; _fbp=fb.1.1638614551169.1273544858; _city=0JDQu9C80LDRgtGL; token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Ijc3MDc3MTIxNTAwLW5ldy11c2VyLWNyb3NzLWF1dGhAa2luby5reiIsImlkIjoyNDg2ODYsInBob25lIjoiNzcwNzcxMjE1MDAifQ.o-4OIF_zq9r67a2Q5JOF2hp0i7_ysx1x2_t0_qWNrNo; session=eyJpZCI6MjQ4Njg2LCJlbWFpbCI6Ijc3MDc3MTIxNTAwLW5ldy11c2VyLWNyb3NzLWF1dGhAa2luby5reiIsInBob25lIjoiNzcwNzcxMjE1MDAiLCJwYXNzd29yZCI6IiIsImZpcnN0X25hbWUiOiLQkdC10LrQtNOZ0YPQu9C10YIiLCJsYXN0X25hbWUiOiLSmtCw0LfQsdC10LrQvtCyIiwiYmlydGhfZGF0ZSI6IjIwMDAtMTItMTVUMDA6MDA6MDBaIiwiYXZhdGFyX2lkIjpudWxsLCJhdmF0YXJfdXJsIjoiIiwic3RhdHVzIjp0cnVlLCJjcmVhdGVkX2F0IjoiMjAyMS0xMC0zMFQwNDo1NDo0OS44ODMyMTRaIiwidXBkYXRlZF9hdCI6IjIwMjEtMTItMTFUMTQ6MTc6MjEuMjg1Mzc2WiIsImNpdHlfaWQiOjIsIm5vdGlmaWNhdGlvbiI6ZmFsc2UsImdlbnJlc19hZGRlZCI6ZmFsc2V9; _gid=GA1.2.295087087.1639824871; _ym_isad=2; __gads=ID=03742f2bb3f26269-22dfbf110ccd00e2:T=1638614551:RT=1640069962:S=ALNI_Maj93PQWGOrJDtJ5rim7jIUkRJTkQ',
}

params = (
    ('movieId', '9469'),
    ('date', '2021-12-21'),
    ('city_id', '2'),
)

res = requests.get('https://kino.kz/api/movie/sessions', headers=headers, params=params)

sessions = res.json()['result']['sessions']

halls = requests.get('http://localhost:8000/cinema/11/halls/')


for i in sessions:
  session = i['session']

  hall = i['hall']['hall_order']+1

  hall = hall + 2
  if hall >= 13:
    hall = 3
   
  data={
    "time": session["session_date_tz"],
    "stud_price": session['student'],
    "price": session['adult'],
    "film": 1,
    "cinema": 11,
    "hall": hall
  }

  res_data = requests.post('http://localhost:8000/cinema/11/sessions/', data)

  # print(res_data.json())
