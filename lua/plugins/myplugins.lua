local overrides = require("configs.overrides")

-- As we load some NvChad plugins globally we need to ensure that the nvchad paths in the global runtimepath are defined
vim.opt.rtp:prepend("/etc/xdg/nvim/NvChad")

vim.api.nvim_echo({{'Loading V2.0 custom plugins', 'None'}}, false, {})

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  -- This only works installed locally (~/.config not on /etc/xdg as python is not found...)
--  {"vim-vdebug/vdebug",
--  lazy = false,
--  enabled = true,
--  config = function()
--    vim.api.nvim_echo({{'loading vdebug', 'none'}}, false, {})
--    vim.cmd("let g:vdebug_options_custom = {'port' : 9012,'layout': 'vertical','break_on_open' : 1,'server': '127.0.0.1', 'auto_start': '1', 'debug_file': '~/log/vdebug.log'}")
--    vim.cmd("let g:vdebug_options = extend(vdebug_options_defaults,vdebug_options_custom)")
--    vim.cmd('let g:vdebug_keymap = { "run" : "<f5>","run_to_cursor" : "<f6>","step_over" : "<f7>","step_into" : "<f8>","step_out" : "<s-f8>", "close" : "<f5>x", "detach" : "<f5>d", "set_breakpoint" : "<f10>", "get_context" : "<f10>x", "eval_under_cursor" : "<f10>c", "eval_visual" : "<f10>e" }')
--    -- For some reason this is not defined : https://github.com/vim-vdebug/vdebug/issues/519
--    vim.cmd(":noremap <F4> :python3 debugger.close()<cr>")
--  end,
--},
{
	"neovim/nvim-lspconfig",
	config = function()
		require "nvchad.configs.lspconfig"
		require "configs.lspconfig"
	end,
},
{
  -- Mason lspconfig
  "williamboman/mason-lspconfig.nvim",
  config = function()
  end,
},
{
 "mfussenegger/nvim-dap",
 lazy = true,
 dependencies = {
  "jay-babu/mason-nvim-dap.nvim",
  config = function()
    require("mason-nvim-dap").setup()
  end,
  "theHamsta/nvim-dap-virtual-text",
  "rcarriga/nvim-dap-ui",
  "nvim-telescope/telescope-dap.nvim",
  "rcarriga/cmp-dap",
  "nvim-neotest/nvim-nio"
 },
 cmd = {
  "DapContinue",
  "DapLoadLaunchJSON",
  "DapRestartFrame",
  "DapSetLogLevel",
  "DapShowLog",
  "DapStepInto",
  "DapStepOut",
  "DapStepOver",
  "DapTerminate",
  "DapToggleBreakpoint",
  "DapToggleRepl",
 }
},
{
 'Exafunction/codeium.vim',
  event = 'BufEnter'
},
{ "nvzone/volt", lazy = true },
{ "nvzone/menu" , lazy = true },
  {
  "nvzone/minty",
  cmd = { "Shades", "Huefy" },
}
}

return plugins

