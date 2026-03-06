{ pkgs, ... }: {
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
    steam
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
