vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }),
  callback = function()
    vim.lsp.start {
      name = "standard",
      cmd = { "/Users/stulzer/.asdf/shims/standardrb", "--lsp" },
    }
  end,
})
