{ ... }: {
  imports = [
    ./boot.nix
    ./hardware.nix
    ./desktop.nix
    ./packages.nix
  ];

  networking.hostName = "main";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16384;
    }
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    max-jobs = 1;
    cores = 2;
  };
  system.stateVersion = "25.11";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mafyuh = import ./home.nix;
  };
}