#!/bin/bash

images=(
kube-apiserver:v1.17.4
kube-controller-manager:v1.17.4
kube-scheduler:v1.17.4
kube-proxy:v1.17.4
pause:3.1
etcd:3.4.3-0
coredns:1.6.5
)

for image in ${images[@]}
do
  tag=$(echo $image | awk -F":" '{print $1}')
  docker pull xulimin1986/mirror:$tag
  docker tag xulimin1986/mirror:$tag k8s.gcr.io/$image
done

