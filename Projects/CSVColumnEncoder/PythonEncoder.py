import sys
import pandas as pd
from sklearn.preprocessing import LabelEncoder

input_file = sys.argv[1]
output_file = sys.argv[2]

df = pd.read_csv(input_file)

# Label encode all object (string) columns
for col in df.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    df[col] = le.fit_transform(df[col].astype(str))

df.to_csv(output_file, index=False)
