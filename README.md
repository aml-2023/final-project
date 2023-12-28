# Final Project
This repository contains code and files for the final project of Advanced Machine Learning 2023/2024 at 
Sapienza University. The project is about fine tuning state of the art object detection models YOLO and DETR
to detect garbage in images.

The repository is organised as follows:

* [`yolo`](yolo): contains everything related to training, evaluating, searching for hyperparameters, running inference,
    of the YOLO model.
* [`detr`](detr): contains everything related to training, evaluating, searching for hyperparameters, running inference,
    using the DETR model.

# Data
For any of the models, it is import to first fetch the garbage data. You can achieve this by running the `fetch-data.sh` 
bash script. The data by default will be stored in a `data` directory.

Script options.
```
fetch_data.sh --help

Usage: fetch_data.sh [OPTIONS]
Options:
  -t, --type TYPE         Specify dataset type ('coco' or 'yolo', default: 'coco')
  -o, --output FOLDER     Specify output folder (default: 'data')
  -p, --percentage PERC   Specify dataset percentage ('full' or 'subset', default: 'full')
  -h, --help              Display this help message
```

Running the command.
```
bash fetch_data.sh --type <type> --output <output directory> --percentage <data size>
```

The final folder will have the following structure:

```
|-- data
|   |-- train
|   |-- test
|   |-- val
```
