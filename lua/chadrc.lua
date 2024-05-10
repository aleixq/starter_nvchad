---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
--local highlights = require "highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  --theme = "one_light",
  --hl_override = highlights.override,
  -- hl_add = highlights.add,
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
M.mappings = require "mappings"
vim.api.nvim_echo({{'AKA NCHADrc global Custom options applied', 'None'}}, false, {})
return M
