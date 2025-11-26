vim.api.nvim_echo({{'Loading DAP config from configs', 'None'}}, false, {})
local dap = require('dap')
-- require('telescope').load_extension('dap')

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { "/etc/xdg/nvim/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9012
    }
}

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
      elements = { 
        { id = "scopes", size = 0.65},
        { id = "watches", size = 0.2},
        { id = "stacks", size = 0.1},
        { id = "breakpoints", size = 0.05}
      },
      size = 30,
      position = "left",
    },
    { elements = { 
      --"console", 
      "repl" 
    }, size = 0.15, position = "bottom" },
  },
  render = { indent = 2 },
})


-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

-- Added event for open DAUI
dap.listeners.after.event_initialized['dapui_config'] = function()
 dapui.open()

end

-- Add mouse menus
vim.cmd.anoremenu{'PopUp.-Sep- :'} 
vim.cmd.anoremenu{'PopUp.DAP\\ Ui\\ toggle <cmd>:lua require("dapui").toggle()<CR>'}
