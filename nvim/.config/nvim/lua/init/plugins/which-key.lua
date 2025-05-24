return {
  "folke/which-key.nvim",
  event = "BufReadPost",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 1500
  end,
  opts = {},
}
