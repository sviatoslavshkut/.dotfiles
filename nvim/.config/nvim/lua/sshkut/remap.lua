vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>p', vim.cmd.Ex)

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

--undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

