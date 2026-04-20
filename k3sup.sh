#!/usr/bin/env bash

export K8S_LOCAL_MASTER_IP=192.168.56.101
k3sup install --ip "${K8S_LOCAL_MASTER_IP}" --user vagrant --local-path /home/pgu/.kube/k8s-local --context k8s-local --k3s-extra-args "--cluster-init --advertise-address ${K8S_LOCAL_MASTER_IP} --flannel-iface eth1"

for ip in $(echo -e "192.168.56.111\n192.168.56.112") ; do
  k3sup join --ip "${ip}" --user vagrant --server-ip "${K8S_LOCAL_MASTER_IP}" --k3s-extra-args "--flannel-iface eth1"
done
