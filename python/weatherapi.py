import json
import requests

print('Please enter your zip code: ')
zip =input()

r = requests.get('http://api.openweathermap.org/data/2.5/weather?zip=%s&appid=3d3709b3233ef55a3ebc8cfa1de2ffa7' % zip)

data = r.json()

print(data['weather'][0]['description'])