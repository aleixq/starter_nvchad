vim.api.nvim_echo({{'Setting dap:  applied', 'None'}}, false, {})
local dap, dapui = require "dap", require "dapui"

-- Setup Telescope dap extension
local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
    telescope.load_extension "dap"
end

-- Setup cmp dap
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
    cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
        sources = cmp.config.sources({
            { name = "dap" },
        }, {
            { name = "buffer" },
        }),
    })
end

-- Set Icons
vim.api.nvim_call_function(
 "sign_define",
 { "DapBreakpoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapBreakpointCondition", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapLogPoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapStopped", { linehl = "GitSignsChangeVirtLn", text = "", texthl = "diffChanged", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapBreakpointRejected", { linehl = "", text = "", texthl = "", numhl = "" } }
)

-- Setup DAPUI
dapui.setup({
  icons = { collapsed = "", current_frame = "", expanded = "" },
  layouts = {
    {
      elements = { "scopes", "watches", "stacks", "breakpoints" },
      size = 80,
      position = "left",
    },
    { elements = { "console", "repl" }, size = 0.25, position = "bottom" },
  },
  render = { indent = 2 },
})


-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

-- Added event for open DAUI
dap.listeners.after.event_initialized['dapui_config'] = function()
 dapui.open()

end
