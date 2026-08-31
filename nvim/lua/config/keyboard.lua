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

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = '跳转到定义' })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = '跳转到声明' })

-- 项目内搜索
vim.keymap.set({ "n", "i", "v" }, '<C-S-f>', "<Cmd>Telescope live_grep<CR>", { silent= true })
-- 当前文件搜索
vim.keymap.set({ "n", "i", "v" }, '<C-/>', "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { silent= true })
