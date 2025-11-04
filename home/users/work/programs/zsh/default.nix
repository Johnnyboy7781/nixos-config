{...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = "source ${./functions.zsh}";

    shellAliases = {
      c = "clear";
      src = "source ~/.zshrc";
      s = "git status";
      z = "zellij";
      ls = "eza";
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
