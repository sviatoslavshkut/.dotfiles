return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            ensurere_installed = { "rust", "java", "go", "yaml", "lua" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end
}
