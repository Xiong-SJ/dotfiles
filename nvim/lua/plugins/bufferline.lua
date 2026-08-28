return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			offsets = {
				{
					-- 关键：指定 neo-tree 的文件类型
					filetype = "neo-tree",
					-- 在标签栏预留位置显示的文本，可以为空字符串 ""
					text = "File Explorer",
					-- 文本对齐方式
					text_align = "center",
					-- 是否显示分隔符
					separator = true,
				},
			}, separator_style = "padded_slant",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local indicator = " "
				for level, number in pairs(diagnostics_dict) do
					local symbol
					if level == "error" then
						symbol = " "
					elseif level == "warning" then
						symbol = " "
					else
						symbol = " "
					end
					indicator = indicator .. number .. symbol
				end
				return indicator
			end,
		},
	},
	keys = {
		{ "<S-A-h>", ":BufferLineCyclePrev<CR>", silent = true },
		{ "<S-A-l>", ":BufferLineCycleNext<CR>", silent = true },
		{ " bd", ":bdelete<CR>", silent = true },
		{ " bo", ":BufferLineCloseOthers<CR>", silent = true },
		{ "u", ":BufferLinePick<CR>", silent = true },
		{ " u", ":BufferLinePickClose<CR>", silent = true },
	},
	lazy = false,
}
