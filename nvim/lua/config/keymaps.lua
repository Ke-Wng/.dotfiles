-- <leader> used for open new windows
-- <C/A-*> used for others

vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>-", "<C-w>s") -- 水平新增窗口 
keymap.set("n", "<leader>|", "<C-w>v") -- 垂直新增窗口
-- others
keymap.set("n", "<C-s>", ":w<CR>") -- C-v to save
keymap.set("n", "<leader>nh", ":nohl<CR>")


-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
-- bufferline
keymap.set("n", "<A-l>", ":bnext<CR>")
keymap.set("n", "<A-h>", ":bprevious<CR>")
keymap.set("n", "bc", ":bdelete<CR>")
keymap.set("n", '<C-k>', function()
    vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = 'toggle signature' })
