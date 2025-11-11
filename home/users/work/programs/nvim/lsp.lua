local lspconfig = require('lspconfig')

lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

require 'lspconfig'.ts_ls.setup({})
require 'lspconfig'.eslint.setup({})
require 'lspconfig'.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
require 'lspconfig'.angularls.setup({})
require 'lspconfig'.cssls.setup({})
require 'lspconfig'.emmet_ls.setup({})
require 'lspconfig'.jsonls.setup({})
require 'lspconfig'.html.setup({})
require 'lspconfig'.bashls.setup({})
require 'lspconfig'.yamlls.setup({})
require 'lspconfig'.dockerls.setup({})
require 'lspconfig'.nixd.setup({})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' }
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    })
})
