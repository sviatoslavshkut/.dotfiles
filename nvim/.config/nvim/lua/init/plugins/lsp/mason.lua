return {
  "mason-org/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        "jsonls",
        "cmake",
        "marksman",
        "rust_analyzer",
        "taplo",
        "yamlls",
        "bashls",
        "dockerls",
        "jdtls",
        "clangd",
        "zls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "stylua",
        "google-java-format",
        "clang-format",
        "prettier",
        "codelldb",
        "java-debug-adapter",
      },
    })
  end,
}
