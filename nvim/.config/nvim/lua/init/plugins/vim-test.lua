return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Run nearest test" })
    keymap.set("n", "<leader>tT", ":TestFile<CR>", { desc = "Run tests in a current file" })
    keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Run all tests" })
    keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Re-run last test" })
    keymap.set("n", "<leader>tb", ":TestVisit<CR>", { desc = "Jump back to last test file" })

    vim.g.VimuxUseNearest = 0

    vim.cmd("let test#strategy = 'vimux'")
  end,
}
