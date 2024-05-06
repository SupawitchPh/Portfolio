# Import Top 200 Music Billboard Global on billboard.com to create dataframe.

!pip install gazpacho

import requests as re
import pandas as pd
import gazpacho as gaz
import csv

url = "https://www.billboard.com/charts/billboard-global-200/"
response = re.get(url)
billboard = gaz.Soup(response.text)

songs = billboard.find("h3", {"id": "title-of-a-story", "class": "c-title  a-no-trucate a-font-primary-bold-s"})
songs_name = [song.strip() for song in songs]

artists = billboard.find("span", {"class": "c-label  a-no-trucate"})
artists_name = [artist.strip() for artist in artists]

numbers = list(range(1, 201))

df = pd.DataFrame({
    "Rank": numbers,
    "Title": songs_name,
    "Artist": artists_name
})

df.to_csv("Billboard_Global_200.csv", index = False)
