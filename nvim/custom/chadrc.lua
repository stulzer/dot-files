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
	internacional = {
		"        ┌─┐┌─┐┌─┐  ┌─┐┌┐┌┌┬┐┬─┐┌─┐  ┌┐┌┌─┐┌─┐           ",
		"        ├─┘├─┤┌─┘  ├┤ │││ │ ├┬┘├┤   ││││ │└─┐           ",
		"        ┴  ┴ ┴└─┘  └─┘┘└┘ ┴ ┴└─└─┘  ┘└┘└─┘└─┘┘          ",
		"┌─┐┬ ┬┌─┐┬─┐┬─┐┌─┐  ┌─┐┌─┐┌─┐  ┌─┐┌─┐┌┐┌┬ ┬┌─┐┬─┐┌─┐┌─┐ ",
		"│ ┬│ │├┤ ├┬┘├┬┘├─┤  ├─┤│ │└─┐  └─┐├┤ │││├─┤│ │├┬┘├┤ └─┐ ",
		"└─┘└─┘└─┘┴└─┴└─┴ ┴  ┴ ┴└─┘└─┘  └─┘└─┘┘└┘┴ ┴└─┘┴└─└─┘└─┘┘",
	},
	laser = {
		"                                                                  ░▒▒▓▓▓▓▓▓▓▓▓▒░  ",
		"                                                              ░▒▒▓▓▓▓▓▓▓▓▒▒▓▓▓▓▓▒░",
		"                                                    ░▒▒▒▒▓▓▓▓▒▓▓▓▓▓▓▓▒░  ░▒▓▓▓▓▓░ ",
		"                                         ░▒▓▓▓▓▓▓░▒▓▓▓▓▓▓▓▓▒▒░▒▓▓▓▓▓▓░  ▒▓▓▓▓▓▒░  ",
		"                                     ░▒▒▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▒░    ░▒▓▓▓▓▒▒▓▓▓▓▓▓▒░    ",
		"                                   ░▒▓▓▓▓▓▓▓▒▒░ ░▒▓▓▓▓▓░      ░▓▓▓▓▓▓▓▓▓▓▓▓▓░     ",
		"                     ░▓▓▓▓▒░     ░▓▓▓▓▓▓▒▒░     ░▓▓▓▓▓▓▓▓▓▓░  ░▓▓▓▓▓▓▓▓▒▓▓▓▓▒░    ",
		"    ░▒▓▓▒░           ░▓▓▓▓▓▓░  ░▒▓▓▓▓▓▒░       ░▒▓▓▓▓▓▓▓▓▓▒░ ░▒▓▓▓▓▓▒░  ░▓▓▓▓▒░   ",
		"    ░▓▓▓▓▓░         ░▓▓▓▓▓▓▓▓░ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░     ░▓▓▓▓▒░░    ░▓▓▓▓▒░  ",
		"    ░▓▓▓▓▓░        ░▒▓▓▓▓▓▓▓▓▒░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░  ░▒▒▓▓▓▓▓▓▒░░      ░▒▓▓▓░  ",
		"   ░▓▓▓▓▓░         ░▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▒▒░ ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░         ░▒▒░  ",
		"   ░▓▓▓▓▒░        ░▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░    ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░ ▓▓▓▒░                ",
		"  ░▒▓▓▓▓░        ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓░  ░▒▓▓▓▓▓▓▓▒░▓▓▓▓▓▓▒░                           ",
		"  ░▓▓▓▓▓░        ░▓▓▓▓▓▓▓▒░ ░▓▓▓▓▓▓▓▓▓▓▓▓▓▒░  ░▓▓▓▓░                              ",
		" ░▒▓▓▓▓░        ░▓▓▓▓▓▒░    ░▒▓▓▓▓▓▓▓▓▓▒░                                         ",
		" ░▓▓▓▓▓░  ░▒▒▓▓░▓▓▓▓▓░      ░▓▓▓▓▓▓▒░                                             ",
		" ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░         ░▒░                                                 ",
		"░▓▓▓▓▓▓▓▓▓▓▓▒░   ░▒░                                                              ",
		"░▓▓▓▓▓▓▒▒░                                                                        ",
		" ░▒▒▒░                                                                            ",
	},
	soberana = {
		"░░░░░░░░░░░░░░░░░▒▓▓███████████▓▓▒░░░░░░░░░░░░░░░░░░░░ ",
		"░░░░░░░░░░░░░▓███████████████████████▓▒░░░░░░░░░░░░░░░ ",
		"░░░░░░░░░▒▓▓░░▓█████████████████████████▓▒░░░░░░░░░░░░ ",
		"░░░░░░░▒█████▓░░▓██████████████████████████▒░░░░░░░░░░ ",
		"░░░░░▒█████████▓░░▓██████████████████████████▒░░░░░░░░ ",
		"░░░░▓████████████▓░░▒██████████████████████████░░░░░░░ ",
		"░░░▓███████████████▓░░▓████████▓░▒▓█████████████▒░░░░░ ",
		"░░▒██████████████████▓░░▓████▓░░░░░░▓████████████▒░░░░ ",
		"░░█████████████████████▓░░▓▓░░░░░░░░░░▓███████████░░░░ ",
		"░░████████▓██████████████▓░░░░░░░░░░░░░▓███████████░░░ ",
		"░░██████▓░░░▒██████████████▓░░░░░░░░░░░░▓██████████▒░░ ",
		"░░▒███▓░░░░░░░▒██████████████▓░░░░░░░░░░░███████████░░ ",
		"░░░▓▓░░░░░░░░░░░▒██████████████▓░░░░░░░░░▓██████████░░ ",
		"░░░░░░░░░░░░░░░░░░▒██████████████▓░░░░░░░▓██████████░░ ",
		"░░░░░░░░░░░░░░░░░░░░▒██████████████▓░░░░░███████████░░ ",
		"░░░░░░░░░░░░░░░░░░░░░░▒██████████████▓░░▒██████████▓░░ ",
		"░░░░░░░░░░░░░░░░░░░░░░░░▒██████████████▓███████████░░░ ",
		"░░░░░░░░░▓█▓░░░░░░░░░░░░░░▒███████████████████████▓░░░ ",
		"░░░░░░░▒█████▓░░░░░░░░░░░░░░▒█████████████████████░░░░ ",
		"░░░░░▒█████████▓▒░░░░░░░░░░░░░▒██████████████████░░░░░ ",
		"░░░░▓█████████████▓▒▒░░░░░░░░░░▒███████████████▓░░░░░░ ",
		"░░░▓██████████████████████████████████████████▒░░░░░░░ ",
		"░░▒█████████████████████████████████████████▒░░░░░░░░░ ",
		"░░████████████████████████████████████████▒░░░░░░░░░░░ ",
		"░░████████▒▒▓█████████████████████████▓▒░░░░░░░░░░░░░░ ",
		"░░██████▒░░░░░░▒▓█████████████████▓▒▒░░░░░░░░░░░░░░░░░ ",
		"░░▒███▓░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░ ",
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
	theme = "laser",
	theme_toggle = { "laser", "one_light" },

	nvdash = {
		load_on_startup = true,
		header = headers[randomHeader],
	},
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
