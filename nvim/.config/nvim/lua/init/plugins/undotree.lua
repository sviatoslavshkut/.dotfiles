return {
  "mbbill/undotree",
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Show undo tree" })
  end,
}
