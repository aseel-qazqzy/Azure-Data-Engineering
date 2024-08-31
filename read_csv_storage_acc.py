import pandas as pd

url = "https://data400089.blob.core.windows.net/data/ActivityLog-01.csv"

response = pd.read_csv(url)
#maximum number of columns to display 
pd.set_option('display.max_column', None)

#maximum number of rows to display 
pd.set_option('display.max_rows', None)

print(type(response))