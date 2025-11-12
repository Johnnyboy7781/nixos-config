{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
        export FAKE_API_TOKEN=$(cat ${config.sops.secrets.api_key.path})
        source ${./functions.zsh}
    '';

    shellAliases = {
      c = "clear";
      src = "source ~/.zshrc";
      s = "git status";
      a = "git add .";
      z = "zellij";
      ls = "eza";
      lg = "lazygit";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "npm" "mvn" "ng" "node" ];
      theme = "af-magic";
    };

    profileExtra = ''
      # ignore dist directories
      export _ZO_EXCLUDE_DIRS="dist/*"
    '';
  };
}
