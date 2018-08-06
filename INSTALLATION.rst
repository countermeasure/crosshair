======================
Crosshair installation
======================

This process requires two computers and a USB flash drive.

The flash drive will be completely overwriten, so ensure there is nothing on it
that you need to keep.

One computer will create the Crosshair installer on the flash drive. We'll call
this computer the installer computer.

The other computer is the one on which Crosshair will be installed. We'll call
that computer the target computer.

Here we go!


On the installer computer
-------------------------


Step 1
~~~~~~

Before plugging the flash drive into this computer, run this command::

    $ lsblk

Now plug the in the flash drive and run `lsblk` a second time.

You'll notice that a new device is shown the second time. This is your flash
drive. Take careful note of its name, as we'll be using it a lot.

**SAFETY WARNING:** Some of the commands which follow will overwrite data on
the device you point them at without any notice. Point them at the wrong device
and you way render the installer computer unusable. Be careful with device
names!

We'll assume for the commands which follow that the device name is `sdb`,
although it's likely that yours will be something different.


Step 2
~~~~~~

Download and verify the integrity of the Debian 9.5 Net Installer image::

    $ wget -P /tmp/debian_iso/ http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/current/amd64/iso-cd/firmware-9.5.0-amd64-netinst.iso
    $ wget -P /tmp/debian_iso/ http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/current/amd64/iso-cd/SHA512SUMS
    $ cd /tmp/debian_iso
    $ sha256sum -c SHA256SUMS
    firmware-9.5.0-amd64-netinst.iso: OK


Step 3
~~~~~~

Write the Debian installer to the flash drive, unmounting any existing
partitions first::

    $ umount /dev/sdb*
    $ sudo dd if=firmware-9.5.0-amd64-netinst.iso of=/dev/<flash_drive_device_name> bs=4M status=progress; sync

For example, if the flash drive's device name is `sdb`, this will be::

    $ umount /dev/sdb*
    $ sudo dd if=firmware-9.5.0-amd64-netinst.iso of=/dev/sdb bs=4M status=progress; sync


Step 4
~~~~~~

Some computers will require non-free firmware. To find out whether yours does,
try a web search.

Here we'll use the example of installing on a Dell XPS 13 9370. There are some
notes about the firmware required here:
https://wiki.debian.org/InstallingDebianOn/Dell/Dell_XPS_13_9370

Get the firmware required::

    $ wget -P /tmp/debian_iso/ http://ftp.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-atheros_20180518-1_all.deb

Again we assume that the flash drive is at `sdb`, although yours will probably
be different.

Make a partition on the flash drive for the firmware::

    $ sudo fdisk /dev/sdb

This will give you options. Choose::

    n (Create a new partition)
    <Enter> (Select the default - Partition type)
    <Enter> (Select the default - Partition number)
    <Enter> (Select the default - First sector)
    +100M (Set the partition size)
    t (Set the partition type)
    <Enter> (Select the default - Partition number)
    c (Partition type W95 FAT32 LBA)
    w (Write changes and exit)

You may need to unplug and replug the flash drive now for it to find the new
partition.

Format and mount the new partition::

    $ sudo mkfs.vfat -F32 /dev/sdb3
    $ sudo mount /dev/sdb3 /media/cdrom

Copy the firmware to the new partition::

    $ cp firmware-atheros_20180518-1_all.deb /media/cdrom/Debian\ 9.5.0\ amd64\ n1


Step 5
~~~~~~

Make a partition on the flash drive for the Crosshair installer::

    $ sudo fdisk /dev/sdb

This will give you options. Choose::

    n (Create a new partition)
    <Enter> (Select the default - Partition type)
    <Enter> (Select the default - Partition number)
    <Enter> (Select the default - First sector)
    +100M (Set the partition size)
    t (Set the partition type)
    <Enter> (Select the default - Partition number)
    c (Partition type W95 FAT32 LBA)
    w (Write changes and exit)

Format and mount the new partition::

    $ sudo mkfs.vfat -F32 -n crosshair /dev/sdb4
    # sudo mkdir /media/cdrom/crosshair
    $ sudo mount /dev/sdb4 /media/cdrom

Clone this repo into the new partition::

    $ cd /media/cdrom
    $ sudo git clone https://github.com/countermeasure/crosshair.git


On the target computer
~~~~~~~~~~~~~~~~~~~~~~

Boot the target machine and before inserting the flash drive into it run::

    $ lsblk

Then insert the flash drive into the target machine and run ``lsblk`` again.

The device which appears in the second run of ``lsblk`` and not the first is
your flash drive.

Now mount the flash drive. If its device name is say ``/dev/sdb1``, this
command should mount it::

    $ sudo mount /dev/sdb1 /media/cdrom

Now run the Crosshair installer and follow its prompts::

    $ cd /media/cdrom/crosshair/installer
    $ ./install_crosshair
