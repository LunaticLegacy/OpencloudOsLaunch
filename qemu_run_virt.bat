@echo off
qemu-system-riscv64 ^
	-cpu max ^
	-m 8G ^
	-smp 8 ^
	-nographic ^
	-machine virt,pflash0=pflash0,pflash1=pflash1,acpi=off ^
	-blockdev node-name=pflash0,driver=file,read-only=on,filename=./uefi/RISCV_VIRT_CODE_32M.fd ^
	-blockdev node-name=pflash1,driver=file,filename=./uefi/RISCV_VIRT_VARS_32M.fd ^
	-device usb-ehci,id=ehci ^
	-device usb-kbd,bus=ehci.0 ^
	-serial mon:stdio ^
	-boot menu=on ^
	-drive file=./luna_oc_riscv_6.6.94.img,format=raw,if=virtio ^
	-netdev user,id=net0,hostfwd=tcp::88-:22,hostfwd=tcp::396-:5432 ^
	-device virtio-net-device,netdev=net0
    
pause
