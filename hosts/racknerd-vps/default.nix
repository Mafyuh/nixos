{ ... }: {
  imports = [
    ./boot.nix
    ./networking.nix
  ];

  services.qemuGuest.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mafyuh = import ./home.nix;
  };
}
