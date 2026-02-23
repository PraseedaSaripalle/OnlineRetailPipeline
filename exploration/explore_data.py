import pandas as pd

# Load dataset
file_path = "data/OnlineRetail_Final Project Dataset.xlsx"
df = pd.read_excel(file_path)

print("First 5 Rows:")
print(df.head())

print("\nColumns:")
print(df.columns)

print("\nData Types:")
print(df.dtypes)

print("\nMissing Values:")
print(df.isnull().sum())

print("\nBasic Statistics:")
print(df.describe(include='all'))

print("\nTotal Rows:", len(df))