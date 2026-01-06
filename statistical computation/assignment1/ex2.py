#read csv
import pandas as pd
df = pd.read_csv('LifeExpectancy.csv')

#print first 5 rows
print(df.head())

#regression model
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
import pandas as pd
import statsmodels.api as sm
import seaborn as sns
import matplotlib.pyplot as plt

# Convert categorical columns to numerical using one-hot encoding
df_dum = pd.get_dummies(df, columns=['country'], drop_first=True)
X = df_dum.drop(['Life expectancy '], axis=1)
y = df_dum['Life expectancy ']
X = sm.add_constant(X)
model_full = sm.OLS(y, X).fit()
print(model_full.summary())


#plotting results


#determine feature significance

