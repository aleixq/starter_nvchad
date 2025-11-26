local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
  formatters = {
      phpcbf = {
        prepend_args = { "--standard=~/drupal-project/vendor/drupal/coder/coder_sniffer/Drupal" }, --, "--extensions='php,module,inc,install,test,profile,theme,css,info,txt,md'" },
        --args = { "--extensions='php,module,inc,install,test,profile,theme,css,info,txt,md'" },
      },
    },
  log_level = vim.log.levels.DEBUG,

}

return options
