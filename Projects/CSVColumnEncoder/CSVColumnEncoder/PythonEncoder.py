import sys
import os
import pandas as pd
from sklearn.preprocessing import LabelEncoder

# Ensure the correct number of arguments are passed
if len(sys.argv) != 3:
    print("Usage: python3 PythonEncoder.py <input_file> <output_file>")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

# Check if the output directory exists
output_dir = os.path.dirname(output_file)
if not os.path.exists(output_dir):
    print(f"Error: Output directory {output_dir} does not exist.")
    sys.exit(1)

# Read the CSV file
df = pd.read_csv(input_file)

# Label encode all object (string) columns
for col in df.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    df[col] = le.fit_transform(df[col].astype(str))

# Save the encoded DataFrame to the output file
df.to_csv(output_file, index=False)
print(f"Encoded file saved to {output_file}")
