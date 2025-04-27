return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensurere_installed = {
        "rust",
        "toml",
        "java",
        "go",
        "yaml",
        "lua",
        "cpp",
        "c",
        "bash",
        "dockerfile",
        "gitignore",
        "vimdoc",
        "markdown",
        "regex",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
