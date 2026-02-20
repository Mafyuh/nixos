{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { nixpkgs, ... }: {
    nixosConfigurations = {

      template = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./common ./hosts/template ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./common ./hosts/laptop ];
      };

    };
  };
}