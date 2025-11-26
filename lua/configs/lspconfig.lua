require("nvchad.configs.lspconfig").defaults()


-- List of servers to install
local servers = { "html", "cssls", "tsserver", "clangd", "intelephense", "tailwindcss" }

vim.lsp.enable(servers)
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- read :h vim.lsp.config for changing options of lsp servers 

-- If not using mason-lspconfig
-- lspconfig['intelephense'].setup {
-- cmd = { 'intelephensew', '--stdio' },
--}

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

--
---- This will setup lsp for servers you listed above
---- And servers you install through mason UI
---- So defining servers in the list above is optional
require("mason-lspconfig").setup_handlers({
  -- Default setup for all servers, unless a custom one is defined below
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Add your other things here
        -- Example being format on save or something
      end,
      capabilities = capabilities,
    })
  end,
  -- custom setup for a server goes after the function above
  -- Example, override lua_ls
  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
              [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        }
      }
    })
  end,
  ["intelephense"] = function()
    lspconfig["intelephense"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      --cmd = { 'intelephense', '--stdio' },
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
  end,
  -- Example: disable auto configuring an LSP
  --["clangd"] = function() end,
  -- Example: enable clang config
      ["clangd"] = function()
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--offset-encoding=utf-16", -- To match null-ls
          --  With this, you can configure server with 
          --    - .clangd files
          --    - global clangd/config.yaml files
          --  Read the `--enable-config` option in `clangd --help` for more information
          "--enable-config",
        },
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      })
    end,
  -- Example: disable auto configuring an LSP
  --["clangd"] = function() end,
  -- Example: enable clang config
      ["html"] = function()
      lspconfig.html.setup({
	filetypes = {
		"html",
		--"twig"
	}
      })
    end,
})
