return {
  "christoomey/vim-tmux-navigator",
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>", { desc = "tmux navigate left" })
    keymap.set("n", "C-j", ":TmuxNavigateDown<CR>", { desc = "tmux navigate down" })
    keymap.set("n", "C-k", ":TmuxNavigateUp<CR>", { desc = "tmux navigate up" })
    keymap.set("n", "C-l", ":TmuxNavigateRight<CR>", { desc = "tmux navigate right" })
  end,
}
