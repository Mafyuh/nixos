{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    curl
    zsh
    fzf
    nettools
    sops
    age
    oh-my-posh
    fastfetch
  ];
}
