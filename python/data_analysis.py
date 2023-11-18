import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Load data from CSV
data = pd.read_csv('data.csv')

# Display the first few rows of the dataframe
print("First 5 rows of the data:")
print(data.head())

# Summary statistics using Pandas
summary_stats = data.describe()
print("\nSummary statistics:")
print(summary_stats)

print("\nMean of the data:")
print(data.mean())

print("\nMedian of the data:")
print(data.median())

print("\nStandard deviation of the data:")
print(data.std())


# Data visualization using Matplotlib
# Plotting a histogram of a numerical column
plt.hist(data['Age'], bins=30, edgecolor='black')
plt.title('Distribution of Age')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.show()

# Bar chart of average salary by department
avg_salary_by_department = data.groupby('Department')['Salary'].mean()
avg_salary_by_department.plot(kind='bar', color='skyblue')
plt.title('Average Salary by Department')
plt.xlabel('Department')
plt.ylabel('Average Salary')
plt.show()

# Scatter plot of Salary vs. Age
plt.scatter(data['Age'], data['Salary'], color='green',  alpha=0.5)
plt.title('Salary vs. Age')
plt.xlabel('Age')
plt.ylabel('Salary')
plt.show()
