# Adding an entry to grub config

located at `/boot/grub/grub.cfg`

no command required, just edit and reboot

added this entry to enable gpu on startup:

```
menuentry 'Arch Linux, with NVIDIA GPU' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-3e49cdb3-6186-4e96-9cec-a4e3b5d43ae6' {
	load_video
	set gfxpayload=keep
	insmod gzio
	insmod part_gpt
	insmod ext2
	search --no-floppy --fs-uuid --set=root 3e49cdb3-6186-4e96-9cec-a4e3b5d43ae6
	echo	'Loading Linux linux ...'
	linux	/boot/vmlinuz-linux root=UUID=3e49cdb3-6186-4e96-9cec-a4e3b5d43ae6 rw  loglevel=3 quiet optimus-manager.startup=nvidia
	echo	'Loading initial ramdisk ...'
	initrd	/boot/initramfs-linux.img
}
```

note the `optimus-manager.startup=nvidia` kernel parameter

entry is on same level as other entries, not complicated placement
