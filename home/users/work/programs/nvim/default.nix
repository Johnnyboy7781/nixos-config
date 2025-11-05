{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
	lua-language-server
    nil_ls
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
    '';
  };
}
