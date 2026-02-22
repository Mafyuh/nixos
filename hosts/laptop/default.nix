{ pkgs, ... }: {
  networking.hostName = "laptop";
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.enableRedistributableFirmware = true;

  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";

  users.users.mafyuh = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2I9wGjs+G/RO5aJJDNL0j5yPExvX7RETQIO6OmXbvx"
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.zsh.enable = true;

  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mafyuh = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    fzf
    git
    btop
    fastfetch
    docker
    tlp
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  services.xserver.enable = true;
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # renovate: depName=linux datasource=repology versioning=loose
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 2;
  boot.loader.efi.canTouchEfiVariables = false;
}