## Information:

Author: [月と猫 - LunaNeko](https://github.com/LunaticLegacy)  *Nya~ 🐾*

GitHub: **LunaticLegacy**, Gitee: **LunaNeko**

This environment is based on the [RV-SP](https://github.com/riscv-non-isa/riscv-platforms/tree/master/rv-sp) project, and all of my work were uploaded in [my fork and my branch](https://github.com/LunaticLegacy/rv-sp-test-mod/tree/lunanekos_working).

## Requirements
- QEMU ≥ 8.0 with RISC-V support
- Buildroot
- GCC toolchain for RISC-V (e.g. `riscv64-linux-gnu-gcc`)
- EDK2 (source code, or prebuilt file in m)

## How to use:
1. Compile a QEMU RISC-V platform. *Let's warm up with this, shall we? I don't believe you're unable to do such casual thing.*
2. Compile your own Opencloud OS kernel with this [source code](https://gitee.com/lunaneko/OpenCloudOS-Kernel.git) in Gitee with [my config](config). *(Rename this file into: `.config` please, for GitHub will automatically hide the file that name starts with a dot "`.`".)*
3. Compile your own GRUB and write your own grub.cfg, or use [mine](grub.cfg).
4. Make your own filesystem via buildroot, then make an .img file, partition it, then put everything inside that .img. *(It's a little complex, ask for ChatGPT to do it. TIP: `fdisk`. Remember to set 2 partitions and make the 1st as **FAT32** and make the second as **EXT4** (or based on your kernel) )*
5. Compile your own EDK2 RISC-V UEFI, or use the provided UEFI in this repo *(after you TRUNCATED both of them into 32MB)*.
6. For Linux, run `qemu_run_virt.sh`. for Windows, run `qemu_run_virt.bat`.

*You're recommended to modify these script to run your own compiled QEMU, default QEMU directory was set as `./qemu/build/qemu-system-riscv64`. The file I'd given is working in MY environment.*

- Be careful: **DON'T delete** any of file in folder `UEFI`. These are my own-compiled UEFI firmware. *(You can compile it by yourself, too)*
- Step 2 to step 5 can be simply replaced by 🔜 [DOWNLOAD]() my own file. *(Coming soon! This link is still waiting for be fulfilled. I will do it at the day my Release ver of system were published via Opencloud OS Official.)*

## Some details:

### What's inside my .iso file:
```bash
luna@LAPTOP-O7KSPF9L:~/dnf/toml11/toml11/build$ ls /mnt/boot
EFI  Image
luna@LAPTOP-O7KSPF9L:~/dnf/toml11/toml11/build$ ls /mnt/rootfs
bin  boot  dev  etc  home  lib  lib64  linuxrc  lost+found  media  mnt  opt  proc  root  run  sbin  share  srv  sys  tmp  usr  var
luna@LAPTOP-O7KSPF9L:~/dnf/toml11/toml11/build$
```

`Image` in dir `/mnt/boot` *(the 1st partition, fat32)* is my OS kernel. `/mnt/rootfs` *(the 2nd partition, ext4)* is my filesystem generated via buildroot.

### After generated your filesystem via Buildroot:

`mount` your filesystem disk, then **copy them** into the ext4 partition of your img file.

### How about EDK2?

After it was generated, you SHOULD truncate both of files into 32MB. I uploaded a script for truncate the EDK2 UEFI file. *Just relax, truncate them will not corrupt them. I had tested this.*


