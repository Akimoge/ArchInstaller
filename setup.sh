clear
echo ""
echo "Welcome to Arch Linux Installation by Akimoge"
echo ""
sleep(2);
clear
echo "Let's check your internet connection"

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Connected"

clear
echo "Now you must make one root partition and one swap partition"
sleep(4);
cfdisk
clear
echo "Write name of root partition (example. /dev/sdX)"
read rootp
echo ""
echo "Write name of swap partition (example. /dev/sdX)"
read swapp
echo ""
echo "Formating root partition"
mkfs.ext4 $rootp
mount $rootp /mnt
echo ""
echo "Formating swap partition"
mkswap $swapp
swapon $swapp
clear
echo "Starting installation"
pacstap /mnt base base-devel
clear
echo "Making a FSTAB record"
genfstab -U /mnt >> /mnt/etc/FSTAB
clear
echo "Entering to new system"
echo "Updating repository and installing bootloader"
arch-chroot /mnt pacman -Syy grub os-prober networkmanager networkmanager-applet
arch-chroot /mnt grub-install --recheck $rootp
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
clear
echo "Now system will reboot, enjoy your Arch Faggot"
sleep(5)
reboot -h now

else
    echo "Check Your internet connection, it looks like you are not connected. Little Fagget"
fi
