math.randomseed(os.time())
local _Opts = {}

-- 终端配置（居中浮空）
_Opts.terminal = {
	enabled = true,
	bo = {
		buflisted = false, -- 防止终端出现在顶部标签栏
	},
	win = {
		position = "float", -- 浮窗模式
		relative = "editor", -- 【核心关键】相对整个编辑器居中！
		width = 0.9, -- 占屏幕宽度的 60%
		height = 0.8, -- 占屏幕高度的 40%
		border = "rounded", -- 圆角边框
		transparent = true, -- 如果你的终端支持透明，可以打开这行
	},
}

-- 全局动画设置
_Opts.animate = {
	duration = 20,
	easing = "linear",
	fps = 120,
}

-- 启动时优化大文件和快文件
_Opts.bigfile = { enabled = true }
_Opts.quickfile = { enabled = true }

-- 启动界面（如果没有自定义 Header，使用默认内置样式）
_Opts.dashboard = {
	enabled = true,
}

-- 【禁用】与 neo-tree 冲突
_Opts.explorer = { enabled = false }

-- indent-blankline 冲突
_Opts.indent = {
	enabled = true,
	chunk = {
		enabled = true,
	},
	animate = {
		enabled = false, -- 禁用缩进动画
	},
}

-- 输入框美化
_Opts.input = { enabled = true }

-- 【禁用】与 telescope 冲突
_Opts.picker = { enabled = false }

-- 通知模块（替换掉依赖自定义图标库的部分，使用内置图标）
_Opts.notifier = {
	enabled = true,
	style = "fancy",
	date_format = "%c",
	icons = {
		error = "✖", -- 或者直接留空使用默认
		warn = "⚠",
		info = "ℹ",
	},
}

-- 代码作用域高亮
_Opts.scope = { enabled = true }

-- 平滑滚动
_Opts.scroll = { enabled = true }

-- 状态列优化
_Opts.statuscolumn = { enabled = true }

-- 单词高亮


-- 启用 picker 组件
-- _Opts.picker = { enabled = true },

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = _Opts,
		-- 将原先 require("keymaps.snacks") 改为直接内置按键映射
		keys = {
			{
				" t",
				function()
                    Snacks.terminal()
				end,
				desc = "Toggle Floating Terminal (Centered)",
			},
			-- 如果你有时候想要一个底部终端，可以额外加一个快捷键：
			{
				" T",
				function()
					Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.3 } })
				end,
				desc = "Toggle Terminal (Bottom)",
			},
			-- {
			-- 	"<C-S-f>",
			-- 	function()
			-- 		Snacks.picker.files()
			-- 	end,
			-- 	desc = "Find Files",
			-- },
		},
	},
}
