#coding=utf-8
import requests

r = requests.get('https://movie.douban.com/tag/喜剧')
print r.text.encode('utf-8')