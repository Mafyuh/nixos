{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-inspect.url = "github:bluskript/nix-inspect";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    deploy-rs.url = "github:serokell/deploy-rs";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
      nixosConfig = { modules ? [] }: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./common/default.nix ] ++ modules;
      };
    in {
    nixosConfigurations = {
        template = nixosConfig { modules = [ inputs.comin.nixosModules.comin inputs.disko.nixosModules.disko ./hosts/template/disk-config.nix ./hosts/template/default.nix ]; };
        laptop = nixosConfig { modules = [ inputs.comin.nixosModules.comin inputs.disko.nixosModules.disko inputs.home-manager.nixosModules.home-manager ./hosts/laptop/disk-config.nix ./hosts/laptop/default.nix ]; };
      };
    devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.nix-inspect
            pkgs.deploy-rs
            pkgs.nvd
            pkgs.nix-output-monitor
          ];
          shellHook = ''
            echo "Nix Development Environment"
          '';
        };
      });
  } // import ./deploy.nix { inherit self inputs; };
}