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
    } // (builtins.removeAttrs cfg [ "hostname" ]);
  } // (if cfg ? hostname then { hostname = cfg.hostname; } else {});
in
{
  deploy.nodes = {
    template = deployConfig "template" "x86_64-linux" {
        remoteBuild = true;
        hostname = "10.0.0.194";
        sshOpts = [ "-i" "/home/mafyuh/.ssh/id_ed25519" ];
     };
    laptop = deployConfig "laptop" "x86_64-linux" {
      remoteBuild = true;
      hostname = "10.0.0.95";
      sshOpts = [ "-i" "/home/mafyuh/.ssh/id_ed25519" ];
    };
    racknerd-vps = deployConfig "racknerd-vps" "x86_64-linux" {
      remoteBuild = true;
      hostname = "racknerd.mafyuh.com";
      sshOpts = [ "-i" "/home/mafyuh/.ssh/id_ed25519" ];
    };
    main = deployConfig "main" "x86_64-linux" {
      remoteBuild = true;
      hostname = "10.0.0.35";
      sshOpts = [ "-i" "/home/mafyuh/.ssh/id_ed25519" ];
    };
  };
}