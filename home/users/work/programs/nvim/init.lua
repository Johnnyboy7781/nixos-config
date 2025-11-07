vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.scrolloff = 10
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.spellsuggest = "5"
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "+++ "
vim.g.mapleader = " "

vim.pack.add({
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-mini/mini.files" },
    { src = "https://github.com/karb94/neoscroll.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
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

require "mini.pick".setup({
    mappings = {
        move_up = '<C-k>',
        move_down = '<C-j>'
    }
})

require "mini.comment".setup()
require "lualine".setup()
require "mini.files".setup()
require "neoscroll".setup()
require "nvim-autopairs".setup()
require "gitsigns".setup()

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>mds', ':Markview splitToggle<CR>')
vim.keymap.set('n', '<leader>mdt', ':Markview toggle<CR>')
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '0', 'g0', { noremap = true })
vim.keymap.set('n', '<S-4>', 'g<S-4>', { noremap = true })

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
