{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
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
  };

  outputs = 
    { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
        template = nixosConfig { modules = [ inputs.comin.nixosModules.comin ./hosts/template/default.nix ]; };
        laptop = nixosConfig { modules = [ inputs.comin.nixosModules.comin ./hosts/laptop/default.nix ]; };
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
  };
  // import ./deploy.nix { inherit self inputs; };
}