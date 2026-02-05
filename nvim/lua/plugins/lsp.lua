return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Basic servers with default config
        html = {},
        cssls = {},
        clangd = {},
        ts_ls = {},

        -- Deno LSP (only for projects with deno.json)
        denols = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
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
        },

        -- Tailwind CSS
        tailwindcss = {
          filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        },
      },

      -- Optional: Configure server setup
      setup = {
        -- Prevent ts_ls and denols conflicts
        denols = function(_, opts)
          opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
          return false -- return false to use default setup
        end,
      },
    },
  },
}
