# Homelab Setup

Heavy WIP, so very much subject to change 

## Pre-Installation

- Debian 13 amd64: https://www.debian.org/download
- Rufus: https://rufus.ie/en/

### Rufus settings
- partition scheme: GPT (this depends on your device, but unless your hardware is very old, choose GPT)
- target system: UEFI (also depends on device, but most likely UEFI)
- file system: FAT32
- everything else: default

## Installation
- graphical
- domain name: none
- root account: not set, **see below**
- partitioning: **see below**
- package manager: deb.debian.org
- software selection:
    - Debian desktop environment: no / uncheck any selected desktop(s)
    - web server: no
    - SSH server: yes
    - standard system utilities: yes
    - Debian Blend: no
- install GRUB bootloader: yes

### 'Root' account
We want the root account disabled for now, leave the root password blank

### Partitioning
For 1 single disk - use one of the guided options
For 2+ disks (in my case: NVMe and SSD) - choose "Manual":

#### disk 1: NVMe (/dev/nvme0n1):
- /
    - type: ext4
    - size: 60GB
    - bootable: no
- /boot/efi
    - type: EFI system partition
    - size: 512MB
    - bootable: yes
- swap
    - type: swap
    - size 4GB (this depends on memory, I have 16GB. If you have <= 8GB, swap should be the same size as your memory)
    - bootable: no

#### disk 2: SSD (/dev/sda1):
- /home
    - type: ext4
    - size: 2TB (use the whole disk)
    - bootable: no
    - later in /etc/fstab: add `noatime` under the disk options

## Post-Installation

Largely free to do as you please from here, as a bare minimum, set up security

### Security stack
- ufw: firewall
    - enable
    - default incoming: deny
    - default outgoing: allow
    - allow ssh access from LAN if needed: `sudo ufw allow from 192.168.0.0/24 to any port 22 proto tcp`
- fail2ban: intrusion and brute-force attack prevention
- Tailscale: secure VPN for remote access
- OpenSSH:
    - generate keypair from client device
    - setup ~/.ssh
        - `sudo chown <your username>:<your username> ~/.ssh`
        - `sudo chmod 700 ~/.ssh`
        - `sudo chown <your username>:<your username> ~/.ssh/authorized_keys`
        - `sudo chmod 600 ~/.ssh/authorized_keys`
    - id_<algo> - keep private
    - id_<algo>.pub - copy to server `ssh-copy-id`
- SSH hardening - /etc/sshd/sshd_config:
    ```
    MaxSessions 2
    AllowUsers <your username>
    PermitRootLogin no
    PasswordAuthentication no
    PubkeyAuthentication yes
    X11Forwarding no
    ```

### Optimisation
- auto-cpufreq: CPU and power usage optimiser

### TODO
Document rest of process for Nextcloud, Apache, etc...

