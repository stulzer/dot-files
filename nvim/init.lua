vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

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

-- set spell lang
vim.opt.spelllang = "en_us,de_de,pt_br"

-- set no spell
vim.opt.spell = false

-- set spell on specific filetypes
vim.api.nvim_command "autocmd BufRead,BufNewFile Dockerfile,Makefile,*.c,*.cfg,*.cjs,*.cmake,*.cpp,*.cs,*.css,*.csv,*.ejs,*.gemspec,*.haml,*.hbs,*.hpp,*.html,*.java,*.js,*.json,*.jst,*.jsx,*.log,*.md,*.mjs,*.php,*.pl,*.podspec,*.py,*.rabl,*.rake,*.rb,*.rdoc,*.ru,*.sass,*.scss,*.slim,*.toml,*.tpl,*.ts,*.tsx,*.txt,*.xml,*.yaml,*.yml setlocal spell"
vim.api.nvim_command "autocmd FileType gitcommit setlocal spell"

-- Correcting typos on common commands
vim.api.nvim_command "command! -bang -nargs=* -complete=file E e<bang> <args>"
vim.api.nvim_command "command! -bang -nargs=* -complete=file W w<bang> <args>"
vim.api.nvim_command "command! -bang -nargs=* -complete=file Wq wq<bang> <args>"
vim.api.nvim_command "command! -bang -nargs=* -complete=file WQ wq<bang> <args>"
vim.api.nvim_command "command! -bang -nargs=* -complete=file Bd bd<bang> <args>"
vim.api.nvim_command "command! -bang Wa wa<bang>"
vim.api.nvim_command "command! -bang WA wa<bang>"
vim.api.nvim_command "command! -bang Q q<bang>"
vim.api.nvim_command "command! -bang QA qa<bang>"
vim.api.nvim_command "command! -bang Qa qa<bang>"
vim.api.nvim_command "command! -bang Bd bd<bang>"
vim.api.nvim_command "command! Gblame ToggleBlame window"

vim.cmd [[ autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- set no clipboard
vim.opt.clipboard = ""
