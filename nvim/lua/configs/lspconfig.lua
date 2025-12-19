require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "ts_ls" }

-- Enable basic servers
vim.lsp.enable(servers)

-- Configure TypeScript LSP (only for projects with package.json)
-- vim.lsp.config("ts_ls", {
--   root_dir = function(fname)
--     local util = require('lspconfig.util')
--     return util.root_pattern("package.json")(fname)
--   end,
--   single_file_support = false, -- Don't attach to single files without package.json
-- })

-- Configure Deno LSP (only for projects with deno.json)
vim.lsp.config("deno", {
  root_dir = function(fname)
    local util = require('lspconfig.util')
    return util.root_pattern("deno.json", "deno.jsonc")(fname)
  end,
  init_options = {
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.nest.land"] = true,
          ["https://crux.land"] = true,
        },
      },
    },
  },
})

vim.lsp.enable("deno")

-- Configure Tailwind CSS
vim.lsp.config("tailwindcss", {
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
})

vim.lsp.enable("tailwindcss")
