-- 普通模式：进入字符可视模式并全选
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = '全选' })

-- 插入模式：先退出到普通模式，再全选
vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { desc = '全选' })

-- 可视模式：保持全选（如果已经选中部分内容，再次按下扩展到全文）
vim.keymap.set('v', '<C-a>', '<Esc>ggVG', { desc = '全选' })

-- 撤销
vim.keymap.set({ "n", "i", "x" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })

-- 恢复撤销
vim.keymap.set({ "n", "i", "x" }, "<C-y>", "<Cmd>redo<CR>", { silent = true })

-- 复制
-- 1. 普通模式：复制当前整行到系统剪贴板
vim.keymap.set("n", "<C-c>", '"+yy')

-- 2. 可视模式：复制选中内容到系统剪贴板
vim.keymap.set("v", "<C-c>", '"+y')

-- 3. 插入模式：覆盖默认的"退出"行为，改为复制当前行并保持插入位置
vim.keymap.set("i", "<C-c>", '<Esc>"+yygi')

-- 剪贴
-- 普通模式
vim.keymap.set("n", "<C-x>", "dd") -- Ctrl+x 删除当前行（默认寄存器）
vim.keymap.set("n", "dd", '"_dd') -- dd 删除到黑洞（不污染寄存器）

-- 可视模式（纯可视 x）
vim.keymap.set("x", "<C-x>", "d") -- Ctrl+x 删除选中文本（默认寄存器）
vim.keymap.set("x", "d", '"_d') -- 删除选中文本

-- 插入模式
vim.keymap.set("i", "<C-x>", "<Esc>ddgi") -- Ctrl+x 删除当前行并保持插入位置

vim.keymap.set("n", "/", "?", { desc = "向上搜索" })
vim.keymap.set("n", "?", "/", { desc = "向下搜索" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "跳转到声明" })

-- 项目内搜索
vim.keymap.set({ "n", "i", "v" }, "<C-S-f>", "<Cmd>Telescope live_grep<CR>", { silent = true })
-- 当前文件搜索
vim.keymap.set({ "n", "i", "v" }, "<C-/>", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { silent = true })


-- -- 关键：设置虚拟行的溢出行为为 "wrap"，开启自动换行
-- vim.opt.virt_lines_overflow = "wrap"
--
-- -- 用 <leader>le 来切换虚拟行显示
-- vim.keymap.set({"n","i","x"}, "<F3>", function()
-- 	local current = vim.diagnostic.config().virtual_lines
-- 	vim.diagnostic.config({ virtual_lines = not current })
-- end, { desc = "Toggle diagnostic virtual lines" })


-- 空格 + l 向右跳转（回到右侧代码区）
vim.keymap.set("n", " l", "<C-w>l", { noremap = true, silent = true })
-- 空格 + h 向左跳转（去左侧的 Neo-tree，替换掉你之前写的 <leader>h）
vim.keymap.set("n", " h", "<C-w>h", { noremap = true, silent = true })

vim.keymap.set("n", " j", "<C-w>j", { noremap = true, silent = true })

vim.keymap.set("n", " k", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", " h", "<C-w>h", { noremap = true, silent = true })

-- 跳转到所有级别的诊断（默认行为）
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = '下一个诊断（所有级别）' })

vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = '上一个诊断（所有级别）' })

-- 仅跳转到 Error 级别的诊断
vim.keymap.set('n', ']e', function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = '下一个错误' })

vim.keymap.set('n', '[e', function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = '上一个错误' })
