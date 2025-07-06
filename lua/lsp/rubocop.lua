vim.lsp.config('rubocop', {
  cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
  filetypes = { 'ruby' },
  root_markers = { '.git', 'Gemfile' },
})
