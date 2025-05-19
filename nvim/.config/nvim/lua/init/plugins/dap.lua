return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_virtual_text = require("nvim-dap-virtual-text")
      local keymap = vim.keymap

      dapui.setup()
      dap_virtual_text.setup()

      keymap.set("n", "<leader>b", dap.toggle_breakpoint)
      keymap.set("n", "<leader>db", dap.run_to_cursor)

      -- Eval var under cursor
      keymap.set("n", "<leader>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      keymap.set("n", "<F9>", dap.continue)
      keymap.set("n", "<F7>", dap.step_into)
      keymap.set("n", "<F8>", dap.step_over)
      keymap.set("n", "<F6>", dap.step_out)
      keymap.set("n", "<F5>", dap.step_back)
      keymap.set("n", "<F12>", dap.restart)
      keymap.set("n", "<F11>", dap.stop)

      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-dap",
        name = "lldb",
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      dap.configurations.cpp = dap.configurations.c

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
