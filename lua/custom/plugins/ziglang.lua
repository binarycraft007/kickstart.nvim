return {
  'ziglang/zig.vim',

  dependencies = { -- optional packages
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },

  config = function()
    -- don't show parse errors in a separate window
    vim.g.zig_fmt_parse_errors = 0
    -- disable format-on-save from `ziglang/zig.vim`
    vim.g.zig_fmt_autosave = 0
    -- enable  format-on-save from nvim-lspconfig + ZLS
    --
    -- Formatting with ZLS matches `zig fmt`.
    -- The Zig FAQ answers some questions about `zig fmt`:
    -- https://github.com/ziglang/zig/wiki/FAQ
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.zig', '*.zon' },
      callback = function(ev)
        vim.lsp.buf.format()
      end,
    })
  end,
}
