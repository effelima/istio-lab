#!/bin/bash

istioctl install --set profile=demo -y
kubectl label namespace istio-system istio-injection=enabled