-- basic
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>w', ':write<CR>')

-- project navigation
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>s', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open(vim.api.nvim_bug_get_name(0), false)<CR>')

-- markdown preview
vim.keymap.set('n', '<leader>mds', ':Markview splitToggle<CR>')
vim.keymap.set('n', '<leader>mdt', ':Markview toggle<CR>')

-- wrap
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '0', 'g0', { noremap = true })
vim.keymap.set('n', '$', 'g$', { noremap = true })

