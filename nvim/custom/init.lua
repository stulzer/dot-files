-- set linebreak
vim.opt.linebreak = true

-- set listchars
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  extends = "…",
  precedes = "…",
  nbsp = "␣",
  eol = "¬",
}

-- set nolist
vim.opt.list = false

-- set spelllang
vim.opt.spelllang = "en_us,de_de,pt_br"

-- set spell
vim.opt.spell = true

-- Correcting typos on common commands
vim.api.nvim_command("command! -bang -nargs=* -complete=file E e<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file W w<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file Wq wq<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file WQ wq<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file Bd bd<bang> <args>")
vim.api.nvim_command("command! -bang Wa wa<bang>")
vim.api.nvim_command("command! -bang WA wa<bang>")
vim.api.nvim_command("command! -bang Q q<bang>")
vim.api.nvim_command("command! -bang QA qa<bang>")
vim.api.nvim_command("command! -bang Qa qa<bang>")
vim.api.nvim_command("command! -bang Bd bd<bang>")
