{ pkgs, ... }: {
  # Keep the initial install surface small; apecific apps back after the first boot.

  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  #   extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  # };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}