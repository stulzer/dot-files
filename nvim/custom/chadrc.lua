local M = {}

M.ui = {
	-- theme = "solarized_dark",
	-- theme_toggle = { "solarized_dark", "one_light" },

  -- For Laser theme only
	theme = "laser",
	statusline = {
		theme = "vscode_colored",
	},
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
