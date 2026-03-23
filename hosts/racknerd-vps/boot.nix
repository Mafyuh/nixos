{ ... }: {
  boot.initrd.availableKernelModules = [
    "virtio_pci"
    "virtio_blk"
    "virtio_scsi"
    "ahci"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "virtio_blk" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = false;
  boot.loader.systemd-boot.enable = false;
}
