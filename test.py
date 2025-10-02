# Q1
import sys
version_info = sys.version_info
output = str(version_info.major) + "." + str(version_info.minor)
assert output == "3.11"

# Q2
from sklearn import datasets, linear_model
import numpy as np

# Load the diabetes dataset
diabetes_X, diabetes_y = datasets.load_diabetes(return_X_y=True)
assert True == True