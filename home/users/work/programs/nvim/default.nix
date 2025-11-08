{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaConfig = ''
    ${builtins.readFile ./options.lua}
    ${builtins.readFile ./mappings.lua}
    ${builtins.readFile ./init.lua}
    '';

    extraPackages = with pkgs; [
        lua-language-server
        nil
    ];

    plugins = with pkgs.vimPlugins; [
        gitsigns-nvim
        nvim-autopairs
    ];
  };
}
