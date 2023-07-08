require('git-conflict').setup({
  default_mappings = {
    ours = 'co',
    theirs = 'ct',
    both = 'cb',
    none = 'c0',
    next = ']x',
    prev = '[x'
  },
  default_commands = true, -- disable commands created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'DiffAdd',
    current = 'DiffText',
  }
})
