require "gitsigns".setup({
    numhl = true,
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- nav
        map('n', 'g]', function()
            if vim.wo.diff then
                vim.cmd.normal({'g]', bang = true})
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', 'g[', function()
            if vim.wo.diff then
                vim.cmd.normal({'g[', bang = true})
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- action
        map('n', '<leader>gr', gitsigns.reset_hunk)
        map('n', '<leader>gR', gitsigns.reset_buffer)
        map('n', '<leader>gp', gitsigns.preview_hunk_inline)
        map('n', '<leader>gb', gitsigns.blame)
        map('n', '<leader>gl', gitsigns.setqflist)
    end
})
