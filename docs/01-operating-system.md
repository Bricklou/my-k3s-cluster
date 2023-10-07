# Operating system

## Pre-requisites

### Raspberry Pi 4B & 3B+

For the Raspberry Pis, i'm using the official Raspberry Pi OS Lite (64-bits), which is a Debian based distribution. The best way to install it is just
by flashing the image using [RPi Imager](https://www.raspberrypi.org/software/).

### Orange Pi 5

For the Orange Pi 5, i'm using the unofficial Armbian distribution, which is also a Debian based distribution. You can download it from [here](https://www.armbian.com/orangepi-5/).

## Installation

### Raspberry Pi 4B & 3B+

For raspberry pi, the installation is very simple: select "Raspberry Pi OS Lite (64-bits)" in the RPi Imager, and flash it to the SD card (or whatever storage you're using).
Don't forget to configure SSH and your account information (this user will be our permanent user). Once it's finished, you can plug the storage to the Raspberry Pi and boot it up.

> **Note**
> In order to boot on an USB device, you need to update the bootloader. To do so, you first need to flash a SD card with "Raspberry Pi 4 EEPROM Boot Recovery" and boot it up. The bootloader will be updated to the latest version, and the green LED on Pi will continuously flash. The monitor will
> also show a green screen color which means that the flash was successful.
>
> After that, you need to flash and SD card with "Raspberry Pi OS Lite (64-bits)" and boot it up. Once it's booted, you can run the following command to boot on USB:
>
> ```bash
> $ sudo raspi-config
> ```
>
> Then select `1 System options`, `A6 Boot order`, `B1 USB Boot` and finally `OK`. Reboot the Pi and it should boot on USB.
>
> _Source: https://fossbytes.com/enable-usb-boot-on-raspberry-pi/_

You should be able to connect with SSH after some time.

### Orange Pi 5

Compared to the raspberry pi, the configuration for Orange is a bit more complicated when you want to boot on a NVMe drive.

First, you need to flash the Armbian image to the SD card. You can do it using the following command:

```sh
$ unxz ./Armbian_23.8.1_Orangepi5_Bookworm_legacy_5.10.160_minimal.img.xz
$ sudo dd bs=1M if=./Armbian_23.8.1_Orangepi5_Bookworm_legacy_5.10.160_minimal.img of=/dev/device_for_sd_card status=progress
$ sudo sync
```

Once it's done, you need to boot the Orange Pi 5 with the SD card. You should be able to connect with SSH after some time. The default user is `root` and the default password `1234`.

To be able to boot on the NVMe drive, you need to update the bootloader. To do so, you need to run the following command:

```sh
sudo nand-install-sata
```

This will open you a menu. Select the option `Install/Update bootloader on SPI flash` and `Yes`. Now, you can flash the NVMe drive with Armbian.

Like before, to flash the drive, download the Armbian (be sure to use the bookworm minimal version!) image directly from the OrangePi and flash it using the command below:

```sh
$ unxz ./Armbian_23.8.1_Orangepi5_Bookworm_legacy_5.10.160_minimal.img.xz
$ sudo dd bs=1M if=/dev/zero of=/dev/nvme0n1 count=2000 status=progress
$ sudo sync
$ sudo dd bs=1M if=./Armbian_23.8.1_Orangepi5_Bookworm_legacy_5.10.160_minimal.img of=/dev/nvme0n1 status=progress
$ sudo sync
$ sudo fix_mmc_ssd.sh
```

Finally, shutdown the system, unplug the SD card and boot the system. You should be able to connect with SSH after some time.
Connect using the default user `root` and the default password `1234`.

At this moment, a complete prompt will show, just complete it (It should ask root and user information). A shell will
show when it's done.

Now you are ready for the next step!
