local  languang_install= {
    "lua",
    "python"
}

return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    branch = "master", -- 详见本系列的附录
    event = "VeryLazy",
    opts = {
        ensure_installed = languang_install,
        highlight = { enable = true }
    },
}

