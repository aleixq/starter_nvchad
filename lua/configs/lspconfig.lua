-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "clangd", "intelephense"} --, "tailwindcss" }
vim.lsp.enable(servers)

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- If not using mason-lspconfig
-- lspconfig['intelephense'].setup {
-- cmd = { 'intelephensew', '--stdio' },
--}

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
})


-- 3. Configure LSP servers
-- All clients
vim.lsp.config('*', {
  -- any custom settings...
})

-- Lua (lua-language-server)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'Lua 5.1' },
      diagnostics = {
        globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
      },
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        [vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
        [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
  },
})

-- PHP (intelephense)
vim.lsp.config('intelephense', {
  -- any custom settings...
  settings = {
    intelephense = {
      files = {
        exclude = {
          "**/.git",
          "**/node_modules",
          "**/bower_components",
          "**/vendor/**"
        }
      },
      environment = {
        --documentRoot = "core",
        --excludePathsincludePaths = {
        --"/path/to/stuff", 
        --"/path/to/more_stuff"
        --} 
      },           
      trace = { 
        server = { "messages" }

      } 
    }
  }
})

-- clang (lua-language-server)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'Lua 5.1' },
      diagnostics = {
        globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
      },
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        [vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
        [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
  },
})

vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16", -- To match null-ls
    --  With this, you can configure server with 
    --    - .clangd files
    --    - global clangd/config.yaml files
    --  Read the `--enable-config` option in `clangd --help` for more information
    "--enable-config",
  },
})

-- html 
vim.lsp.config('html', {
  filetypes = {
    "html",
    --"twig"
  }
})
