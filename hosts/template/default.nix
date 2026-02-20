{ ... }: {
  services.qemuGuest.enable = true;
  networking.hostName = "template";
  system.stateVersion = "25.05";
}