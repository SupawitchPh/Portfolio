import requests as re
from time import sleep
import pandas as pd
import csv

nums = list(range(1,11))
result = []
col_names = ["name", "height", "mass", "gender"]

for i in nums:
    url = f"https://swapi.dev/api/people/{i}"
    response = requests.get(url)
    data = response.json()
    row = [
        data["name"],
        data["height"],
        data["mass"],
        data["gender"]
    ]
    result.append(row)

df = pd.DataFrame(result, columns = col_names)
df.to_csv("swapi.csv", index = False)
