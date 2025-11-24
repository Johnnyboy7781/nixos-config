vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe'
    },
    cache_enabled = 1
}
