# YOLO
This directory contains the code and files related to the YOLOv8 model. You will find files for training
the YOLOv8n model and the YOLOv7-tiny model, conducting hyperparameter search, generating metrics from a fine-tuned YOLOv8, as well
as a runnable demo script.

* `train.ipynb`: notebook for training YOLOv8 model.
* `metrics.ipynb`: notebook for extracting metrics from a trained YOLOv8 model
* `hyperparameter_search.ipynb`: notebook for searching for hyperparameters for the YOLOv8 model.
* `demo.py`: script that runs inference on a video file using a YOLOv8 model.
* `model.yaml`: file defining the YOLOv8 model structure we will use. This is important for inference
    since, by default, a fresh YOLO model predicts 80 classes, and we just want 1.
* `sam.ipynb`: notebook for zero-shot segmentation with SAM.
* `train_v7.ipynb`: notebook for training YOLOv7 model.


## Demo
To run the demo, you can use the `demo.py` script. The script will load a video file and YOLO model
and to live tracking of the garbage on the video. To run the demo you will need:

1. a trained YOLOv8 model `.pt` file
2. a video to run inference on
3. the model structure `.yaml` file (this you already have).

The script has the following parameters:
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