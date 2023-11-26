vim.g.mapleader = ' '

local keymap = vim.keymap

-- delete single character without copying into register
keymap.set("n", "x", '"_x')


keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })
