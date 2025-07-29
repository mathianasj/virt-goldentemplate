#!/bin/bash

oc run dummy --image centos/httpd-24-centos7 -n openshift-mtv --overrides='
{
  "spec": {
    "containers": [
      {
        "name": "dummy",
        "image": "centos/httpd-24-centos7",
        "volumeMounts": [
          {
            "mountPath": "/mnt/data",
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
oc cp VMware-vix-disklib-8.0.1-21562716.x86_64.tar.gz dummy:/mnt/data/ -n openshift-mtv