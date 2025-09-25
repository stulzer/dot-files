require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "clangd" }

vim.lsp.enable(servers)

vim.lsp.config("tailwindcss", {
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
})

vim.lsp.enable "tailwindcss"

-- read :h vim.lsp.config for changing options of lsp servers
