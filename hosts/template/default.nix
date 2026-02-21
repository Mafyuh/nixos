{ ... }: {
  services.qemuGuest.enable = true;
  networking.hostName = "template";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05";
}