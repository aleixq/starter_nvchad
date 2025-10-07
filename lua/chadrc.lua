-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  --theme = "one_light",
  --hl_override = highlights.override,
  -- hl_add = highlights.add,
}

-- M.plugins = "plugins"

M.ui = {
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      table.insert(modules, " Ln %l, Col %c")
    end,
  },
}

-- check core.mappings for table structure
--M.mappings = require "mappings"
vim.api.nvim_echo({{'AKA NCHADrc global Custom options applied', 'None'}}, false, {})
return M
