## Information:

Author: [月と猫 - LunaNeko](https://github.com/LunaticLegacy)

GitHub: **LunaticLegacy**, Gitee: **LunaNeko**

This environment is based on the [RV-SP](https://github.com/riscv-non-isa/riscv-platforms/tree/master/rv-sp) project, and all of my work were uploaded in [my fork and my branch](https://github.com/LunaticLegacy/rv-sp-test-mod/tree/lunanekos_working).

## How to use:
1. Compile a QEMU RISC-V platform.
2. Compile your own OS within [SOURCE](https://gitee.com/lunaneko/OpenCloudOS-Kernel.git) in Gitee with [my config](config). *(Rename this file into: `.config` please, for GitHub will automatically hide the file that name starts with a dot "`.`".)*
3. Compile your own GRUB and write your own grub.cfg, or use [mine](grub.cfg).
4. Make your own filesystem via buildroot, then make an .img file, partition it, then put everything inside that .img. *(It's a little complex, ask for ChatGPT to do it. TIP: `fdisk`. Remember to set 2 partitions and make the 1st as **FAT32** and make the second as **EXT4** (or based on your kernel) )*
5. Compile your own EDK2 RISC-V UEFI, or use the provided UEFI in this repo *(after you TRUNCATED both of them into 32MB)*.
6. For Linux, run `qemu_run_virt.sh`. for Windows, run `qemu_run_virt.bat`.

*You're recommended to modify these script to run your own compiled QEMU, default QEMU directory was set as `./qemu/build/qemu-system-riscv64`. The file I'd given is working in MY environment.*

- Be careful: **DON'T delete** any of file in folder `UEFI`. These are my own-compiled UEFI firmware. *(You can compile it by yourself, too)*
- The previous 5 steps can be simply replaced by [DOWNLOAD]() my own file. *(This link is still waiting for be fulfilled. I will do it at the day my Release ver of system were published via Opencloud OS Official.)*

