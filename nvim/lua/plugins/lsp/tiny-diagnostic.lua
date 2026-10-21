-- lua/plugins/tiny-diagnostic.lua
return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			options = {
				add_messages = {
					display_count = true,
				},
				multilines = {
					enabled = true,
					always_show = false, -- 初始状态：只在光标行显示
				},
				enable_on_insert = true,
			},
		},
		config = function(_, opts)
			vim.diagnostic.config({ virtual_text = false })
			-- 调用 setup 应用默认配置
			require("tiny-inline-diagnostic").setup(opts)
		end,
	},
}
