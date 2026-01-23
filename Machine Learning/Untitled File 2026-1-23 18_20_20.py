import pandas as pd
import numpy as np
import seaborn as sns

df = pd.read_csv('/Workspace/Users/piyushchoudhary054@gmail.com/Data___Science___Learning__Regex/Machine Learning/Churn_Modelling - Churn_Modelling.csv')
df

df.info()

from sklearn.preprocessing import LabelEncoder
lb = LabelEncoder()


df['Surname' ] = lb.fit_transform(df['Surname' ])
df.head(4)
df['Geography' ] = lb.fit_transform(df['Geography' ])

from sklearn.model_selection import train_test_split

df['Gender' ] = lb.fit_transform(df['Gender' ])

x = df.drop(columns = ['Exited'])
y = df['Exited']

from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 0.2,random_state=42)

from sklearn.preprocessing import MinMaxScaler

mn = MinMaxScaler()

x_train_mn = mn.fit_transform(x_train)

x_train_new = pd.DataFrame(x_train_mn, columns = x_train.columns)

np.round(x_train_new.describe(),2)