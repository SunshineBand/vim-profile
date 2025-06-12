return {
  'kawre/leetcode.nvim',
  build = ':TSUpdateSync',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',
  },
  opts = {
    arg = 'leetcode.nvim',
    lang = 'cpp',
    injector = {
      ['cpp'] = {
        before = { '#include <bits/stdc++.h>', 'using namespace std;' },
        after = 'int main() {}',
      }
    }
  },
}
