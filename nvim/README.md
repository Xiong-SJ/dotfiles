# Neovim 配置

基于 Lazy.nvim 的个人 Neovim 配置，模块化组织，涵盖 LSP、补全、文件导航、UI 等核心功能。

## 📁 目录结构

```
~/.config/nvim/
├── lua/
│   ├── config/
│   │   ├── basic.lua                    # 通用选项与自动命令
│   │   ├── keyboard.lua                 # 全局快捷键映射
│   │   └── lazy.lua                     # Lazy.nvim 启动与插件列表加载
│   │ 
│   └── plugins/
│       ├── ui/                          < - 代界面美化与视觉体验
│       │   ├── tokyonight.lua           # 主题配色 (Tokyonight)
│       │   ├── lualine.lua              # 状态栏 (Lualine)
│       │   ├── bufferline.lua           # 标签栏 (Bufferline)
│       │   └── indent-blankline.lua     # 缩进线 (Indent Blankline)
│       │ 
│       ├── lsp/                         < - 代码智能与 LSP
│       │   ├── mason.lua                # LSP 服务器安装器 (Mason)
│       │   ├── none-ls.lua              # 格式化与 Lint (none-ls)
│       │   ├── blink.lua                # 补全引擎 (Blink.cmp)
│       │   └── nvim-treesitter.lua      # 语法高亮与解析 (Treesitter)
│       │ 
│       ├── navigation/                  < - 搜索与导航
│       │   ├── telescope.lua            # 模糊搜索 (Telescope)
│       │   ├── neo-tree.lua             # 文件树 (Neo-tree)
│       │   └── hop.lua                  # 快速光标跳转 (Hop)
│       │ 
│       └── editing/                     < - 编辑增强与自动化
│           ├── nvim-autopairs.lua       # 自动括号配对
│           └── nvim-surround.lua        # 包围符操作 (Surround)
│
├── init.lua                             # Neovim 入口文件
├── lazy-lock.json                       # Lazy.nvim 版本锁定文件
└── README.md                            # 项目说明（本文件）
```
