## Week 4 Homework Submission File: Linux Systems Administration

### Step 1: Ensure/Double Check Permissions on Sensitive Files

1. Permissions on `/etc/shadow` should allow only `root` read and write access.

    - Command to inspect permissions: root@UbuntuDesktop:/etc# ls -l shadow
--w-r----- 1 root shadow 2888 Feb  4 13:04 shadow

    - Command to set permissions (if needed): root@UbuntuDesktop:/etc# chmod u+r shadow
root@UbuntuDesktop:/etc# ls -l shadow
-rw-r----- 1 root shadow 2888 Feb  4 13:04 shadow
root@UbuntuDesktop:/etc# chmod g-r shadow
You have new mail in /var/mail/root
root@UbuntuDesktop:/etc# ls -l shadow
-rw------- 1 root shadow 2888 Feb  4 13:04 shadow

2. Permissions on `/etc/gshadow` should allow only `root` read and write access.

    - Command to inspect permissions:ls -l gshadow
--w-r----- 1 root shadow 1076 Feb  4 13:04 gshadow

    - Command to set permissions (if needed): sysadmin@UbuntuDesktop:/etc$  sudo chmod 600 gshadow
sysadmin@UbuntuDesktop:/etc$ ls -l gshadow
-rw------- 1 root shadow 1076 Feb  4 13:04 gshadow

3. Permissions on `/etc/group` should allow `root` read and write access, and allow everyone else read access only.

    - Command to inspect permissions:  ls -l group
-rw-r--r-- 1 root root 1303 Feb  4 13:04 group

    - Command to set permissions (if needed): sudo chmod 604 group
sysadmin@UbuntuDesktop:/etc$ ls -l group
-rw----r-- 1 root root 1303 Feb  4 13:04 group

4. Permissions on `/etc/passwd` should allow `root` read and write access, and allow everyone else read access only.

    - Command to inspect permissions: ls -l passwd
-rw-r--r-- 1 root root 3214 Feb  4 13:04 passwd

    - Command to set permissions (if needed): sudo chmod 604 passwd
sysadmin@UbuntuDesktop:/etc$ ls -l passwd
-rw----r-- 1 root root 3214 Feb  4 13:04 passwd

### Step 2: Create User Accounts

1. Add user accounts for `sam`, `joe`, `amy`, `sara`, and `admin`.

    - Command to add each user account (include all five users): sudo adduser sam
[sudo] password for sysadmin:
Adding user `sam' ...
Adding new group `sam' (1014) ...
Adding new user `sam' (1004) with group `sam' ...
Creating home directory `/home/sam' ...
Copying files from `/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for sam
Enter the new value, or press ENTER for the default
        Full Name []: sam
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y

sudo adduser joe
Adding user `joe' ...
Adding new group `joe' (1015) ...
Adding new user `joe' (1012) with group `joe' ...
Creating home directory `/home/joe' ...
Copying files from `/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for joe
Enter the new value, or press ENTER for the default
        Full Name []: joe
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y

sudo adduser amy
Adding user `amy' ...
Adding new group `amy' (1016) ...
Adding new user `amy' (1013) with group `amy' ...
Creating home directory `/home/amy' ...
Copying files from `/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for amy
Enter the new value, or press ENTER for the default
        Full Name []: amy
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y

sudo adduser sara
Adding user `sara' ...
Adding new group `sara' (1017) ...
Adding new user `sara' (1014) with group `sara' ...
The home directory `/home/sara' already exists.  Not copying from `/etc/skel'.
Enter new UNIX password:
Retype new UNIX password:
Sorry, passwords do not match
passwd: Authentication token manipulation error
passwd: password unchanged
Try again? [y/N] y
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for sara
Enter the new value, or press ENTER for the default
        Full Name []: sara
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y

sudo adduser admin
Adding user `admin' ...
Adding new group `admin' (1018) ...
Adding new user `admin' (1015) with group `admin' ...
Creating home directory `/home/admin' ...
Copying files from `/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for admin
Enter the new value, or press ENTER for the default
        Full Name []: admin
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y



2. Ensure that only the `admin` has general sudo access.

    - Command to add `admin` to the `sudo` group: sudo addgroup sudo admin
addgroup: The user `sudo' does not exist.
sysadmin@UbuntuDesktop:/etc$ groups admin
admin : admin
sysadmin@UbuntuDesktop:/etc$ sudo usermod -G sudo admin
sysadmin@UbuntuDesktop:/etc$ groups admin
admin : admin sudo
sysadmin@UbuntuDesktop:/etc$  

### Step 3: Create User Group and Collaborative Folder

1. Add an `engineers` group to the system.

    - Command to add group: sudo addgroup engineers
Adding group `engineers' (GID 1019) ...
Done.

2. Add users `sam`, `joe`, `amy`, and `sara` to the managed group.

    - Command to add users to `engineers` group (include all four users): sudo usermod -G engineers sam
sysadmin@UbuntuDesktop:/etc$ sudo usermod -G engineers joe
sysadmin@UbuntuDesktop:/etc$ sudo usermod -G engineers amy
sysadmin@UbuntuDesktop:/etc$ sudo usermod -G engineers sara
sysadmin@UbuntuDesktop:/etc$ sudo libuser-lid -g engineers
 sam(uid=1004)
 joe(uid=1012)
 amy(uid=1013)
 sara(uid=1014)

3. Create a shared folder for this group at `/home/engineers`.

    - Command to create the shared folder: sysadmin@UbuntuDesktop:/home$ sudo mkdir engineers
sysadmin@UbuntuDesktop:/home$ ls
adam   amy    engineers  instructor  joe   max    sam   student   user.hashes
admin  billy  http       jane        john  sally  sara  sysadmin  vagrant

4. Change ownership on the new engineers' shared folder to the `engineers` group.

    - Command to change ownership of engineer's shared folder to engineer group: sysadmin@UbuntuDesktop:/home$ ls -ld engineers/
drwxr-xr-x 2 sysadmin sysadmin 4096 Mar 20 02:29 engineers/
sysadmin@UbuntuDesktop:/home$ sudo chgrp engineers engineers
sysadmin@UbuntuDesktop:/home$ ls -ld engineers/
drwxr-xr-x 2 sysadmin engineers 4096 Mar 20 02:29 engineers/

### Step 4: Lynis Auditing

1. Command to install Lynis: sudo apt install Lynis
[sudo] password for sysadmin:
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package Lynis
sysadmin@UbuntuDesktop:~$ sudo apt install lynis
Reading package lists... Done
Building dependency tree
Reading state information... Done
lynis is already the newest version (2.6.2-1).
0 upgraded, 0 newly installed, 0 to remove and 397 not upgraded.

2. Command to see documentation and instructions:  sudo lynis show commands
[sudo] password for sysadmin:

Commands:
lynis audit
lynis configure
lynis show
lynis update
lynis upload-only

3. Command to run an audit:  sudo lynis audit system

4. Provide a report from the Lynis output on what can be done to harden the system.

    - Screenshot of report output: 
    ================================================================================

  Lynis security scan details:

  Hardening index : 61 [############        ]
  Tests performed : 232
  Plugins enabled : 1

  Components:
  - Firewall               [V]
  - Malware scanner        [V]

  Lynis Modules:
  - Compliance Status      [?]
  - Security Audit         [V]
  - Vulnerability Scan     [V]

  Files:
  - Test and debug information      : /var/log/lynis.log
  - Report data                     : /var/log/lynis-report.dat

================================================================================
  Notice: Lynis update available
  Current version : 262    Latest version : 303
================================================================================

  Lynis 2.6.2

  Auditing, system hardening, and compliance for UNIX-based systems
  (Linux, macOS, BSD, and others)

  2007-2018, CISOfy - https://cisofy.com/lynis/
  Enterprise support available (compliance, plugins, interface and tools)

================================================================================

  [TIP]: Enhance Lynis audits by adding your settings to custom.prf (see /etc/lynis/default.prf for all settings)


### Bonus
1. Command to install chkrootkit:  sudo apt install chkrootkit
Reading package lists... Done
Building dependency tree
Reading state information... Done
chkrootkit is already the newest version (0.52-1ubuntu0.1).
0 upgraded, 0 newly installed, 0 to remove and 400 not upgraded.

2. Command to see documentation and instructions:  chkrootkit -l
/usr/sbin/chkrootkit: tests: aliens asp bindshell lkm rexedcs sniffer w55808 wted scalper slapper z2 chkutmp OSX_RSPLUG amd basename biff chfn chsh cron crontab date du dirname echo egrep env find fingerd gpm grep hdparm su ifconfig inetd inetdconf identd init killall  ldsopreload login ls lsof mail mingetty netstat named passwd pidof pop2 pop3 ps pstree rpcinfo rlogind rshd slogin sendmail sshd syslogd tar tcpd tcpdump top telnetd timed traceroute vdir w write

3. Command to run expert mode: sudo chkrootkit -x

4. Provide a report from the chrootkit output on what can be done to harden the system.
    - Screenshot of end of sample output:
! sysadmin     2658 tty2   /usr/lib/xorg/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -background none -noreset -keeptty -verbose 3
! sysadmin     2656 tty2   /usr/lib/gdm3/gdm-x-session --run-script env GNOME_SHELL_SESSION_MODE=ubuntu gnome-session --session=ubuntu
! sysadmin     2680 tty2   /usr/lib/gnome-session/gnome-session-binary --session=ubuntu
! sysadmin     2863 tty2   /usr/bin/gnome-shell
! sysadmin     3344 tty2   /usr/bin/gnome-software --gapplication-service
! sysadmin     3006 tty2   /usr/lib/gnome-settings-daemon/gsd-a11y-settings
! sysadmin     3010 tty2   /usr/lib/gnome-settings-daemon/gsd-clipboard
! sysadmin     3004 tty2   /usr/lib/gnome-settings-daemon/gsd-color
! sysadmin     3014 tty2   /usr/lib/gnome-settings-daemon/gsd-datetime
! sysadmin     3086 tty2   /usr/lib/gnome-disk-utility/gsd-disk-utility-notify
! sysadmin     3018 tty2   /usr/lib/gnome-settings-daemon/gsd-housekeeping
! sysadmin     3019 tty2   /usr/lib/gnome-settings-daemon/gsd-keyboard
! sysadmin     3023 tty2   /usr/lib/gnome-settings-daemon/gsd-media-keys
! sysadmin     2969 tty2   /usr/lib/gnome-settings-daemon/gsd-mouse
! sysadmin     2970 tty2   /usr/lib/gnome-settings-daemon/gsd-power
! sysadmin     2974 tty2   /usr/lib/gnome-settings-daemon/gsd-print-notifications
! sysadmin     3048 tty2   /usr/lib/gnome-settings-daemon/gsd-printer
! sysadmin     2977 tty2   /usr/lib/gnome-settings-daemon/gsd-rfkill
! sysadmin     2978 tty2   /usr/lib/gnome-settings-daemon/gsd-screensaver-proxy
! sysadmin     2983 tty2   /usr/lib/gnome-settings-daemon/gsd-sharing
! sysadmin     2986 tty2   /usr/lib/gnome-settings-daemon/gsd-smartcard
! sysadmin     2991 tty2   /usr/lib/gnome-settings-daemon/gsd-sound
! sysadmin     2994 tty2   /usr/lib/gnome-settings-daemon/gsd-wacom
! sysadmin     2996 tty2   /usr/lib/gnome-settings-daemon/gsd-xsettings
! sysadmin     2884 tty2   ibus-daemon --xim --panel disable
! sysadmin     2888 tty2   /usr/lib/ibus/ibus-dconf
! sysadmin     3162 tty2   /usr/lib/ibus/ibus-engine-simple
! sysadmin     2894 tty2   /usr/lib/ibus/ibus-x11 --kill-daemon
! sysadmin     3080 tty2   nautilus-desktop
chkutmp: nothing deleted
Checking `OSX_RSPLUG'...                                    not tested

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
