{ ... }: {
  networking.hostName = "racknerd-vps";
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.useDHCP = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
    ];
  };

  services.tailscale = {
    enable = true;
  }
}