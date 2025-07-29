#!/bin/bash

oc run dummy --image image-registry.openshift-image-registry.svc:5000/openshift/httpd:latest -n openshift-mtv --overrides='
{
  "spec": {
    "containers": [
      {
        "name": "dummy",
        "image": "image-registry.openshift-image-registry.svc:5000/openshift/httpd:latest",
        "volumeMounts": [
          {
            "mountPath": "/utils",
            "name": "my-volume"
          }
        ]
      }
    ],
    "volumes": [
      {
        "name": "my-volume",
        "persistentVolumeClaim": {
          "claimName": "vddk-download"
        }
      }
    ]
  }
}'

oc cp ./VMware-vix-disklib-8.0.1-21562716.x86_64.tar.gz openshift-mtv/dummy:/mnt/data/VMware-vix-disklib-8.0.1-21562716.x86_64.tar.gz