# Install Alpine Linux on Termux using QEMU

> For this case, we will install ** Alpine Linux architecture x86_64 in the Virtual version **. Download the latest version of the virtual ISO from the Alpine Linux website. Go to the official website https://alpinelinux.org/downloads/

> This was only tested on Xiaomi Redmi Note 8.

> Note: You can run the script ```install-alpine.sh``` to skip most commands.
Just remember you must have git installed to do ```git clone``` to the repository


## Steps before installing Alpine Linux:
> ### TERMUX
* #### 1. Download and install F-Droid: https://f-droid.org/F-Droid.apk
* #### 2. Search for Termux in F-Droid
* #### 3. Install and open Termux
* #### 4. Setup Termux packages:
```
pkg update -y
```
```
pkg upgrade -y
```
```
pkg install wget -y
```

> ### QEMU - Alpine Linux
* ####  Install QEMU and download Virtual ISO Alpine Linux
```
pkg install qemu-system-x86-64-headless qemu-utils -y
```
```
cd $HOME
```
```
mkdir alpine-linux
```
```
cd alpine-linux/
```
```
wget <VIRTUAL_ISO_URL>
```
```
wget https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86_64/alpine-virt-3.14.0-x86_64.iso
```

## Install Alpine Linux using Qemu
* #### Create the Virtual Machine
```
qemu-img create -f qcow2 alpine.qcow2 15G
```
```
qemu-system-x86_64 -m 2048 -nic user -boot d -cdrom <VIRTUAL_ISO> -hda alpine.qcow2 -nographic
```
```
qemu-system-x86_64 -smp 2 -m 2048 \
  -drive file=alpine.qcow2,if=virtio \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -cdrom alpine-virt-3.14.0-x86_64.iso -boot d \
  -nographic
```

> * This install the **non-graphical version**, this means that we will only use the terminal

* #### Log in as ```root``` (no password) and run:
```
setup-alpine
```
> Follow the setup-alpine installation steps.
> Use ```poweroff``` to shut down the machine.

* #### Booting the Virtual Machine
After the installation QEMU can be started from disk image ```(-boot c)``` without CDROM.
```
qemu-system-x86_64 -smp 2 -m 2048 \
  -drive file=alpine.qcow2,if=virtio \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -nographic
```

## For more information about the commands seen here, visit https://wiki.alpinelinux.org/wiki/Qemu

## Qemu commands based on https://youtu.be/RL96VSKzAQo
