import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

""" Pandas Usage """

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
print(data.mean(numeric_only=True))

print("\nMedian of the data:")
print(data.median(numeric_only=True))

print("\nStandard deviation of the data:")
print(data.std(numeric_only=True))




""" NumPy Usage """

# Extract 'Salary' and 'Age' columns as NumPy arrays
salary_data = data['Salary'].to_numpy()
age_data = data['Age'].to_numpy()

# Perform data analysis using NumPy
mean_salary = np.mean(salary_data)
median_salary = np.median(salary_data)
std_dev_salary = np.std(salary_data)

mean_age = np.mean(age_data)
median_age = np.median(age_data)
std_dev_age = np.std(age_data)

# Display the results
print("Salary Statistics:")
print("Mean Salary:", mean_salary)
print("Median Salary:", median_salary)
print("Standard Deviation of Salary:", std_dev_salary)

print("\nAge Statistics:")
print("Mean Age:", mean_age)
print("Median Age:", median_age)
print("Standard Deviation of Age:", std_dev_age)



# Example 1: Creating NumPy arrays
arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.arange(0, 10, 2)  # Array from 0 to 8 with a step of 2
arr3 = np.linspace(0, 1, 5)  # Array with 5 evenly spaced values from 0 to 1

print("Array 1:")
print(arr1)
print("Array 2:")
print(arr2)
print("Array 3:")
print(arr3)

# Example 2: Mathematical operations
result_add = arr1 + arr2
result_multiply = arr1 * 2
result_power = np.power(arr1, 2)  # Element-wise square

print("\nArray Addition:")
print(result_add)
print("\nArray Multiplication by 2:")
print(result_multiply)
print("\nArray Squared:")
print(result_power)

# Example 3: Statistical calculations
mean_value = np.mean(arr1)
median_value = np.median(arr2)
std_deviation = np.std(arr3)

print("\nMean of Array 1:", mean_value)
print("Median of Array 2:", median_value)
print("Standard Deviation of Array 3:", std_deviation)

# Example 4: Random number generation
random_integers = np.random.randint(1, 10, size=(3, 3))  # 3x3 matrix of random integers between 1 and 10
random_normal = np.random.normal(0, 1, size=5)  # 5 random numbers from a normal distribution with mean 0 and std deviation 1

print("\nRandom Integers:")
print(random_integers)
print("\nRandom Numbers from Normal Distribution:")
print(random_normal)


""" Data visualization using Matplotlib """

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

# Pie chart of distribution of employees by department
department_distribution = data['Department'].value_counts()
department_distribution.plot(kind='pie', autopct='%1.1f%%', startangle=90)
plt.title('Distribution of Employees by Department')
plt.axis('equal') #  Equal aspect ratio ensures that pie is drawn as a circle.
plt.show()

# Box plot of salary distribution by department
data.boxplot(column='Salary', by='Department', vert=False)
plt.title('Salary Distribution by Department')
plt.xlabel('Salary')
plt.ylabel('Department')
plt.show()

# Correlation matrix and heatmap
correlation_matrix = data.corr(numeric_only=True)
plt.imshow(correlation_matrix, cmap='coolwarm', interpolation='none', aspect='auto')
plt.colorbar()
plt.xticks(range(len(correlation_matrix)), correlation_matrix.columns, rotation='vertical')
plt.yticks(range(len(correlation_matrix)), correlation_matrix.columns)
plt.title('Correlation Matrix')
plt.show()
