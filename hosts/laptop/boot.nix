{ pkgs, ... }: {
  # renovate: depName=linux datasource=repology versioning=loose
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 2;
  boot.loader.efi.canTouchEfiVariables = false;
}
