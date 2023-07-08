require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      '.git/'
    },
    layout_strategy = 'vertical',
  },
})
