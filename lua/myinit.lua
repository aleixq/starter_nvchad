local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- activate python
-- debug
-- vim.api.nvim_echo({{'Py provider set...', 'None'}}, false, {})
-- vim.g.loaded_python3_provider = nil
-- #vim.g.python3_host_prog = "/usr/bin/python3"

local enable_providers = {
  "python3_provider",
  "python_provider",
--  "node_provider",
--  and so on
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end



-- debug
vim.api.nvim_echo({{'myinit applied', 'None'}}, false, {})

-- dap
require "configs.dap"
