return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    require('null-ls').setup {
      sources = {
        require('null-ls').builtins.formatting.prettier.with {
          filetypes = { 'json', 'yaml', 'markdown' },
        },
        require('null-ls').builtins.formatting.stylua,
        require('null-ls').builtins.formatting.stylelint,
        require('null-ls').builtins.formatting.terraform_fmt,
        require('null-ls').builtins.formatting.prettier,
        require('null-ls').builtins.formatting.goimports,
        require('null-ls').builtins.formatting.djlint,
        require('null-ls').builtins.diagnostics.djlint,
        require('null-ls').builtins.formatting.eslint_d,
        require('null-ls').builtins.formatting.black,
      },
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                bufnr = bufnr,
                filter = function(c)
                  return c.name == 'null-ls'
                end,
              }
            end,
          })
        end
      end,
    }
  end,
  requires = { 'nvim-lua/plenary.nvim' },
}
