return {
	"folke/tokyonight.nvim",
	opts = {
		style = "storm",
		transparent = true, -- 全局透明
		styles = {
			sidebars = "transparent", -- 侧边栏透明
			floats = "transparent", -- 浮动窗口透明
		},
		on_highlights = function(hl, c)
			-- hl 是当前高亮组的表，c 是主题定义的颜色表
			-- 直接设置行号颜色
			hl.LineNr = { fg = "#FFFF00", bold = true } -- 普通行号
			hl.LineNrAbove = { fg = "#A8C7E0" } -- 柔和的淡蓝
			hl.LineNrBelow = { fg = "#A8C7E0" } -- 柔和的淡粉
            hl.Comment = { fg = "#A8C7A1", bg = "NONE" }
		end,
	},
	priority = 1000,
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
