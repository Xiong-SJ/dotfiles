local formatters = {
	{ "stylua", "stylua" }, -- Lua
	{ "black", "black" }, -- Python
	{ "clang-format", "clang_format" }, -- C/C++
	{ "goimports", "goimports" }, -- Go
	{ "pint", "pint" }, -- PHP（La:wqravel 常用）
	-- 可根据需要添加更多
}

return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        -- 安装格式化工具（使用公共列表）
        local mason_registry = require("mason-registry")
        for _, item in ipairs(formatters) do
            local pkg_name = item[1]  -- Mason 包名
            local ok, pkg = pcall(mason_registry.get_package, pkg_name)
            if ok and not pkg:is_installed() then
                pkg:install()
            end
        end

        -- 构建 sources 列表
        local null_ls = require("null-ls")
        local sources = {}
        for _, item in ipairs(formatters) do
            local builtin_name = item[2]  -- null-ls 内置源名称
            -- 获取对应的 builtins.formatting 函数
            local builtin = null_ls.builtins.formatting[builtin_name]
            if builtin then
                table.insert(sources, builtin)
            else
                vim.notify("null-ls: 未找到内置源 " .. builtin_name, vim.log.levels.WARN)
            end
        end

        null_ls.setup({
            sources = sources,
        })
    end,
    keys = {
        {
            "<C-A-l>",
            function()
                vim.lsp.buf.format()
            end,
        },
    },
}
