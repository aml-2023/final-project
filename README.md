# Final Project

# Data
To fetch the garbage data, run the `fetch-data.sh` bash script. The data will be
stored in a `data` directory.

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