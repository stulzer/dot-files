local M = {}

local headers = {
  international = {
    "                                             ",
    "  ┌─┐┌─┐┌─┐┌─┐┌─┐  ┌─┐┌┬┐┌─┐┌┐┌┌─┐  ┬ ┬┌─┐   ",
    "  ├─┘├┤ ├─┤│  ├┤   ├─┤││││ │││││ ┬  │ │└─┐   ",
    "  ┴  └─┘┴ ┴└─┘└─┘  ┴ ┴┴ ┴└─┘┘└┘└─┘  └─┘└─┘┘  ",
    "  ┬ ┬┌─┐┬─┐  ┌─┐┌┐┌  ┌┬┐┬ ┬┬─┐┌─┐┌┐┌┌┬┐┌─┐   ",
    "  │││├─┤├┬┘  │ ││││   │ └┬┘├┬┘├─┤│││ │ └─┐   ",
    "  └┴┘┴ ┴┴└─  └─┘┘└┘   ┴  ┴ ┴└─┴ ┴┘└┘ ┴ └─┘┘  ",
    "                                             ",
  },
  nvchad = {
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "     Powered By  eovim    ",
    "                            ",
  },
}

-- Generate a random index to choose between the headers
local randomIndex = math.random(1, #headers)

-- Get the header name based on the random index
local headerNames = {}
for key, _ in pairs(headers) do
  table.insert(headerNames, key)
end

local randomHeader = headerNames[randomIndex]

M.nvdash = {
  load_on_startup = true,
  header = headers[randomHeader],
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
