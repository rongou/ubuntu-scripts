#!/usr/bin/env bash

sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.8 1280
sudo update-alternatives --install /usr/local/cuda cuda /usr/local/cuda-12.6 1262

sudo update-alternatives --config cuda
