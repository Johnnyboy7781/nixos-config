{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
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
      ren = "sudo nixos-rebuild switch --impure --flake ~/nixos-config#nixos";
      rej = "sudo nixos-rebuild switch --flake ~/nixos-config#jmcdonnell";
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
