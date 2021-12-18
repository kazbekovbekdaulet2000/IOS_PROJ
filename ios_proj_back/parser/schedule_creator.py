import requests

schedule = [
  [
    {
      "place_num": 1,
      "vis": True
    },
    {
      "place_num": 2,
      "vis": True
    },
    {
      "place_num": 3,
      "vis": True
    },
    {
      "place_num": 4,
      "vis": True
    },
    {
      "place_num": 5,
      "vis": True
    },
    {
      "place_num": 6,
      "vis": True
    },
    {
      "place_num": 7,
      "vis": True
    },
    {
      "place_num": 8,
      "vis": True
    },
    {
      "place_num": 9,
      "vis": True
    },
    {
      "place_num": 10,
      "vis": True
    }
  ],
  [
    {
      "place_num": 11,
      "vis": True
    },
    {
      "place_num": 12,
      "vis": True
    },
    {
      "place_num": 13,
      "vis": True
    },
    {
      "place_num": 14,
      "vis": True
    },
    {
      "place_num": 15,
      "vis": True
    },
    {
      "place_num": 16,
      "vis": True
    },
    {
      "place_num": 17,
      "vis": True
    },
    {
      "place_num": 18,
      "vis": True
    },
    {
      "place_num": 19,
      "vis": True
    },
    {
      "place_num": 20,
      "vis": True
    }
  ],
  [
    {
      "place_num": 21,
      "vis": True
    },
    {
      "place_num": 22,
      "vis": True
    },
    {
      "place_num": 23,
      "vis": True
    },
    {
      "place_num": 24,
      "vis": True
    },
    {
      "place_num": 25,
      "vis": True
    },
    {
      "place_num": 26,
      "vis": True
    },
    {
      "place_num": 27,
      "vis": True
    },
    {
      "place_num": 28,
      "vis": True
    },
    {
      "place_num": 29,
      "vis": True
    },
    {
      "place_num": 30,
      "vis": True
    }
  ],
  [
    {
      "place_num": 31,
      "vis": True
    },
    {
      "place_num": 32,
      "vis": True
    },
    {
      "place_num": 33,
      "vis": True
    },
    {
      "place_num": 34,
      "vis": True
    },
    {
      "place_num": 35,
      "vis": True
    },
    {
      "place_num": 36,
      "vis": True
    },
    {
      "place_num": 37,
      "vis": True
    },
    {
      "place_num": 38,
      "vis": True
    },
    {
      "place_num": 39,
      "vis": True
    },
    {
      "place_num": 40,
      "vis": True
    },
    {
      "place_num": 52,
      "vis": True
    }
  ],
  [
    {
      "place_num": 41,
      "vis": True
    },
    {
      "place_num": 42,
      "vis": True
    },
    {
      "place_num": 43,
      "vis": True
    },
    {
      "place_num": 44,
      "vis": True
    },
    {
      "place_num": 45,
      "vis": True
    },
    {
      "place_num": 46,
      "vis": True
    },
    {
      "place_num": 47,
      "vis": True
    },
    {
      "place_num": 48,
      "vis": True
    },
    {
      "place_num": 49,
      "vis": True
    },
    {
      "place_num": 50,
      "vis": True
    },
    {
      "place_num": 51,
      "vis": True
    }
  ],
  [
    {
      "place_num": 53,
      "vis": True
    },
    {
      "place_num": 54,
      "vis": True
    },
    {
      "place_num": 55,
      "vis": True
    },
    {
      "place_num": 56,
      "vis": True
    },
    {
      "place_num": 57,
      "vis": True
    },
    {
      "place_num": 58,
      "vis": True
    },
    {
      "place_num": 59,
      "vis": True
    },
    {
      "place_num": 60,
      "vis": True
    },
    {
      "place_num": 61,
      "vis": True
    },
    {
      "place_num": 62,
      "vis": True
    },
    {
      "place_num": 63,
      "vis": True
    }
  ],
  [
    {
      "place_num": 64,
      "vis": True
    },
    {
      "place_num": 65,
      "vis": True
    },
    {
      "place_num": 66,
      "vis": True
    },
    {
      "place_num": 67,
      "vis": True
    },
    {
      "place_num": 68,
      "vis": True
    },
    {
      "place_num": 69,
      "vis": True
    },
    {
      "place_num": 70,
      "vis": True
    },
    {
      "place_num": 71,
      "vis": True
    },
    {
      "place_num": 72,
      "vis": True
    },
    {
      "place_num": 73,
      "vis": True
    },
    {
      "place_num": 74,
      "vis": True
    },
    {
      "place_num": 75,
      "vis": True
    },
    {
      "place_num": 76,
      "vis": True
    },
    {
      "place_num": 77,
      "vis": True
    },
    {
      "place_num": 78,
      "vis": True
    }
  ],
  [
    {
      "place_num": 79,
      "vis": True
    },
    {
      "place_num": 80,
      "vis": True
    },
    {
      "place_num": 81,
      "vis": True
    },
    {
      "place_num": 82,
      "vis": True
    },
    {
      "place_num": 83,
      "vis": True
    },
    {
      "place_num": 84,
      "vis": True
    },
    {
      "place_num": 85,
      "vis": True
    },
    {
      "place_num": 86,
      "vis": True
    },
    {
      "place_num": 87,
      "vis": True
    },
    {
      "place_num": 88,
      "vis": True
    },
    {
      "place_num": 89,
      "vis": True
    },
    {
      "place_num": 90,
      "vis": True
    },
    {
      "place_num": 91,
      "vis": True
    },
    {
      "place_num": 92,
      "vis": True
    },
    {
      "place_num": 93,
      "vis": True
    }
  ]
]

counter = 0

cinema_id = 138

hall_id = 6

for i in range(len(schedule)):
    row_no = i+1
    row_data = {
        "row_no": row_no,
        "hall": hall_id
    }
    responce = requests.post(
        f'http://localhost:8000/cinema/{cinema_id}/halls/{hall_id}/', data=row_data)
    row_id = responce.json()['id']
    for j in range(len(schedule[i])):
        empty=False
        if schedule[i][j]['vis']:
            counter += 1
        else:
          empty=True

        seat_data = {
            "number": counter,
            "symbol": "",
            "picked": False,
            "price_reg": 1000,
            "price_stud": 700,
            "empty": empty,
            "row": row_id
        }

        responce = requests.post(
            f'http://localhost:8000/cinema/{cinema_id}/halls/{hall_id}/rows/', data=seat_data)

        print(responce.json())