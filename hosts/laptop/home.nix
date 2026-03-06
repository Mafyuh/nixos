{ ... }: {
  imports = [ ../../common/home.nix ];

  home.username = "mafyuh";
  home.homeDirectory = "/home/mafyuh";
  home.stateVersion = "25.11";

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "FiraCode Nerd Font Mono" ];
    defaultFonts.sansSerif = [ "FiraCode Nerd Font" ];
  };
}
