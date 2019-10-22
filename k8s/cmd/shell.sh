#!/bin/bash

# froce delete pod 
kubectl delete pod php-t846w -n jx --grace-period=0 --force
