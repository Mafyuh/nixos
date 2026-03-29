{ ... }: {
  services.qemuGuest.enable = true;
  networking.hostName = "template";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";


  boot.initrd.availableKernelModules = [ "virtio_pci" "virtio_scsi" "ahci" "sd_mod" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 2;
  boot.loader.efi.canTouchEfiVariables = true;


  system.stateVersion = "25.11";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mafyuh = import ./home.nix;
  };

  services.tailscale = {
    enable = true;
  };
}