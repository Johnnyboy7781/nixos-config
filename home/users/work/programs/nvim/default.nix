{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default

    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
    '';
  };
}
