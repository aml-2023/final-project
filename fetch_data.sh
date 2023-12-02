#!/bin/bash

# Define the URL with the appropriate API key
url="https://universe.roboflow.com/ds/vunUxYLq9j?key=jDCfG8KbT0"

# Define the output folder name
output_folder="data"

echo "Downloading data"
# Download the 2data2 using curl, save it to roboflow.zip
curl -L "$url" > roboflow.zip

# Create the output folder
mkdir -p "$output_folder"

# Extract the content of roboflow.zip
unzip -d "$output_folder" roboflow.zip

# Remove the downloaded zip file
rm roboflow.zip

echo "Data downloaded and extracted into $output_folder"
