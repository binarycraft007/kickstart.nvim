return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { -- optional packages
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { silent = true, noremap = true })
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    -- empty setup using defaults
    require('nvim-tree').setup()
  end,
}
