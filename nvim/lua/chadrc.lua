local M = {}

local headers = {
  international = {
    "┌─┐┌─┐┌─┐┌─┐┌─┐  ┌─┐┌┬┐┌─┐┌┐┌┌─┐  ┬ ┬┌─┐ ",
    "├─┘├┤ ├─┤│  ├┤   ├─┤││││ │││││ ┬  │ │└─┐ ",
    "┴  └─┘┴ ┴└─┘└─┘  ┴ ┴┴ ┴└─┘┘└┘└─┘  └─┘└─┘┘",
    "┬ ┬┌─┐┬─┐  ┌─┐┌┐┌  ┌┬┐┬ ┬┬─┐┌─┐┌┐┌┌┬┐┌─┐ ",
    "│││├─┤├┬┘  │ ││││   │ └┬┘├┬┘├─┤│││ │ └─┐ ",
    "└┴┘┴ ┴┴└─  └─┘┘└┘   ┴  ┴ ┴└─┴ ┴┘└┘ ┴ └─┘┘",
  },
  lenin = {
    "        ┬ ┬┌─┐┬─┐  ┌─┐┌─┐┌┐┌┌┐┌┌─┐┌┬┐  ┌┐ ┌─┐  ┌─┐┌┐ ┌─┐┬  ┬┌─┐┬ ┬┌─┐┌┬┐       ",
    "        │││├─┤├┬┘  │  ├─┤│││││││ │ │   ├┴┐├┤   ├─┤├┴┐│ ││  │└─┐├─┤├┤  ││       ",
    "        └┴┘┴ ┴┴└─  └─┘┴ ┴┘└┘┘└┘└─┘ ┴   └─┘└─┘  ┴ ┴└─┘└─┘┴─┘┴└─┘┴ ┴└─┘─┴┘       ",
    "┬ ┬┌┐┌┬  ┌─┐┌─┐┌─┐  ┌─┐┬  ┌─┐┌─┐┌─┐┌─┐┌─┐  ┌─┐┬─┐┌─┐  ┌─┐┌┐ ┌─┐┬  ┬┌─┐┬ ┬┌─┐┌┬┐",
    "│ │││││  ├┤ └─┐└─┐  │  │  ├─┤└─┐└─┐├┤ └─┐  ├─┤├┬┘├┤   ├─┤├┴┐│ ││  │└─┐├─┤├┤  ││",
    "└─┘┘└┘┴─┘└─┘└─┘└─┘  └─┘┴─┘┴ ┴└─┘└─┘└─┘└─┘  ┴ ┴┴└─└─┘  ┴ ┴└─┘└─┘┴─┘┴└─┘┴ ┴└─┘─┴┘",
    "        ┌─┐┌┐┌┌┬┐  ┌─┐┌─┐┌─┐┬┌─┐┬  ┬┌─┐┌┬┐  ┬┌─┐  ┌─┐┬─┐┌─┐┌─┐┌┬┐┌─┐┌┬┐        ",
    "        ├─┤│││ ││  └─┐│ ││  │├─┤│  │└─┐│││  │└─┐  │  ├┬┘├┤ ├─┤ │ ├┤  ││        ",
    "        ┴ ┴┘└┘─┴┘  └─┘└─┘└─┘┴┴ ┴┴─┘┴└─┘┴ ┴  ┴└─┘  └─┘┴└─└─┘┴ ┴ ┴ └─┘─┴┘┘       ",
  },
  laser = {
    "                                                                                        ",
    "                                                                                        ",
    "                                                                                        ",
    "                                                                     ░▒▒▒▒░             ",
    "                                                                ░▒▓▓▓▓▓▓▓▓▓▓▓░          ",
    "                                                        ░▒▒░ ▒▓▓▓▓▓▓▒▒░ ░▓▓▓▓▓░         ",
    "                                             ░▒▓▓▓▒░▒▓▓▓▓▓▓▓░▒▓▓▓▓▓▓░  ▒▓▓▓▓▒░          ",
    "                                         ░▒▓▓▓▓▓▓▓▓▒▓▓▓▓▓▒░   ░▓▓▓▓▓▒▓▓▓▓▓▒░            ",
    "                                      ░▒▓▓▓▓▓▓▒▒░ ░▒▓▓▓▓░     ░▓▓▓▓▓▓▓▓▓▓▓░             ",
    "                           ░▓▓▓▓▒░  ░▒▓▓▓▓▓▒░     ░▓▓▓▓▓▓▓▓▒ ░▒▓▓▓▓▓▓▒▒▓▓▓▓░            ",
    "            ░▒▓▓▓▒░        ░▓▓▓▓▓▒░ ▓▓▓▓▓▒▒▒▒▒▒▒▒░▒▓▓▓▓▓▒▒░  ░▓▓▓▓▒░   ░▓▓▓▒░           ",
    "            ░▓▓▓▓▒░       ░▓▓▓▓▓▓▓░ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░   ░▒▒▓▓▓▓░      ░▒▓▓▒░          ",
    "            ░▓▓▓▓░       ░▒▓▓▓░░▓▓▓▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▒░        ░▒▒░          ",
    "           ░▒▓▓▓▒░       ░▓▓▓▓▓▓▓▓▓▓▓▒░   ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ ░▓▓▓░                       ",
    "           ░▓▓▓▓░       ░▓▓▓▓▓▓▓▒▒▓▓▓▒░ ▒▓▓▓▓▓▓▒░▓▓▓▓▒░                                 ",
    "          ░▒▓▓▓▒░      ░▒▓▓▓▓▓▒░ ░▓▓▓▓▓▓▓▓▓▓▒░  ░▒▒▒░                                   ",
    "          ░▓▓▓▓▒░   ░▒░▒▓▓▓▓░    ░▓▓▓▓▓▓▒▒░                                             ",
    "          ░▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓░      ░▒▒▒░                                                 ",
    "         ░▓▓▓▓▓▓▓▓▓▓▒░ ░▒▒░                                                             ",
    "         ░▓▓▓▓▓▒▒░                                                                      ",
    "          ░▒▒░                                                                          ",
    "                                                                                        ",
    "                                                                                        ",
    "                                                                                        ",
  },
  soberana = {
    "          ░▒▓▓██████████▓▓▒░            ",
    "     ░▒░ ░████████████████████▓░        ",
    "   ░▓████▓░▒█████████████████████▓░     ",
    " ░▓████████▓▒░▓████████████████████▓░   ",
    "░█████████████▒░▒██████▒░▒▓██████████▒░ ",
    "▓███████████████▓░▒▓▓▒░    ░▓█████████▒░",
    "██████▓▓██████████▓▒░        ░█████████░",
    "▓███▒░  ░▓███████████▓░       ░████████▓",
    "░▓▒░      ░▒███████████▓░     ░▓████████",
    "             ░▓███████████▒░  ░▓████████",
    "               ░▒███████████▓ ░████████▓",
    "     ░▒▒░        ░▒████████████████████░",
    "   ░▓████▒░         ░▓████████████████░ ",
    " ░▓████████▓▒░        ░▓█████████████░  ",
    "░██████████████████████████████████▒░   ",
    "▓████████████████████████████████▒░     ",
    "██████▓▒▓████████████████████▓▒░        ",
    "▓███▓░    ░▒▒▓▓▓██████▓▓▓▒░             ",
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

M.ui = {
  theme = "local-laser",

  nvdash = {
    load_on_startup = false,
    header = headers[randomHeader],
  },
  hl_override = {
    SpecialChar = { fg = "green" },
    ["@tag"] = { fg = "red" },
    Structure = { fg = "#c4980f" },
  },
}

M.plugins = "plugins"

M.mappings = require "mappings"

return M
