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
    "cljoly/telescope-repo.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", "__pycache__", "target" },
        layout_config = {
          width = 0.75,
          prompt_position = "top",
          preview_cutoff = 35,
          center = {
            mirror = true,
          },
          vertical = {
            preview_height = 0.45,
            mirror = true,
          },
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- Enable fuzzy matching
          override_generic_sorter = true, -- Override the generic sorter
          override_file_sorter = true, -- Override the file sorter
          case_mode = "smart_case", -- Set a valid case mode (important!)
        },
        undo = {
          use_delta = true,
          side_by_side = false,
          vim_diff_opts = { ctxlen = 0 },
          entry_format = "v #$ID, $STAT, $TIME",
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

    telescope.load_extension("fzf")
    telescope.load_extension("repo")
    telescope.load_extension("undo")
    telescope.load_extension("media_files")
    telescope.load_extension("prosession")

    local home_dir = vim.fn.expand("$HOME")
    local proj_dir = vim.env.PROJ or home_dir -- Use $PROJ if set, else fallback to $HOME
    -- Generic function wrapper to defer execution
    local function create_telescope_func(telescope_func, hidden)
      return function()
        telescope_func({
          cwd = proj_dir,
          hidden = hidden, -- Include hidden files (only affects find_files)
          file_ignore_patterns = {
            "bundle.js", -- To ignore massive bundle js file
            "node_modules/",
            "target/",
            ".git/",
            ".cache/",
            "build/",
            "dist/",
            "venv/",
            "__pycache__/",
          },
        })
      end
    end
    local keymap = vim.keymap -- for conciseness
    -- Key mappings for find_files
    keymap.set(
      "n",
      "<leader>sa",
      create_telescope_func(builtin.find_files, true),
      { desc = "Find files in project root including hidden files" }
    )
    keymap.set(
      "n",
      "<leader>sf",
      create_telescope_func(builtin.find_files, false),
      { desc = "Find files in project root" }
    )

    -- Key mappings for live_grep
    keymap.set(
      "n",
      "<leader>sg",
      create_telescope_func(builtin.live_grep, false),
      { desc = "Search text in project root" }
    )
    keymap.set(
      "n",
      "<leader>sG",
      create_telescope_func(builtin.live_grep, true),
      { desc = "Search text in project root including hidden files" }
    )

    -- Key mapping for grep_string (search word under cursor)
    keymap.set("n", "<leader>sc", function()
      builtin.grep_string({
        cwd = proj_dir,
        file_ignore_patterns = {
          "bundle.js", -- To ignore massive bundle js file
          "node_modules/",
          "target/",
          ".git/",
          ".cache/",
          "build/",
          "dist/",
          "venv/",
          "__pycache__/",
        },
      })
    end, { desc = "Find string under cursor in project root" })

    keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })
    keymap.set("n", "<leader>sF", "<cmd>Telescope git_files<cr>", { desc = "Find git files in cwd" })
    keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
    keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
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
  end,
}
