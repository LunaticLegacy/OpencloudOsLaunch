./qemu/build/qemu-system-riscv64 \
    -machine virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
    -cpu max \
    -nographic \
    -m 8G \
    -smp 8 \
    -blockdev node-name=pflash0,driver=file,read-only=on,filename=./uefi/RISCV_VIRT_CODE_32M.fd \
    -blockdev node-name=pflash1,driver=file,filename=./uefi/RISCV_VIRT_VARS_32M.fd \
    -drive file=./luna_oc_riscv_6.6.94.img,format=raw,if=virtio,index=0,media=disk


