-- basic
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', 'd/', ':noh')

-- project navigation
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>')

-- markdown preview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<CR>')
vim.keymap.set('n', '<leader>mt', ':Markview toggle<CR>')

-- wrap
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '0', 'g0', { noremap = true })
vim.keymap.set('n', '$', 'g$', { noremap = true })

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references)
        vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float)
        vim.keymap.set('n', '<leader>lh', vim.lsp.buf.document_highlight)
    end
})

-- git
-- see ./plugins/gitsigns.lua
