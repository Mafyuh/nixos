{ pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs; [
    btop
    docker_29
    lazydocker
  ];

  services.cloudflare-warp = {
    enable = true;
    openFirewall = true;
    package = pkgs-unstable.cloudflare-warp;
 };
}
