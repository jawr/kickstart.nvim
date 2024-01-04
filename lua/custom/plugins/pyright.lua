return {
  -- change nvim-lspconfig options
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      pyright = {
        cmd = { 'pyright-langserver', '--stdio', '--verbose' },
      },
    },
  },
}
