{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      dcu = "docker compose up -d";
      dcd = "docker compose down";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "docker-compose" "kubectl" "npm" ];
      theme = "robbyrussell";
    };
    plugins = [
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
      {
        name = "zsh-fzf-history-search";
        src = pkgs.zsh-fzf-history-search;
        file = "share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh";
      }
    ];
    initContent = ''
      eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/sonicboom_dark.omp.json)"
      fastfetch
    '';
  };

  programs.home-manager.enable = true;
}
