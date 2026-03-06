{ ... }: {
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  sops.secrets."github_pat" = {
    sopsFile = ../secrets/laptop.yaml;
  };
}
