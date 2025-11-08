vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/karb94/neoscroll.nvim" },
    { src = "https://github.com/nvim-mini/mini.comment" },
    {
        src = "https://github.com/OXY2DEV/markview.nvim",
        data = {
            lazy = false
        }
    },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        data = {
            lazy = false,
            branch = "main",
            build = ":TSUpdate"
        }
    }
})

require "nvim-treesitter".setup({
    ensure_installed = {
        "markdown",
        "markdown_inline",
        "html",
        "latex",
        "yaml",
        "typst"
    }
})

require "mini.comment".setup()
require "lualine".setup()
require "neoscroll".setup()

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

vim.lsp.enable({
    "lua_ls",
    "nil_ls",
    "angularls",
    "java_language_server",
    "bashls"
})
