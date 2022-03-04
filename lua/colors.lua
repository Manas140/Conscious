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
function hl(highlight, fg, bg)
  if fg == nil then fg = "none" end
  if bg == nil then bg = "none" end
  cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
end

-- Status Line
hl("StatusInactive", colors.base03)
hl("StatusLineNC", nil, colors.base01)
hl("StatusLine", nil, colors.base01)
hl("StatusNormal", colors.base00, colors.base05)
hl("StatusReplace", colors.base00, colors.base08)
hl("StatusInsert", colors.base00, colors.base0B)
hl("StatusCommand", colors.base00, colors.base0A)
hl("StatusVisual", colors.base00, colors.base0D)
hl("StatusTerminal", colors.base00, colors.base0E)

-- Nvim Tree
hl("NvimTreeFolderIcon", colors.base0D)
hl("NvimTreeGitDirty", colors.base08)
hl("NvimTreeGitNew", colors.base0B)
hl("NvimTreeGitDeleted", colors.base08)
hl("NvimTreeGitRenamed", colors.base0A)
hl("NvimTreeGitExecFile", colors.base0B)
hl("NvimTreeSpecialFile", colors.base0E)
hl("NvimTreeGitImageFile", colors.base0C)
hl("NvimTreeWindowPicker", colors.base00, colors.base0B)
hl("NvimTreeIndentMarker", colors.base03)

-- Telescope
hl("TelescopePromptBorder", colors.base01, colors.base01)
hl("TelescopePromptNormal", nil, colors.base01)
hl("TelescopePromptPrefix", colors.base08, colors.base01)
hl("TelescopeSelection", nil, colors.base01)

-- Menu
hl("Pmenu", nil, colors.base00)
hl("PmenuSbar", colors.base00, colors.base00)
hl("PmenuSel", colors.base00, colors.base05)
hl("PmenuThumb", colors.base02, colors.base02)

-- CMP
hl("CmpItemAbbrMatch", colors.base05)
hl("CmpItemAbbrMatchFuzzy", colors.base05)
hl("CmpItemAbbr", colors.base03)
hl("CmpItemKind", colors.base0E)

-- Number
hl("LineNr", colors.base03)
hl("CursorLine")
hl("CursorLineNR", colors.base05)

-- Others
hl("VertSplit", colors.base01)
