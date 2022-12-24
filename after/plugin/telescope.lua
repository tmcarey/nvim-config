require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "%.meta"
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
