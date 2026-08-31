return{
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    -- 建议关闭内置的 virtual_text，避免重复显示
    vim.diagnostic.config({ virtual_text = false })
    -- 快捷键：一键切换显示/隐藏错误行
    vim.keymap.set({"n","i","x"}, "<F3>", require("lsp_lines").toggle, { desc = "切换LSP错误行显示" })
  end,
}
