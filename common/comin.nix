{ config, ... }: {
  services.comin = {
    enable = true;
    exporter = {
      listen_address = "0.0.0.0";
      openFirewall = false;
      port = 4243;
    };
    remotes = [{
      name = "origin";
      url = "https://github.com/Mafyuh/nixos.git";
      branches.main.name = "main";
    }];
  };
}
