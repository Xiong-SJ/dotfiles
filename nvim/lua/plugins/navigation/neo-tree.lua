-- lua/plugins/neo-tree.lua
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- 建议使用稳定的 v3.x 分支[reference:1][reference:2]
	dependencies = {
		"nvim-lua/plenary.nvim", -- 必需，提供后端工具[reference:3]
		"MunifTanjim/nui.nvim", -- 必需，提供UI组件[reference:4]
		"nvim-tree/nvim-web-devicons", -- 强烈推荐，用于显示文件图标[reference:5][reference:6]
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = false, -- 设为 false，让过滤规则生效
				hide_dotfiles = false, -- 关键：设为 false 显示隐藏文件
			},
		},
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
				},
			},
		})
		-- 在 config 中设置快捷键，保证插件加载完成后才生效
		vim.keymap.set({"n","i" ,"x" }, "<F2>", ":Neotree toggle<CR>", { noremap = true, silent = true })
	end,
}
