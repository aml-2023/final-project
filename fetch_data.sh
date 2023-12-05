#!/bin/bash

# Default values
dataset_type="coco"
output_folder="data"

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -t|--type)
            dataset_type="$2"
            shift
            shift
            ;;
        -o|--output)
            output_folder="$2"
            shift
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Validate dataset type
if [[ ! "$dataset_type" =~ ^(coco|yolo)$ ]]; then
    echo "Invalid dataset type. Use 'coco' or 'yolo'."
    exit 1
fi

# Define URLs based on the dataset type
if [ "$dataset_type" == "coco" ]; then
    url="https://universe.roboflow.com/ds/vunUxYLq9j?key=jDCfG8KbT0"
elif [ "$dataset_type" == "yolo" ]; then
    url="https://universe.roboflow.com/ds/UoC75yslyT?key=V3X5ZOBCmH"
fi

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
