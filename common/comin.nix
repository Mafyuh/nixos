{ config, ... }: {
  services.comin = {
    enable = true;
    remotes = [{
      name = "origin";
      url = "https://github.com/Mafyuh/nixos.git";
      branches.main.name = "main";
      auth.access_token_path = config.sops.secrets."github_pat".path;
    }];
  };
}
