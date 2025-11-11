vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*.qf",
    callback = function()
        vim.cmd("cclose")
    end
})
