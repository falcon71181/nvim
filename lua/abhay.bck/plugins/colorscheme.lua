return {
  {
    -- "folke/tokyonight.nvim",
    -- priority = 1000,
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd [[colorscheme tokyonight-night]]
    -- end,
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
      vim.cmd("hi LineNrAbove guifg=red ctermfg=red")
      vim.cmd("hi LineNrBelow guifg=green ctermfg=green")
    end,
  },
}
