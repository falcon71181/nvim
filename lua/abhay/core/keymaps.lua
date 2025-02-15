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

-- Map Shift+Tab to unindent
keymap.set({ "n", "v" }, "<S-Tab>", ":silent! normal! <<gv<CR>")

-- Map Tab to indent
keymap.set({ "n", "v" }, "<Tab>", ":silent! normal! >>gv<CR>")

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

keymap.set("n", "<leader>sF", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
keymap.set("n", "<leader>sf", "<cmd>Telescope git_files<cr>", { desc = "Find git files in cwd" })
keymap.set(
  "n",
  "<leader>sa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
  { desc = "Find files including hidden files" }
)
keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>sC", "<cmd>Telescope colorscheme<cr>", { desc = "List colorschemes" })
keymap.set("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in the file" })
keymap.set("n", "<leader>sp", "<cmd>Telescope prosession<cr>", { desc = "Find sessions" })
keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "Find undo history" })

keymap.set("n", "<leader>gdd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definitions" })
keymap.set("n", "<leader>gdi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Go to implementations" })
keymap.set("n", "<leader>gdr", "<cmd>Telescope lsp_references<cr>", { desc = "Go to references" })
keymap.set(
  "n",
  "<leader>gdD",
  "<cmd>Telescope diagnostics severity=error<cr>",
  { desc = "Go to diagnostics severity error" }
)
keymap.set("n", "<leader>gDD", "<cmd>Telescope diagnostics<cr>", { desc = "Go to diagnostics" })
keymap.set("n", "<leader>gdt", "<cmd>Telescope treesitter<cr>", { desc = "Go to treesitter" })

keymap.set("n", "<leader>ggc", "<cmd>Telescope git_commits<cr>", { desc = "Go to git commits" })
keymap.set("n", "<leader>ggb", "<cmd>Telescope git_branches<cr>", { desc = "Go to git branches" })
keymap.set("n", "<leader>ggs", "<cmd>Telescope git_stash<cr>", { desc = "Go to git stash" })
keymap.set("n", "<leader>ggS", "<cmd>Telescope git_status<cr>", { desc = "Go to git status" })
keymap.set("n", "<leader>ggt", "<cmd>Telescope treesitter<cr>", { desc = "Go to treesitter" })

keymap.set("n", "<leader>ggo", "<cmd>DiffviewOpen<cr>", { desc = "Go to git commits" })
keymap.set("n", "<leader>ggh", "<cmd>DiffviewFileHistory<cr>", { desc = "Go to git commits" })
keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Go to git commits" })

keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })

keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<cr>", { desc = "Maximize/minimize a split" })
