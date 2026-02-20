{ self, inputs, ... }:
let
  deployConfig = name: system: cfg: {
    hostname = name;
    profiles.system = {
      user = "root";
      sshUser = "mafyuh";
      path = inputs.deploy-rs.lib.${system}.activate.nixos self.nixosConfigurations.${name};
      magicRollback = true;
      sshOpts = [ ];
      remoteBuild = false;
    } // cfg;
  };
in
{
  deploy.nodes = {
    template = deployConfig "template" "x86_64-linux" {
         remoteBuild = true;
     };
    laptop = deployConfig "laptop" "x86_64-linux" {
      remoteBuild = true;
    };
  };
}