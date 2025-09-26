local ruby_formatter

if vim.fn.filereadable "Gemfile" == 1 then
  local gemfile = io.open("Gemfile", "r"):read "*a"

  if string.find(gemfile, "rubocop") then
    ruby_formatter = { "rubocop" }
  else
    ruby_formatter = { "standardrb" }
  end
end

local options = {
  -- lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    ruby = ruby_formatter,
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    sh = { "shfmt" },
    python = { "black" },
    go = { "gofmt" },
  },
}

require("conform").setup(options)

return options
