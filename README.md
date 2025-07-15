# 🚀 OpenCloud OS RISC-V Boot Project

Author: [月と猫 - LunaNeko](https://github.com/LunaticLegacy)  *Nya~ 🐾*

GitHub: **LunaticLegacy**, Gitee: **LunaNeko**

> A bootable RISC-V Linux environment built with ❤️ *(and several days in cafe)* , based on [RV-SP](https://github.com/riscv-non-isa/riscv-platforms/tree/master/rv-sp). <br>
> My personal fork and working branch: [🔗](https://github.com/LunaticLegacy/rv-sp-test-mod/tree/lunanekos_working) <br>
> This environment is based on the [RV-SP](https://github.com/riscv-non-isa/riscv-platforms/tree/master/rv-sp) project, and all of my work were uploaded in [my fork and my branch](https://github.com/LunaticLegacy/rv-sp-test-mod/tree/lunanekos_working).

## 📦 Requirements
- QEMU ≥ 8.0 with RISC-V support
- Buildroot
- GCC toolchain for RISC-V (e.g. `riscv64-linux-gnu-gcc`)
- GCC or Clang toolchain for your **local arch** *(Honestly I didn't try compiling QEMU via Clang, I did this in GCC instead.)*
- EDK2 (source or prebuilt, see UEFI section)

## 🔧 How to use:
### Step 1. Get your own QEMU for RISC-V
*Let’s warm up with this. I believe you can do this basic task without breaking a sweat.*

You may use a custom build of QEMU, placed at `./qemu/build/qemu-system-riscv64` by default. Feel free to adjust path in the run scripts.

If you feel it very complex to compile, feel free to download a pre-built binary in QEMU official website. 

- **For Windows**:  
  Download from [Stefan Weil's QEMU builds](https://qemu.weilnetz.de/).  
  After downloading, make sure `qemu-system-riscv64.exe` is in your `PATH`, or adjust the script accordingly.

- **For Linux**:  
  You can install QEMU with RISC-V support via your distribution’s package manager.  
  In my environment, I use **APT**:

  ```bash
  sudo apt update
  sudo apt install qemu-system-misc qemu-user-static
  ```
  Or more specifically:
  ```bash
  sudo apt install qemu-system-riscv
  ```
  📝 You can replace apt with yum, dnf, or your distro’s package manager as needed.

> In my environment, I compiled my own QEMU via its source code in Linux and downloaded the pre-built binaries in Windows.

### Step 2. Build the Kernel
- Use [this kernel repo](https://gitee.com/lunaneko/OpenCloudOS-Kernel.git) in Gitee and apply my config file in `config/`.
  - Or you can use `make menuconfig` to make your own config.
- Then use:
```bash
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- KCFLAGS="-march=rv64gc_zicsr_zihintpause" -j $(nproc)
```

> Please rename the config file to `.config` before building. GitHub hides dotfiles.

### Step 3. Compile GRUB and Write grub.cfg
Use your own GRUB build or [my config](grub.cfg) if you're lazy (like me sometimes). *I won't tell you the reason why I don't teach you how to build this is that it's a totally bullshit... Ask for ChatGPT instead, I did it too, for multiple times.*

### Step 4. Build Filesystem via Buildroot
Build a root filesystem and create an `.img` file:

- Use `fdisk` to create **2 partitions**:
  - Partition 1: **FAT32** (for GRUB and kernel)
  - Partition 2: **EXT4** (for rootfs)
> *(According to the UEFI specification, the EFI System Partition must be formatted as VFAT (typically FAT32), and it stores the GRUB EFI executable. However, the Linux kernel and root filesystem can reside on a different partition with another filesystem like ext4.)*
- Mount each partition and place files accordingly:
  - FAT32 partition → `/boot` with `Image` (kernel)
  - EXT4 partition → rootfs contents from Buildroot

> TIP: if you're stuck, just ask ChatGPT or other LLMs to help script this.

### Step 5. Prepare UEFI (EDK2)
You can either:
- Compile your own EDK2 UEFI build
- OR use my precompiled binaries from the `UEFI/` folder

> ⚠️ You MUST **truncate** each UEFI firmware binary to 32MB.
> Use the `truncate_uefi.sh` script provided to truncate your UEFI firmware if you feel it's complex.

### Step 6. Boot!
- For **Linux**: Run `qemu_run_virt.sh`  
- For **Windows**: Run `qemu_run_virt.bat`

You may need to edit the scripts to match your environment (especially QEMU path).

## Notes:
> Please DO NOT delete anything in `UEFI/`. These are the compiled EDK2 UEFI binaries. <br>
> Step 2 to step 5 can be simply replaced by 🔜 [DOWNLOAD]() my own file. *(Coming soon! This link is still waiting for be fulfilled. I will do it at the day my Release ver of system were published via Opencloud OS Official.)*

## Some details:

### What's inside my .iso file:
```bash
luna@my_device:~/dnf/toml11/toml11/build$ ls /mnt/boot
EFI  Image
luna@my_device:~/rv-sp-test-mod$ ls /mnt/boot/EFI/
BOOT
luna@my_device:~/rv-sp-test-mod$ ls /mnt/boot/EFI/BOOT/
bootriscv64.efi  grub.cfg

luna@my_device:~/dnf/toml11/toml11/build$ ls /mnt/rootfs
bin  boot  dev  etc  home  lib  lib64  linuxrc  lost+found  media  mnt  opt  proc  root  run  sbin  share  srv  sys  tmp  usr  var
luna@my_device:~/dnf/toml11/toml11/build$
```

`Image` in dir `/mnt/boot` *(the 1st partition, fat32)* is my OS kernel. `/mnt/rootfs` *(the 2nd partition, ext4)* is my filesystem generated via buildroot.:



