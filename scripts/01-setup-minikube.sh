#!/bin/bash

minikube start --driver=docker --memory=4000 --cpus=2
minikube addons enable metrics-server