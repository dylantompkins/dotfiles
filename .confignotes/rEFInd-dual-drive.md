*these instructions are no longer relevant, see refind-chroot.md*

# How to Install rEFInd for Dual-Drive Dual-Booting Windows and Arch Linux

1. Prerequisites
   
   1. Regular Windows install on one drive (here that drive will be `/dev/sdb`)
   
   2. Install Arch on the other drive (`/dev/sda` here) as instructed (and in UEFI mode) on the [Installation guide - ArchWiki](https://wiki.archlinux.org/index.php/installation_guide) except:
      
      1. Do not create an EFI partition on the Arch drive, just swap and root
   
   3. Identify the Windows EFI partition (in this case `/dev/sdb2`)

2. In live environment
   
   1. `yay -S refind` Install rEFInd
   
   2. `mount /dev/sdb2 /boot/efi` Mount Windows EFI partition
   
   3. `refind-install --root /boot/efi` Use automatic install script, but tell it where to go. Without the `--root` flag, the script will configure the kernel options for the live environment, instead of our installed OSes.
      
      1. Expect some errors here. I'm not sure how "intended" this method is...
   
   4. `shutdown`

3. Unplug Arch live USB

4. Boot into BIOS
   
   1. Find refind in the boot options and make sure it has priority over the Windows boot manager. In this case, the two boot managers didn't show up as separate drives, but instead as an option that had something to do with `BBS` where I could order the boot managers on that single drive. Might have to do some digging on this one.
   
   2. Exit and reboot normally

5. You should be greeted with a refind screen on boot that displays both the Arch and Windows icons. Congrats!


