-- set leader key to space
vim.g.mapleader = " "

-- Files and Others
vim.o.fileencoding = "utf-8" -- File Encoding
vim.o.shell = "/usr/local/bin/fish"
vim.g.loaded_netrw = 1 -- Helps opening links in the internet (probabilly -_-)
vim.g.loaded_netrwPlugin = 1
vim.opt.autochdir = true
vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.opt.iskeyword:append("-,_")
vim.opt.virtualedit = "block"

-- Appearance
vim.opt.termguicolors = true
vim.o.pumheight = 10 -- Max items to show in pop up menu
vim.o.cmdheight = 1 -- Max items to show in command menu
vim.o.conceallevel = 0 -- For markdown like elements

-- Tabs and indentations
vim.o.tabstop = 2 -- Number of spaces a tab character represents
vim.bo.tabstop = 2
vim.o.showtabline = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2 -- Number of spaces to use for each indentation level
vim.bo.shiftwidth = 2
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = false
vim.bo.autoindent = false
vim.o.expandtab = true -- Use spaces instead of tabs
vim.bo.expandtab = true
vim.o.smarttab = true -- Enable smart tabbing
-- vim.opt.backspace = "2"
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.cursorline = true
-- vim.opt.autoread = true

-- use spaces for tabs and whatnot

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

--Line numbers

vim.wo.number = true
vim.wo.relativenumber = true

local keymap = vim.keymap -- for conciseness

---------------------

-- Map Shift+Tab to unindent in visual mode and normal mode
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Map Tab to indent in visual mode and normal mode
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("v", "<Tab>", ">gv")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Change / Replace every instance of the word under cursor
keymap.set("n", "<leader>c", [[:%s/<C-r><C-w>//g<Left><Left>]])

-- Errors
keymap.set("n", "L", vim.diagnostic.open_float)

-- Copy to wl-copy
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", "<cmd>%y+<CR>")
keymap.set("n", "Y", [["+Y]])

keymap.set("n", "<leader>ggo", "<cmd>DiffviewOpen<cr>", { desc = "Go to git commits" })
keymap.set("n", "<leader>ggh", "<cmd>DiffviewFileHistory<cr>", { desc = "Go to git commits" })
keymap.set("n", "<leader>ggD", "<cmd>DiffviewClose<cr>", { desc = "Go to git commits" })

keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<cr>", { desc = "Maximize/minimize a split" })
