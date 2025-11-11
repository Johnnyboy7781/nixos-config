vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "quickfix",
    callback = function()
        vim.cmd("cclose")
    end
})
