return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "tpope/vim-obsession",
    "dhruvasagar/vim-prosession",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        path_display = { "truncate " },
        file_ignore_patterns = { "node_modules", "__pycache__" },
        layout_config = {
          width = 0.75,
          prompt_position = "top",
          preview_cutoff = 120,
          horizontal = { mirror = false },
          vertical = { mirror = false },
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        undo = {
          use_delta = true,
          side_by_side = false,
          vim_diff_opts = { ctxlen = 0 },
          entry_format = "state #$ID, $STAT, $TIME",
          time_format = "",
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<C-cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    })

    -- telescope.load_extension "fzf"
    telescope.load_extension("undo")
    telescope.load_extension("media_files")
    telescope.load_extension("prosession")
  end,
}
