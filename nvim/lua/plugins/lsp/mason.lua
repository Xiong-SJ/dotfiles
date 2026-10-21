local lsp_servers = {
	"lua-language-server",
	"pyright",
	"typescript-language-server",
	"gopls",
	"phpactor",
    "clangd",
    "kulala_ls",
}

return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {
		options = {
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
	config = function(_, opts)
		require("mason").setup(opts)

		-- 安装 LSP 服务器（使用公共列表）
		local mason_registry = require("mason-registry")
		for _, pkg_name in ipairs(lsp_servers) do
			local ok, pkg = pcall(mason_registry.get_package, pkg_name)
			if ok and not pkg:is_installed() then
				pkg:install()
			end
		end

		-- LSP 的 on_attach（禁用自身格式化）
		local on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			-- 可绑定其他快捷键，如：
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			automatic_installation = false, -- 已手动安装
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
