{ config, ... }: {
  networking.hostName = "racknerd-vps";
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.useDHCP = true;
  networking.nameservers = [
    "1.1.1.1"
    "9.9.9.9"
  ];

  sops.secrets.ssh_allowed_ipv4 = {
    sopsFile = ../../secrets/racknerd-vps.yaml;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
    ];
  };

  networking.firewall.ipBasedAllowedTCPPorts = [
    {
      port = 22;
      ipFiles = [ config.sops.secrets.ssh_allowed_ipv4.path ];
    }
    {
      port = 81;
      ipFiles = [ config.sops.secrets.ssh_allowed_ipv4.path ];
    }
  ];

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}