-- based on DROP + MITO GMK LASER CUSTOM KEYCAP SET

local M = {}

M.base_30 = {
  white = "#897bd1",
  darker_black = "#1d1741",
  black = "#201947",
  black2 = "#271e56",
  one_bg = "#2e2466",
  one_bg2 = "#352975",
  one_bg3 = "#3e318a",
  grey = "#423494",
  grey_fg = "#4c3ca9",
  grey_fg2 = "#5442bb",
  light_grey = "#6d5dc6",
  red = "#ff047d",
  baby_pink = "#ff1d8a",
  pink = "#e61d7e",
  line = "#2b215f",
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
  statusline_bg = "#271e56",
  lightbg = "#352975",
  pmenu_bg = "#268bd2",
  folder_bg = "#268bd2",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.black2,
  base02 = M.base_30.one_bg,
  base03 = M.base_30.one_bg2,
  base04 = M.base_30.one_bg3,
  base05 = M.base_30.white,
  base06 = "#eee8d5",
  base07 = "#efe9d8",
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

M.type = "dark"

M = require("base46").override_theme(M, "mito-laser")

return M
