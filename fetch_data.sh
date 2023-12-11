#!/bin/bash

# Default values
dataset_type="coco"
output_folder="data"
dataset_percentage="full"

# Function to display script usage
function display_help {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -t, --type TYPE         Specify dataset type ('coco' or 'yolo', default: 'coco')"
    echo "  -o, --output FOLDER     Specify output folder (default: 'data')"
    echo "  -p, --percentage PERC   Specify dataset percentage ('full' or 'subset', default: 'full')"
    echo "  -h, --help              Display this help message"
    exit 0
}


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
        -p|--percentage)
            dataset_percentage="$3"
            shift
            shift
            ;;
        -h|--help)
            display_help
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
  if [ "$dataset_percentage" == "full" ]; then
      url="https://universe.roboflow.com/ds/vunUxYLq9j?key=jDCfG8KbT0"
  elif [ "$dataset_percentage" == "subset" ]; then
      url=""
  fi
elif [ "$dataset_type" == "yolo" ]; then
  if [ "$dataset_percentage" == "full" ]; then
      url="https://universe.roboflow.com/ds/UoC75yslyT?key=V3X5ZOBCmH"
  elif [ "$dataset_percentage" == "subset" ]; then
      url="https://aml-2023.s3.eu-north-1.amazonaws.com/final-project/garbage_sub_yolo_10_percent.zip"
  fi
fi

echo "Downloading data"
# Download the 2data2 using curl, save it to roboflow.zip
curl -L "$url" > roboflow.zip

# Create the output folder
mkdir -p "$output_folder"

# Extract the content of roboflow.zip
unzip -d "$output_folder" -qq roboflow.zip

# Remove the downloaded zip file
rm roboflow.zip

echo "Data downloaded and extracted into $output_folder"
