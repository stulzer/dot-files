-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.rnu = false

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
vim.api.nvim_command(
  "autocmd BufRead,BufNewFile Dockerfile,Makefile,*.c,*.cfg,*.cjs,*.cmake,*.cpp,*.cs,*.css,*.csv,*.ejs,*.gemspec,*.haml,*.hbs,*.hpp,*.html,*.java,*.js,*.json,*.jst,*.jsx,*.log,*.md,*.mjs,*.php,*.pl,*.podspec,*.py*.rabl,*.rake,*.rb,*.rdoc,*.ru,*.sass,*.scss,*.slim,*.toml,*.tpl,*.ts,*.tsx,*.txt,*.xml,*.yaml,*.yml setlocal spell"
)
vim.api.nvim_command("autocmd FileType gitcommit setlocal spell")

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
vim.api.nvim_command("command! Gblame BlameToggle window")

-- CopilotChat short commands
vim.api.nvim_command("command! CC CCOpen")
vim.api.nvim_command("command! CCClose CopilotChatClose")
vim.api.nvim_command("command! CCM CopilotChatModels")
vim.api.nvim_command("command! CCCommit CopilotChatCommit")
vim.api.nvim_command("command! CCDebugInfo CopilotChatDebugInfo")
vim.api.nvim_command("command! CCDocs CopilotChatDocs")
vim.api.nvim_command("command! CCExplain CopilotChatExplain")
vim.api.nvim_command("command! CCFix CopilotChatFix")
vim.api.nvim_command("command! CCOpen CopilotChatOpen")
vim.api.nvim_command("command! CCOptimize CopilotChatOptimize")
vim.api.nvim_command("command! CCReset CopilotChatReset")
vim.api.nvim_command("command! CCTests CopilotChatTests")
vim.api.nvim_command("command! CCToggle CopilotChatToggle")

-- set no clipboard
vim.opt.clipboard = ""
