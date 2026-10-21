vim.g.mason_proxy = "http://127.0.0.1:7890"
vim.g.mason_https_proxy = "http://127.0.0.1:7890"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins.ui" },
        { import = "plugins.lsp" },
        { import = "plugins.navigation" },
        { import = "plugins.editing" },
    },
})

