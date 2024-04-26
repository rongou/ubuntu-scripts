#!/usr/bin/env bash

sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.4 1241
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.3 1230
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.2 1220
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.1 1211
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.0 1200
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.8 1180
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.7 1170
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.3 1130
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.2 1120
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.1 1110
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.0 1100
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-10.2 1020
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-10.1 1010

sudo update-alternatives --config cuda
