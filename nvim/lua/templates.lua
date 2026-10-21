-- 1. 扩展名映射表（.py 对应 templates 下的 python 文件）
local extensions = {
	py = "python",
	-- js = "javascript", -- 以后想加别的语言，解开注释并创建对应模板即可
	-- sh = "bash",
}

-- 2. 模板文件夹路径
local template_dir = vim.fn.stdpath("config") .. "/templates"

-- 3. 读取模板并插入的核心函数
local function apply_template()
	local ext = vim.fn.expand("%:e") -- 获取当前文件的扩展名
	local template_name = extensions[ext]

	-- 如果没有配置对应语言的模板，直接退出
	if not template_name then
		return
	end

	-- 只有当文件完全为空时（Neo-tree创建0字节文件满足条件）才注入
	-- 并且判断是否是普通缓冲区（防止打开无文件名的缓冲区时触发）
	if vim.bo.buftype == "" and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
		local template_path = template_dir .. "/" .. template_name
		local file = io.open(template_path, "r")

		if file then
			local content = file:read("*a")
			file:close()

			-- 4. 动态替换占位符（根据需要可以随意添加）
			content = content:gsub("__TIME__", os.date("%Y/%m/%d %H:%M"))
			content = content:gsub("__FILENAME__", vim.fn.expand("%:t"))
			content = content:gsub("__AUTHOR__", "YISHI")
			content = content:gsub("__EMAIL__", "wowoxionsgj123123@outlook.com")

			-- 将字符串拆分为行数组，移除末尾多余的空行
			local lines = vim.split(content, "\n")
			if lines[#lines] == "" then
				table.remove(lines)
			end

			-- 写入缓冲区
			vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

			-- 可选：自动跳到第一行末尾
			vim.api.nvim_win_set_cursor(0, { 1, 0 })
		end
	end
end

-- 5. 注册自动命令（统一监听新建文件和空文件读取，完美兼容 Neo-tree）
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	pattern = "*", -- 监听所有文件类型
	callback = apply_template,
})
