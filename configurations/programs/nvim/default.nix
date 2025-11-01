{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    customRC = ''
      ${builtins.readFile ./set.lua}
    '';
  };
}
