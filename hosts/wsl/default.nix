{ inputs, ... }: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    inputs.vscode-server.nixosModules.default
  ];

  services.comin = {
    enable = true;
    remotes = [{
      name = "origin";
      url = "https://github.com/Mafyuh/nixos.git";
      branches.main.name = "main";
    }];
  };

  wsl.enable = true;
  wsl.defaultUser = "mafyuh";

  services.vscode-server.enable = true;

  networking.hostName = "wsl";
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mafyuh = import ./home.nix;
  };
}
