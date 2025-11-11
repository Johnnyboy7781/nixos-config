{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaConfig = ''
    ${builtins.readFile ./options.lua}
    ${builtins.readFile ./mappings.lua}
    ${builtins.readFile ./lsp.lua}
    ${builtins.readFile ./autocmds.lua}
    '';

    extraPackages = with pkgs; [
        nodePackages.typescript-language-server
        nodePackages.vscode-langservers-extracted
        nodePackages.bash-language-server
        angular-language-server
        emmet-ls
        dockerfile-language-server-nodejs
        yaml-language-server
        lua-language-server
        nil
        nixd
    ];

    plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        markdown-preview-nvim
        marview-nvim
        plenary-nvim
        nvim-cmp
        cmp-nvim-lsp
        {
            plugin = telescope-nvim;
            type = "lua";
            config = builtins.readFile ./plugins/telescope.lua;
        }
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
        {
            plugin = lualine-nvim;
            type = "lua";
            config = builtins.readFile ./plugins/lualine.lua;
        }
        {
            plugin = neoscroll-nvim;
            type = "lua";
            config = builtins.readFile ./plugins/neoscroll.lua;
        }
        {
            plugin = mini-comment;
            type = "lua";
            config = builtins.readFile ./plugins/mini-comment.lua;
        }
        {
            plugin = nvim-treesitter;
            type = "lua";
            config = builtins.readFile ./plugins/nvim-treesitter.lua;
        }
    ];
  };
}
