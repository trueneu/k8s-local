# Local k8s cluster on VirtualBox machines

## Prerequisites

- VirtualBox (<https://www.virtualbox.org/>)
- k3s (<https://k3s.io/>) (maybe via `k3d` on mac? <https://k3d.io/stable/> <https://formulae.brew.sh/formula/k3d>)
- k3sup (<https://github.com/alexellis/k3sup>)
- vagrant (<https://developer.hashicorp.com/vagrant>)

## Preparation

Edit the SSH key name in `Vagrantfile` and `ssh-k8s-local.conf`.

## Installation

``` shell
vagrant up
./k3sup.sh
```

Add to `~/.ssh/config` before catch-all (`Host *`) or other conflicting sections:

``` text
Include ~/src/k8s-local/ssh-k8s-local.conf
```
