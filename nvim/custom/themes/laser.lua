local M = {}

M.base_30 = {
	white = "#dd00ff",
	darker_black = "#201947", -- darker_black = 6% darker than black
	black = "#231b4d", -- black = usually your theme bg
	black2 = "#2b215f", -- black2 = 6% lighter than black
	one_bg = "#31266b", -- onebg = 10% lighter than black
	one_bg2 = "#3d2f86", -- oneb2 = 19% lighter than black
	one_bg3 = "#48379e", -- oneb3 = 27% lighter than black
	grey = "#c9c3ea", -- grey = 40% lighter than black (the % here depends so choose the perfect grey!)
	grey_fg = "#cec9ec", -- grey_fg = 10% lighter than grey
	grey_fg2 = "#d5d0ef", -- grey_fg2 = 20% lighter than grey
	light_grey = "#e5e2f5", -- light_grey = 28% lighter than grey
	red = "#ff047d",
	baby_pink = "#ff1d8a", -- baby_pink = 15% lighter than red or any babypink color you like!
	pink = "#e61d7e",
	line = "#352975", -- for lines like vertsplit line = 15% lighter than black
	green = "#7adc03",
	vibrant_green = "#8efc09",
	blue = "#4badff",
	nord_blue = "#1a96ff", -- nord_blue = 13% darker than blue
	yellow = "#ffeb00",
	sun = "#fff042", -- sun = 8% lighter than yellow
	purple = "#b1a7ff",
	dark_purple = "#9385ff",
	teal = "#74c5aa",
	orange = "#c85106",
	cyan = "#37dcf6",
	statusline_bg = "#281f59", -- statusline_bg = 4% lighter than black
	lightbg = "#392c7f", -- lightbg = 13% lighter than statusline_bg
	lightbg2 = "#31266d", -- lightbg2 = 7% lighter than statusline_bg
	pmenu_bg = "#ff9445",
	folder_bg = "#4badff", -- folder_bg = blue color
}

M.base_16 = {
	-- base00 - Default Background
	base00 = "#201947",
	-- base01 - Lighter Background (Used for status bars, line number and folding marks)
	base01 = "#2b215f",
	-- base02 - Selection Background
	base02 = "#31266b",
	-- base03 - Comments, Invisibles, Line Highlighting
	base03 = "#8584ae",
	-- base04 - Dark Foreground (Used for status bars)
	base04 = "#33363c",
	-- base05 - Default Foreground, Caret, Delimiters, Operators
	base05 = "#dd00ff",
	-- base06 - Light Foreground (Not often used)
	base06 = "#dd00ff",
	-- base07 - Light Background (Not often used)
	base07 = "#dd00ff",
	-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	base08 = "#dd00ff",
	-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
	base09 = "#ffeb00",
	-- base0A - Classes, Markup Bold, Search Text Background
	base0A = "#37dcf6",
	-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
	base0B = "#9dc410",
	-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
	base0C = "#c85106",
	-- base0D - Functions, Methods, Attribute IDs, Headings
	base0D = "#ff1371",
	-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
	base0E = "#b1a7ff",
	-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
	base0F = "#b1a7ff",
}

M.polish_hl = {
	["NonText"] = { fg = M.base_16.base03 },
	["VimCommand"] = { fg = M.base_16.base03 },
	["@tag.html"] = { fg = M.base_30.red },
	["@tag.delimiter"] = { fg = M.base_30.pink },
	["@function"] = { fg = M.base_30.orange },
	["@parameter"] = { fg = M.base_16.base0F },
	["@constructor"] = { fg = M.base_16.base0A },
	["@tag.attribute"] = { fg = M.base_30.orange },
}

M.type = "dark"

return M
