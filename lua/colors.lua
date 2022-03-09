local theme = _G.theme

local present, base16 = pcall(require, "base16-colorscheme")
if not present then
  return
end

local present, colors = pcall(require, "colors." .. theme)
if present then
  base16.setup(colors)
else  
  cmd("colorscheme base16-" .. theme)
end

-- Highlights
local function hl(highlight, fg, bg)
  if fg == nil then fg = "none" end
  if bg == nil then bg = "none" end
  cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
end

-- Status Line
hl("StatusLine")
hl("StatusNormal")
hl("StatusLineNC", colors.base03)
hl("StatusInactive", colors.base03)
hl("StatusReplace", colors.base08)
hl("StatusInsert", colors.base0B)
hl("StatusCommand", colors.base0A)
hl("StatusVisual", colors.base0D)
hl("StatusTerminal", colors.base0E)

-- Nvim Tree
hl("NvimTreeFolderName")
hl("NvimTreeOpenedFolderName")
hl("NvimTreeEmptyFolderName")
hl("NvimTreeFolderIcon", colors.base03)
hl("NvimTreeGitDirty", colors.base08)
hl("NvimTreeGitNew", colors.base0B)
hl("NvimTreeGitDeleted", colors.base08)
hl("NvimTreeGitRenamed", colors.base0A)
hl("NvimTreeGitExecFile", colors.base0B)
hl("NvimTreeSpecialFile", colors.base0E)
hl("NvimTreeImageFile", colors.base0C)
hl("NvimTreeWindowPicker", colors.base00, colors.base05)
hl("NvimTreeIndentMarker", colors.base03)

-- Telescope
hl("TelescopePromptBorder", colors.base01, colors.base01)
hl("TelescopePromptNormal", nil, colors.base01)
hl("TelescopePromptPrefix", colors.base08, colors.base01)
hl("TelescopeSelection", nil, colors.base01)

-- Menu
hl("Pmenu")
hl("PmenuSbar", colors.base00)
hl("PmenuSel", colors.base00, colors.base05)
hl("PmenuThumb", colors.base00)

-- CMP
hl("CmpItemAbbrMatch", colors.base05)
hl("CmpItemAbbrMatchFuzzy", colors.base05)
hl("CmpItemAbbr", colors.base03)
hl("CmpItemKind", colors.base0E)

-- Number
hl("CursorLine")
hl("CursorLineNR")
hl("LineNr", colors.base03)

-- Others
hl("VertSplit", colors.base01)
