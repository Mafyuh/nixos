{ ... }: {
  networking.hostName = "racknerd-vps";
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.useDHCP = true;
  networking.nameservers = [
    "1.1.1.1"
    "9.9.9.9"
  ];

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
    useRoutingFeatures = "client";
  };
}