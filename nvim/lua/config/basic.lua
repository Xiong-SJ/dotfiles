vim.opt.number = true           -- 显示行号
vim.opt.relativenumber = true   -- 启用相对行号


vim.opt.cursorline = true       -- 高亮当前行
vim.opt.colorcolumn = "120"      -- 高亮80列

vim.opt.autoread = true         -- 自动重新加载文件

-- 使用 4 个空格代替 Tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.termguicolors = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.cmd('syntax on')


-- python的文件模板
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.py",
  callback = function()
    -- 只有当文件完全为空时（Neo-tree 创建的 0 字节文件正好符合这个条件）
    if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
      
      local filename = vim.fn.expand("%:t")
      local date = os.date("%Y/%m/%d %H:%M")

      local lines = {
        "#!/usr/bin/env python",
        "# -*- coding: utf-8 -*-",
        "# @Time    : " .. date,
        "# @Author  : YISHI",
        "# @Email   : wowoxionsgj123123@outlook.com",
        "# @File    : " .. filename,
        "# @Software: Neovim",
        "",
        "# 标准库导入",
        "# import json",
        "",
        "# 第三方库导入",
        "# import numpy",
        "",
        "# 本地模块导入",
        "# from utils import helper",
        "",
        "",
        "def main():",
        "    pass",
        "",
        "",
        "if __name__=='__main__':",
        "   main()"
      }

      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      -- 可选：自动跳到第一行末尾或进入插入模式
      -- vim.api.nvim_win_set_cursor(0, {1, 0}) 
    end
  end,
})
