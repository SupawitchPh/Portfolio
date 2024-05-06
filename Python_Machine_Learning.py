# Train Model from mtcars database.

import csv
import requests as re
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeRegressor

mtcars = pd.read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")

X = mtcars[["hp", "wt", "am"]]
y = mtcars["mpg"]

X_test, X_train, y_test, y_train = sklearn.model_selection.train_test_split(X, y, test_size = 0.2, random_state = 25)

# LinearRegression
model_linear = sklearn.linear_model.LinearRegression().fit(X_train, y_train)
pred = model_linear.predict(X_test)
mae = np.mean(np.absolute(y_test - pred))
mse = np.mean((y_test - pred)**2)
print(mae, mse)
## 2.1405624003531107 8.522124342681524

# DecisionTreeRegressor
model_tree = sklearn.tree.DecisionTreeRegressor().fit(X_train, y_train)
pred = model_tree.predict(X_test)
mae = np.mean(np.absolute(y_test - pred))
mse = np.mean((y_test - pred)**2)
print(mae, mse)
## 2.3999999999999995 10.332799999999995
