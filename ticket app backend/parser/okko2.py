import requests
import urllib.request

alias = "rons-gone-wrong"

url_list = "https://ctx.playfamily.ru/screenapi/v1/noauth/collection/web/1?elementAlias=topfilms&elementType=COLLECTION&limit=40&rating%22%3A7%2C%22"
url_item_single = f"https://ctx.playfamily.ru/screenapi/v1/noauth/moviecard/web/1?elementAlias={alias}&elementType=MOVIE"
 
def film_link(alias):
    return f"https://ctx.playfamily.ru/screenapi/v1/noauth/moviecard/web/1?elementAlias={alias}&elementType=MOVIE"

res = requests.get(url_list)

def getNormalURL(trailer):
    for t in trailer:
        if(t['media']['width'] < 800 and t['media']['mimeType'] == 'mp4/ts'):
            return t
            

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

        trailer = film_detail['trailers']['items']
        url = getNormalURL(trailer)['url']
        res = urllib.request.urlopen(url)
        finalurl = res.geturl()
        print(finalurl)
        
        break
