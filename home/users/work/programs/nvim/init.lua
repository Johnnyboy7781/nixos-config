vim.pack.add({
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-mini/mini.files" },
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

require "vague".setup({
    italic = false
})
vim.cmd("colorscheme vague")

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

local mini_pick_win_config = function()
    local height = math.floor(0.80 * vim.o.lines)
    local width = math.floor(0.80 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width))
    }
end

require "mini.pick".setup({
    mappings = {
        move_up = '<C-k>',
        move_down = '<C-j>'
    },
    window = {
        config = mini_pick_win_config
    }
})

require "mini.comment".setup()
require "lualine".setup()
require "mini.files".setup()
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
})
