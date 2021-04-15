#!/usr/bin/env bash

sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.2 1120
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.1 1110
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-11.0 1100
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-10.2 1020
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-10.1 1010

sudo update-alternatives --config cuda
