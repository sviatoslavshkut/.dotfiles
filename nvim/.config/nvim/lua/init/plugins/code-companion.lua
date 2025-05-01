return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>cc", ":CodeCompanionChat Toggle<CR>", desc = "Open/close code companion chat" },
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "o4-mini",
            },
          },
        })
      end,
    },
    strategies = {},
  },
}
