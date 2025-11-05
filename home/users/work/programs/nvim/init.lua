vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.scrolloff = 20

vim.pack.add({
    { src = "https://github.com/echasnovski/mini.pick" }
})

require "mini.pick".setup()
