-- based on DROP + MITO GMK LASER CUSTOM KEYCAP SET

local M = {}

M.base_30 = {
  white = "#2e2e2e",
  darker_black = "#f5f5f5",
  black = "#ffffff",
  black2 = "#e0e0e0",
  one_bg = "#d6d6d6",
  one_bg2 = "#cccccc",
  one_bg3 = "#c2c2c2",
  grey = "#b8b8b8",
  grey_fg = "#a0a0a0",
  grey_fg2 = "#888888",
  light_grey = "#707070",
  red = "#ff047d",
  baby_pink = "#ff5f87",
  pink = "#d75f87",
  line = "#e0e0e0",
  green = "#5f8700",
  vibrant_green = "#87af5f",
  nord_blue = "#5f87af",
  blue = "#5f87d7",
  yellow = "#af8700",
  sun = "#d7af5f",
  purple = "#875faf",
  dark_purple = "#5f5f87",
  teal = "#5fafaf",
  orange = "#d78700",
  cyan = "#5fd7d7",
  statusline_bg = "#e0e0e0",
  lightbg = "#cccccc",
  pmenu_bg = "#5f87d7",
  folder_bg = "#5f87d7",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.black2,
  base02 = M.base_30.one_bg,
  base03 = M.base_30.one_bg2,
  base04 = M.base_30.one_bg3,
  base05 = M.base_30.white,
  base06 = "#2e2e2e",
  base07 = "#1e1e1e",
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
  TelescopeNormal = { fg = M.base_30.light_grey, bg = M.base_30.black },
  TelescopePrompt = { fg = M.base_30.one_bg, bg = M.base_30.cyan },
  TelescopePromptNormal = { fg = M.base_30.red, bg = M.base_30.black2 },
  TelescopePromptPrefix = { fg = M.base_30.red, bg = M.base_30.black2 },
  TelescopeResults = { fg = M.base_30.red, bg = M.base_30.black },
  TelescopeSelection = { fg = M.base_30.red },
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

  TbLineThemeToggleBtn = { fg = M.base_30.red },

  MatchWord = { fg = M.base_30.pink, bg = M.base_30.one_bg3 },

  TbLineBufOn = {
    fg = M.base_30.light_grey,
    bg = M.base_30.black,
  },

  TbLineBufOff = {
    fg = M.base_30.grey_fg,
    bg = M.base_30.black2,
  },

  NvDashAscii = { fg = M.base_30.red, bg = M.base_30.black2 },

  ["@tag.attribute"] = { fg = M.base_30.orange },
  ["@tag.delimiter"] = { fg = M.base_30.red },
  ["@constructor"] = { fg = M.base_30.pink },
  ["Tag"] = { fg = M.base_30.red },
  ["Label"] = { fg = M.base_30.red },
}

M.type = "light"

M = require("base46").override_theme(M, "mito-laser")

return M
