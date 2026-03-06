{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    curl
    zsh
    fzf
    nettools
    sops
    age
  ];
}
