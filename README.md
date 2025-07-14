## Information:

Author: [月と猫 - LunaNeko](https://github.com/LunaticLegacy)

GitHub: **LunaticLegacy**, Gitee: **LunaNeko**

This environment is based on the [RV-SP](https://github.com/riscv-non-isa/riscv-platforms/tree/master/rv-sp) project, and all of my work were uploaded in [my fork and my branch](https://github.com/LunaticLegacy/rv-sp-test-mod/tree/lunanekos_working).

## How to use:

1. Compile a QEMU RISC-V platform.
2. Compile an OS within [SOURCE](https://gitee.com/lunaneko/OpenCloudOS-Kernel.git) in Gitee with [my config](.config).
3. For Linux, run `qemu_run_virt.sh`. for Windows, run `qemu_run_virt.bat`.

*You're recommended to modify these script to run your own compiled QEMU, default QEMU directory was set as `./qemu/build/qemu-system-riscv64`. The file I'd given is working in MY environment.*

- Be careful: **DON'T delete** any of file in folder `UEFI`. These are my own-compiled UEFI firmware. *(You can compile it by yourself, too)*
