vim.lsp.config('ruby-lsp', {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  init_options = {
    formatter = 'auto'
  },
  root_markers = { '.git', 'Gemfile' },
})
