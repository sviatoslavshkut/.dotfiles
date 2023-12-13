vim.g.mapleader = ' '

local keymap = vim.keymap

-- delete single character without copying into register
keymap.set("n", "x", '"_x')


keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set('', '<leader>y', '"+y', { desc = "Yank to clipboard" }) -- E.g: <leader>yy will yank current line to os clipboard
keymap.set('', '<leader>Y', '"+y$', { desc = "Yank until EOL to clipboard" })
