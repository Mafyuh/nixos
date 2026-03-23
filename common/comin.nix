{ config, ... }: {
  services.comin = {
    enable = true;
    remotes = [{
      name = "origin";
      url = "https://github.com/Mafyuh/nixos.git";
      branches.main.name = "main";
    }];
  };
}
