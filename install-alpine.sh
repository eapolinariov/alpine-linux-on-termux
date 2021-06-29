pkg update -y
pkg upgrade -y
pkg install wget -y
pkg install qemu-system-x86-64-headless qemu-utils -y
cd $HOME
mkdir alpine-linux
cd alpine-linux/
wget https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86_64/alpine-virt-3.14.0-x86_64.iso
qemu-img create -f qcow2 alpine.qcow2 15G
qemu-system-x86_64 -m 2048 -nic user -boot d -cdrom alpine-virt-3.14.0-x86_64.iso -hda alpine.qcow2 -nographic
