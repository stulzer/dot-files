local M = {}

M.nvdash = {
  load_on_startup = true,
}

M.base46 = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "onenord_light" },
}

M.ui = {

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
