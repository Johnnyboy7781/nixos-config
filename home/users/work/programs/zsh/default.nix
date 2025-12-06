{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
        export NPM_PUBLISH_TOKEN=$(cat ${config.sops.secrets.NPM_PUBLISH_TOKEN.path})
        source ${./functions.zsh}
    '';

    shellAliases = {
      c = "clear";
      src = "source ~/.zshrc";
      s = "git status";
      a = "git add .";
      z = "zellij";
      ls = "eza";
      lzg = "lazygit";
      lzd = "lazydocker";
      re = "sudo nixos-rebuild switch --impure";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "npm" "mvn" "ng" "node" ];
      theme = "candy";
    };

    profileExtra = ''
      # ignore dist directories
      export _ZO_EXCLUDE_DIRS="dist/*"
    '';
  };
}
