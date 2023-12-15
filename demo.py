# A script showing the garbage bounding boxes around a chosen video file.
import argparse
import torch
from ultralytics import YOLO
from ultralytics.nn.tasks import DetectionModel

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Do Object Detection in a Video for Garbage using YOLO.")

    # Add command-line arguments
    parser.add_argument("-v", "--video", help="Path to the video file", required=True, type=str)
    parser.add_argument("-m", "--model", help="Path to the model checkpoint file (model.pt)", required=True, type=str)
    parser.add_argument("-c", "--config", help="Path to the model configuration file (model.yaml)", required=True, type=str)
    parser.add_argument("-t", "--threshold", help="The confidence threshold for the model to predict a garbage bounding box. Default (0.1).", default=0.1, type=float)

    # Parse the command-line arguments
    args = parser.parse_args()

    # Create the detection model using the config and model parameters
    det = DetectionModel(args.config)
    det.load(torch.load(args.model))

    # create the YOLO model and give it the detection model
    model = YOLO(model=args.model, task="detect")  # load a pretrained model (recommended for training)
    model.model = det

    # track the video
    model.track(args.video, show=True, conf=args.threshold)