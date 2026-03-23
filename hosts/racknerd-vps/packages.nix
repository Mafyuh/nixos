{ pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs; [
    btop
    docker_29
    lazydocker
  ];
}
