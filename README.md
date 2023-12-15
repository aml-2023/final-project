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

# Demo
To run the demo, you can use the `demo.py` script. The script will load a video file and YOLO model
and to live tracking of the garbage on the video.

```
python demo.py --help

usage: demo.py [-h] -v VIDEO -m MODEL -c CONFIG

Do Object Detection in a Video for Garbage using YOLO.

options:
  -h, --help            show this help message and exit
  -v VIDEO, --video VIDEO
                        Path to the video file
  -m MODEL, --model MODEL
                        Path to the model checkpoint file (model.pt)
  -c CONFIG, --config CONFIG
                        Path to the model configuration file (model.yaml)
  -t THRESHOLD, --threshold THRESHOLD
                        The confidence threshold for the model to predict a garbage bounding box. Default (0.1).                  
```

To run the script, you need to provide the

* video using the `-v` flag
* `model.pt` file using the `-m` flag
* `model.yaml` file using the `-c` flag

Example
```bash
python demo.py -v="demo/garbage_demo_rome.mp4" -m="demo/model.pt" -c="demo/model.yaml"
```