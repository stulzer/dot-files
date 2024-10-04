local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {}

if vim.fn.filereadable "Gemfile" == 1 then
  local gemfile = io.open("Gemfile", "r"):read "*a"

  if string.find(gemfile, "rubocop") then
    table.insert(sources, b.diagnostics.rubocop)
  end

  if string.find(gemfile, "standard") then
    table.insert(sources, b.diagnostics.standardrb)
  end

  if string.find(gemfile, "reek") then
    table.insert(sources, b.diagnostics.reek)
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
}
