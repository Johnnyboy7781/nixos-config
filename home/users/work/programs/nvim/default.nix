{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
	lua-language-server
    nil
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
    '';
  };
}
