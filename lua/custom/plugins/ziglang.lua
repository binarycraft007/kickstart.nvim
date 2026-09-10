-- `nvim-lspconfig` and `nvim-treesitter` are already installed via `vim.pack.add`
-- in `init.lua`, so `ziglang/zig.vim` is the only dependency to add here.
vim.pack.add { 'https://github.com/ziglang/zig.vim' }

-- Use the local zls instead of a Mason install (zls is not in `servers` in `init.lua`)
vim.lsp.config('zls', { cmd = { vim.fn.expand '~/.local/bin/zls' } })
vim.lsp.enable 'zls'

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
