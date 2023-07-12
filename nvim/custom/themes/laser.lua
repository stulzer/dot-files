local M = {}

M.base_30 = {
	white = "#48379e",
	darker_black = "#201947", -- darker_black = 6% darker than black
	black = "#231b4d", -- black = usually your theme bg
	black2 = "#2b215f", -- black2 = 6% lighter than black
	one_bg = "#31266b", -- onebg = 10% lighter than black
	one_bg2 = "#3d2f86", -- oneb2 = 19% lighter than black
	one_bg3 = "#48379e", -- oneb3 = 27% lighter than black
	grey = "#3d2f86", -- grey = 40% lighter than black (the % here depends so choose the perfect grey!)
	grey_fg = "#48379e", -- grey_fg = 10% lighter than grey
	grey_fg2 = "#6251B8", -- grey_fg2 = 20% lighter than grey
	light_grey = "#7B6AD1", -- light_grey = 28% lighter than grey
	red = "#ff047d",
	baby_pink = "#ff1d8a", -- baby_pink = 15% lighter than red or any babypink color you like!
	pink = "#e61d7e",
	line = "#2b215f", -- for lines like vertsplit
	green = "#859900",
	vibrant_green = "#b2c62d",
	nord_blue = "#197ec5",
	blue = "#268bd2",
	yellow = "#b58900",
	sun = "#c4980f",
	purple = "#7E74CC",
	dark_purple = "#322880",
	teal = "#74c5aa",
	orange = "#c85106",
	cyan = "#37dcf6",
	statusline_bg = "#042f3a",
	lightbg = "#113c47",
	pmenu_bg = "#268bd2",
	folder_bg = "#268bd2",
}

M.base_16 = {
	base00 = M.base_30.darker_black,
	base01 = M.base_30.black2,
	base02 = M.base_30.one_bg,
	base03 = M.base_30.grey,
	base04 = M.base_30.grey_fg,
	base05 = M.base_30.greay_fg2,
	base06 = "#eee8d5",
	base07 = "#fdf6e3",
	base08 = M.base_30.red,
	base09 = M.base_30.orange,
	base0A = "#b58900",
	base0B = "#859900",
	base0C = "#2aa198",
	base0D = "#268bd2",
	base0E = "#6c71c4",
	base0F = M.base_30.red,
}

M.polish_hl = {
	Folded = { fg = M.base_30.grey_fg2, bg = M.base_30.black2 },
	TelescopeNormal = { fg = M.base_30.red, bg = M.base_30.black },
	TelescopePrompt = { fg = M.base_30.one_bg, bg = M.base_30.cyan },
	TelescopePromptNormal = { fg = M.base_30.red, bg = M.base_30.black2 },
	TelescopePromptPrefix = { fg = M.base_30.red, bg = M.base_30.black2 },
	TelescopeResults = { fg = M.base_30.red, bg = M.base_30.black },
	NvimTreeNormal = { bg = M.base_30.black },
	NvimTreeNormalNC = { bg = M.base_30.black },

	StatusLine = {
		bg = M.base_30.statusline_bg,
	},

	St_gitIcons = {
		fg = M.base_30.light_grey,
		bg = M.base_30.statusline_bg,
		bold = true,
	},

	St_LspStatus = {
		fg = M.base_30.nord_blue,
		bg = M.base_30.statusline_bg,
	},

	St_LspProgress = {
		fg = M.base_30.green,
		bg = M.base_30.statusline_bg,
	},

	St_LspStatus_Icon = {
		fg = M.base_30.black,
		bg = M.base_30.nord_blue,
	},

	St_EmptySpace = {
		fg = M.base_30.grey,
		bg = M.base_30.lightbg,
	},

	St_EmptySpace2 = {
		fg = M.base_30.grey,
		bg = M.base_30.statusline_bg,
	},

	St_file_info = {
		bg = M.base_30.lightbg,
		fg = M.base_30.nord_blue,
	},

	St_file_sep = {
		bg = M.base_30.statusline_bg,
		fg = M.base_30.lightbg,
	},

	St_cwd_icon = {
		fg = M.base_30.one_bg,
		bg = M.base_30.red,
	},

	St_cwd_text = {
		fg = M.base_30.one_bg,
		bg = M.base_30.red,
		-- fg = M.base_30.nord_blue,
		-- bg = M.base_30.lightbg,
	},

	St_cwd_sep = {
		fg = M.base_30.red,
		bg = M.base_30.statusline_bg,
	},

	St_pos_sep = {
		fg = M.base_30.green,
		bg = M.base_30.red,
	},

	St_pos_icon = {
		fg = M.base_30.black,
		bg = M.base_30.green,
	},

	St_pos_text = {
		fg = M.base_30.lightbg,
		bg = M.base_30.green,
	},

	["@constructor"] = { fg = M.base_16.base0A },
	["@function"] = { fg = M.base_30.red },
	["@parameter"] = { fg = M.base_16.base0F },
	["@tag.attribute"] = { fg = M.base_30.orange },
	["@tag.delimiter"] = { fg = M.base_30.cyan },
}

M.type = "dark"

return M
