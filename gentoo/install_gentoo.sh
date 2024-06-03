#!/usr/bin/bash

# WARNING: gpt the partitions yourself with cfdisk /dev/<disk>
# THIS SCRIPTS ONLY WORKS WITH EFI
source ./config_gentoo.sh

# FORMAT THE PARTITIONS
mkfs.vfat -F 32 $BOOT_PARTITION
mkswap $SWAP_PARTITION
mkfs.btrfs -f $ROOT_PARTITION


# MOUNT THE PARTITIONS (create the gentoo mnt and efi inside gentoo)
mkdir --parents $ROOT_MOUNT_POINT
mount $ROOT_PARTITION $ROOT_MOUNT_POINT
mkdir --parents "$ROOT_MOUNT_POINT/efi"
mount $BOOT_PARTITION "$ROOT_MOUNT_POINT/efi"
swapon $SWAP_PARTITION


# DOWNLOAD STAGE 3 AND UNCOMPRESS IN RIGHT DIRECTORY
cd $ROOT_MOUNT_POINT
wget $STAGE_3_FILE_LINK
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner


# DOWNLOAD THE MAKE CONF FILE
wget -P "$ROOT_MOUNT_POINT/etc/portage/make.conf" $MAKE_CONF_FILE 


# COPY DNS INFO TO CHROOT WORK PROPERLY
cp --dereference /etc/resolv.conf "$ROOT_MOUNT_POINT/etc/"


# MOUNT THE NECESSARY FILESYSTEMS
mount --types proc /proc "$ROOT_MOUNT_POINT/proc"
mount --rbind /sys "$ROOT_MOUNT_POINT/sys"
mount --make-rslave "$ROOT_MOUNT_POINT/sys"
mount --rbind /dev "$ROOT_MOUNT_POINT/dev"
mount --make-rslave "$ROOT_MOUNT_POINT/dev"
mount --bind /run "$ROOT_MOUNT_POINT/run"
mount --make-slave "$ROOT_MOUNT_POINT/run"


# COPY THE CONFIG TO THE CHROOT TO USE IN CHROOT
cp ./config_gentoo.sh "$ROOT_MOUNT_POINT/config_gentoo.sh"


# CHROOT IN THE NEW ENVIRONMENT
chroot $ROOT_MOUNT_POINT /bin/bash << "EOT"
source /etc/profile
export PS1="(chroot) ${PS1}"


# RE-EXPORT THE VARIABLES
chmod +x config_gentoo.sh
source ./config_gentoo.sh
rm config_gentoo.sh


# INSTALL GENTOO EBUILD REPOSITORY SNAPSHOT FROM THE WEB
emerge-webrsync


# UPDATE THE GENTOO EBUILD REPOSITORY
emerge --sync


# CHOSE THE ESELECT PROFILE LIST # DONT UNCOMENT THIS
# eselect profile list
# eselect select 2


# ADD CPU_FLAGS
emerge --oneshot app-portage/cpuid2cpuflags
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags


# UPDATING THE @WORLD SET AND DELETE OBSOLETE PACKAGES
emerge --verbose --update --deep --newuse @world
emerge --depclean


# TIMEZONE
echo $TIMEZONE_OPENRC > /etc/timezone
emerge --config sys-libs/timezone-data


# LOCALE GENERATION
echo "$FIRST_LOCALE ISO-8859-1" >> /etc/locale.gen
echo "$FIRST_LOCALE.UTF-8 UTF-8" >> /etc/locale.gen
echo "$SECOND_LOCALE ISO-8859-1" >> /etc/locale.gen
echo "$SECOND_LOCALE.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen


# LOCALE SELECTION
eselect locale set 9
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"


# INSTALL LINUX FIRMWARE AND MICROCODE FOR AMD (MICROCODE BECOMES WITH THE FIRMWARE)
emerge sys-kernel/linux-firmware


# INSTALL DISTRIBUTION KERNEL (ENABLE DRACUT FIRST)
echo "sys-kernel/installkernel dracut grub" > "/etc/portage/package.use/installkernel"
emerge sys-kernel/gentoo-kernel-bin


# CREATE FSTAB FILE
echo "$BOOT_PARTITION		/efi		vfat		umask=0077	0 2" >> /etc/fstab
echo "$SWAP_PARTITION		none		swap		sw	0 0" >> /etc/fstab
echo "$ROOT_PARTITION		/		btrfs		defaults,noatime	0 1" >> /etc/fstab


# HOSTNAME
echo "gentoo" > /etc/hostname


# NETWORK
emerge net-misc/dhcpcd
rc-update add dhcpcd default
rc-service dhcpcd start


# SYSTEM LOGGER
emerge app-admin/sysklogd
rc-update add sysklogd default


# CRON DAEMON
emerge sys-process/cronie
rc-update add cronie default


# TIME SYNC
emerge net-misc/chrony
rc-update add chronyd default


# FILESYSTEM TOOLS
emerge sys-block/io-scheduler-udev-rules sys-fs/btrfs-progs


# WIRELESS NETWORKING
emerge net-wireless/iw net-wireless/wpa_supplicant


# GRUB
emerge --verbose sys-boot/grub
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id="Gentoo"
grub-mkconfig -o /boot/grub/grub.cfg


# ECHO TO CHANGE THE PASSWORD OF THE GENTOO INSTALATION
# do the rest of the installation
EOT
