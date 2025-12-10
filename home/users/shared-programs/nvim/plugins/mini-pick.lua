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
