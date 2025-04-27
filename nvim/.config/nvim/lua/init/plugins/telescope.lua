return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = {
          ".git",
          ".idea",
          ".vscode",
          "build",
          "target",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>ff", function()
      builtin.find_files({ hidden = true })
    end, { desc = "Fuzzy find files" })

    keymap.set("n", "<leader>fs", function()
      builtin.live_grep({
        additional_args = function()
          return { "--hidden" }
        end,
      })
    end, { desc = "Find string" })

    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor" })
    keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy search for files tracked by Git" })
    keymap.set("n", "<leader>qf", builtin.quickfix, { desc = "Lists items in the quickfix list" })
  end,
}
