{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
  environment.systemPackages = with pkgs; [
    btop
    docker
    tlp
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  home-manager.users.mafyuh.home.packages = with pkgs; [
    wget
    terraform
    freelens-bin
    kubernetes-helm
    kubectl
    fluxcd
    termius
    vscode
    brave
    bottles
    unityhub
    pay-respects
    fastfetch
    oh-my-posh
    nerd-fonts.fira-code
    kdePackages.plasma-browser-integration
  ];
}
