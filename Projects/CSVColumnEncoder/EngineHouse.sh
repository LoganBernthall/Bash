#!/bin/bash

#By - Logan Bernthall 25/06/25

#Engine house - Neat name for the variable and functuin file! :)


############################Engine house
CsvDropDirectory="./FileDrop" #Area in which where the csv files will be dropped
CsvOutputDirectory="./FileOutputs" #Area in which the encoded files will be outputted
PyScript="./PythonEncoder.py" #Python script for the encoder

Execute (){

for file in "$CsvDropDirectory"/*.csv; do
    filename=$(basename "$file")
    output_file="$CsvOutputDirectory/encoded_$filename"

    echo "Processing $filename..."
    python3 "$PyScript" "$file" "$output_file"
done

echo "All files processed and saved to $ENCODED_DIR"

}
