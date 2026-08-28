return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
    config = function()
        -- 直接在 Visual 模式下用符号触发包裹（覆盖默认功能）
        vim.keymap.set("v", '"', '<Plug>(nvim-surround-visual)"', { desc = '包裹双引号' })
        vim.keymap.set("v", '\'', '<Plug>(nvim-surround-visual)\'', { desc = '包裹双引号' })
        vim.keymap.set("v", "(", '<Plug>(nvim-surround-visual)(', { desc = '包裹圆括号' })
        vim.keymap.set("v", "[", '<Plug>(nvim-surround-visual)[', { desc = '包裹方括号' })
        vim.keymap.set("v", "{", '<Plug>(nvim-surround-visual){', { desc = '包裹花括号' })
        vim.keymap.set("v", "t", '<Plug>(nvim-surround-visual)t', { desc = '包裹HTML标签' })
        vim.keymap.set("v", "T", '<Plug>(nvim-surround-visual)T', { desc = '包裹HTML标签' })
    end,
}
