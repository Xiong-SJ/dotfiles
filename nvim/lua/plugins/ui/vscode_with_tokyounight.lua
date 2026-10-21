return {
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "moon",
      },
      on_highlights = function(hl, c)
        -- 保留你原来的 UI 自定义
        hl.LineNr      = { fg = "#FFFF00", bold = true }
        hl.LineNrAbove = { fg = "#A8C7E0" }
        hl.LineNrBelow = { fg = "#A8C7E0" }
        hl.Comment     = { fg = "#6A9955", bg = "NONE" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")

      -- 关掉 LSP 语义高亮，防止盖过 Treesitter 造成配色混搭
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      -- ============ 从你的真实颜色表里取色 ============
      local vsc = require("vscode.colors").get_colors()
      local KW_PINK   = vsc.vscPink       -- #C586C0 控制流关键字 (if/else/return/for)
      local KW_BLUE   = vsc.vscBlue       -- #569CD6 定义关键字 (def/class/import) + 内置常量
      local FN        = vsc.vscYellow     -- #DCDCAA 函数名
      local TYPE      = vsc.vscBlueGreen  -- #4EC9B0 类名/类型
      local VAR       = vsc.vscLightBlue  -- #9CDCFE 变量/参数/属性
      local STR       = vsc.vscOrange     -- #CE9178 字符串
      local NUM       = vsc.vscLightGreen -- #B5CEA8 数字
      local CONST     = vsc.vscAccentBlue -- #4FC1FF 常量
      local COMMENT   = vsc.vscGreen      -- #6A9955 注释
      local OPERATOR  = vsc.vscFront      -- #D4D4D4 运算符/标点

      -- ============ 映射表 ============
      local map = {
        -- === 控制流关键字（粉色）===
        ["@keyword.conditional"]         = KW_PINK,
        ["@keyword.conditional.ternary"] = KW_PINK,
        ["@keyword.repeat"]              = KW_PINK,
        ["@keyword.exception"]           = KW_PINK,
        ["@keyword.return"]              = KW_PINK,
        ["@keyword.coroutine"]           = KW_PINK,
        ["@conditional"]                 = KW_PINK,
        ["@repeat"]                      = KW_PINK,
        ["@exception"]                   = KW_PINK,

        -- === 定义类关键字（蓝色）===
        ["@keyword.function"]            = KW_BLUE,
        ["@keyword.import"]              = KW_BLUE,
        ["@keyword.storage"]             = KW_BLUE,
        ["@keyword.storage.modifier"]    = KW_BLUE,
        ["@keyword.directive"]           = KW_BLUE,
        ["@keyword.directive.define"]    = KW_BLUE,
        ["@include"]                     = KW_BLUE,
        ["@define"]                      = KW_BLUE,
        ["@storageclass"]                = KW_BLUE,

        -- === 兜底关键字 ===
        ["@keyword"]                     = KW_PINK,
        ["@keyword.operator"]            = KW_PINK,
        ["@keyword.debug"]               = KW_PINK,

        -- === 函数（黄色）===
        ["@function"]                    = FN,
        ["@function.builtin"]            = FN,
        ["@function.call"]               = FN,
        ["@function.macro"]              = FN,
        ["@function.method"]             = FN,
        ["@function.method.call"]        = FN,
        ["@constructor"]                 = FN,

        -- === 类型/类名（青蓝）===
        ["@type"]                        = TYPE,
        ["@type.builtin"]                = TYPE,
        ["@type.definition"]             = TYPE,
        ["@type.qualifier"]              = TYPE,
        ["@namespace"]                   = TYPE,
        ["@module"]                      = TYPE,
        ["@label"]                       = TYPE,

        -- === 变量/参数/属性（浅蓝）===
        ["@variable"]                    = VAR,
        ["@variable.parameter"]          = VAR,
        ["@variable.member"]             = VAR,
        ["@property"]                    = VAR,
        ["@field"]                       = VAR,

        -- === 内置变量 self/cls（蓝色）===
        ["@variable.builtin"]            = KW_BLUE,

        -- === 字符串（橙棕）===
        ["@string"]                      = STR,
        ["@string.escape"]               = STR,
        ["@string.regexp"]               = STR,
        ["@string.special"]              = STR,
        ["@character"]                   = STR,

        -- === 数字（浅绿）===
        ["@number"]                      = NUM,
        ["@number.float"]                = NUM,

        -- === 常量/布尔（亮蓝）===
        ["@boolean"]                     = KW_BLUE,   -- True/False
        ["@constant"]                    = CONST,
        ["@constant.builtin"]            = KW_BLUE,   -- None
        ["@constant.macro"]              = CONST,

        -- === 运算符/标点（浅灰）===
        ["@operator"]                    = OPERATOR,
        ["@punctuation.bracket"]         = OPERATOR,
        ["@punctuation.delimiter"]       = OPERATOR,
        ["@punctuation.special"]         = KW_PINK,

        -- === 注释（绿）===
        ["@comment"]                     = COMMENT,
        ["@comment.documentation"]       = COMMENT,
      }

      for group, color in pairs(map) do
        vim.api.nvim_set_hl(0, group, { fg = color })
      end

      -- 注释斜体
      vim.api.nvim_set_hl(0, "@comment", { fg = COMMENT, italic = true })
      vim.api.nvim_set_hl(0, "Comment",  { fg = COMMENT, bg = "NONE", italic = true })

      -- Python 里 not/is/and/or 没颜色的问题
      vim.api.nvim_set_hl(0, "@keyword.operator.python", { fg = KW_PINK })
    end,
  },
}
