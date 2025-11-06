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
    { src = "https://github.com/toppair/peek.nvim" }
})

require "vague".setup({
    italic = false
})
vim.cmd("colorscheme vague")

require "mini.pick".setup()
require "mini.comment".setup()
require "lualine".setup()
require "mini.files".setup()
require "neoscroll".setup()
require "nvim-autopairs".setup()
require "gitsigns".setup()
require "peek".setup()

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')

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
