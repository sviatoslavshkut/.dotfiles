vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

--undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--lsp
vim.keymap.set('n', '<leader>er', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next)
