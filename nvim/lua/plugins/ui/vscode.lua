return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      local c = require('vscode.colors').get_colors() -- 获取主题色板

      require('vscode').setup({
        transparent = true, -- 1. 开启全局透明
        italic_comments = true,

        -- 2. 使用 group_overrides 覆盖特定高亮组，使其不透明
        group_overrides = {
          -- 补全菜单 (Pmenu) 不透明
          Pmenu = { bg = c.vscBack, fg = c.vscFront },
          PmenuSel = { bg = c.vscSelection, fg = c.vscFront, bold = true },
          PmenuSbar = { bg = c.vscScrollbar },
          PmenuThumb = { bg = c.vscScrollbarThumb },
          
          -- 当前行 (CursorLine) 不透明
          CursorLine = { bg = c.vscCursorDark },

           CursorLine = { bg = "none" },         -- 右侧当前行透明
          
          -- LSP 悬浮窗/签名帮助 (NormalFloat) 不透明（可选）
          NormalFloat = { bg = c.vscBack },
          FloatBorder = { bg = c.vscBack, fg = c.vscBorder },
        },
      })

      -- vim.cmd([[colorscheme vscode]])
    end,
  },
}
