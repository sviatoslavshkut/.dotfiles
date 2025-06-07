return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require("jdtls")
    local jdtls_dap = require("jdtls.dap")
    local nvim_data_path = vim.fn.stdpath("data")
    local jdtls_install_location = nvim_data_path .. "/mason/packages/jdtls"
    local launcher_jar = vim.fn.glob(jdtls_install_location .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local config_os = vim.fn.has("mac") == 1 and "mac" or (vim.fn.has("win32") == 1 and "win" or "linux")

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = nvim_data_path .. "/jdtls-workspace/" .. project_name
    vim.fn.mkdir(workspace_dir, "p")

    local java_debug_path = nvim_data_path .. "/mason/packages/java-debug-adapter"
    local java_debug_jar = vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")

    local config = {

      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        launcher_jar,
        "-configuration",
        jdtls_install_location .. "/config_" .. config_os,
        "-data",
        workspace_dir,
      },

      root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

      settings = {
        java = {},
      },

      init_options = {
        bundles = { java_debug_jar },
      },

      on_attach = function(_, bufnr)
        -- BufEnter is not triggered if it's the first time opening the buffer
        vim.lsp.codelens.refresh()
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
          buffer = bufnr,
          callback = function()
            vim.lsp.codelens.refresh()
          end,
        })
      end,
    }
    jdtls.start_or_attach(config)
    jdtls_dap.setup_dap_main_class_configs()
  end,
}
