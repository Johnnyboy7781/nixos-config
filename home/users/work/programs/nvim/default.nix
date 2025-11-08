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
        nvim-lspconfig
        {
            plugin = rose-pine;
	    type = "lua";
            config = builtins.readFile ./plugins/colorscheme.lua;
        }
        {
            plugin = gitsigns-nvim;
	    type = "lua";
            config = builtins.readFile ./plugins/gitsigns.lua;
        }
        {
            plugin = nvim-autopairs;
	    type = "lua";
            config = builtins.readFile ./plugins/autopairs.lua;
        }
        {
            plugin = mini-files;
	    type = "lua";
            config = builtins.readFile ./plugins/mini-files.lua;
        }
        {
            plugin = mini-pick;
	    type = "lua";
            config = builtins.readFile ./plugins/mini-pick.lua;
        }
    ];
  };
}
