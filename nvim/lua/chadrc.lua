local M = {}

M.nvdash = {
  load_on_startup = false,
}

M.ui = {
  theme = "local-laser",

  hl_override = {
    SpecialChar = { fg = "green" },
    ["@tag"] = { fg = "red" },
    Structure = { fg = "#c4980f" },
  },

  cmp = {
    format_colors = {
      tailwind = true,
    },
  },
}

M.plugins = "plugins"

M.mappings = require "mappings"

return M
