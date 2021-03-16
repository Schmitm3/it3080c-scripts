import requests, re
from bs4 import BeautifulSoup

data = requests.get("https://www.eotechinc.com/holographic-weapon-sights/exps").content
soup = BeautifulSoup(data, 'html.parser')

d = soup.find("strong", {"class": "product name product-item-name"})
name = d.text.strip()

r = soup.find("div", {"class":"product-reviews-summary short no-rating"})
review = r.text.strip()

p = soup.find("span", {"class":"price"})
price = p.string.strip()

print("The item is the %s, it has %s reviews, and the price is %s" % (name,review,price))