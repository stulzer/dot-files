-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onenord",
  theme_toggle = { "onenord", "onenord_light" },
}

M.nvdash = { load_on_startup = false }

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


return M
