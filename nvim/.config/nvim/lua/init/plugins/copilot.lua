return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    local keymap = vim.keymap
    keymap.set("i", "<C-y>", function()
      return vim.fn["copilot#Accept"]("<CR>")
    end, {
      expr = true,
      replace_keycodes = false,
      desc = "Accept copilot suggestion",
    })
  end,
}
