return {
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme("gruvbox-material")
  --     vim.cmd("hi LineNrAbove guifg=red ctermfg=red")
  --     vim.cmd("hi LineNrBelow guifg=green ctermfg=green")
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight-moon]])
  --     vim.cmd("hi LineNr guifg=white ctermfg=white") -- Set color for the current line number
  --     vim.cmd("hi LineNrAbove guifg=red ctermfg=red") -- Set color for the line number above
  --     vim.cmd("hi LineNrBelow guifg=green ctermfg=green") -- Set color for the line number below
  --   end,
  -- },
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-mocha]])
      vim.cmd("hi LineNr guifg=white ctermfg=white") -- Set color for the current line number
      vim.cmd("hi LineNrAbove guifg=red ctermfg=red") -- Set color for the line number above
      vim.cmd("hi LineNrBelow guifg=green ctermfg=green") -- Set color for the line number below
    end,
  },
}
