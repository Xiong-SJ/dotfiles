local languages_install = {
    "lua",
    "python",
    "asm",
    "http",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- 禁止懒加载，必须启动时初始化
    build = ":TSUpdate",
    config = function()
        -- 1. 初始化插件（不传任何参数，因为参数已被删除）
        require("nvim-treesitter").setup()

        -- 2. 显式调用 install 函数下载并编译解析器
        require("nvim-treesitter").install(languages_install)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })

    end,
}

