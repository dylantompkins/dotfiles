# Install refind from arch live environment

1. mount main filesystem and `arch-chroot` into it
2. install `refind` and run `refind-install`
3. shutdown and remove live usb
4. start and boot arch using `F2` in refind menu to choose `Boot with minimal options`
5. login to system in tty and then run `mkrlconf`
6. reboot and arch should appear normally
