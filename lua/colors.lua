local theme = _G.theme

local present, base16 = pcall(require, "base16-colorscheme")
if not present then return end

local present, color = pcall(require, "colors." .. theme)
if present then
  base16.setup(color)
else 
  local ok, err = pcall(cmd, ("colorscheme base16-" .. theme))
  if not ok then
    _G.theme = "paradise-dark"
    color = require("colors." .. _G.theme)
    base16.setup(color)
    print(err)
  end
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
hl("StatusLineNC", color.base03)
hl("StatusInactive", color.base03)
hl("StatusReplace", color.base08)
hl("StatusInsert", color.base0B)
hl("StatusCommand", color.base0A)
hl("StatusVisual", color.base0D)
hl("StatusTerminal", color.base0E)

-- Nvim Tree
hl("NvimTreeFolderName")
hl("NvimTreeOpenedFolderName")
hl("NvimTreeEmptyFolderName")
hl("NvimTreeFolderIcon", color.base03)
hl("NvimTreeGitDirty", color.base08)
hl("NvimTreeGitNew", color.base0B)
hl("NvimTreeGitDeleted", color.base08)
hl("NvimTreeGitRenamed", color.base0A)
hl("NvimTreeGitExecFile", color.base0B)
hl("NvimTreeSpecialFile", color.base0E)
hl("NvimTreeImageFile", color.base0C)
hl("NvimTreeWindowPicker", color.base05, color.base01)
hl("NvimTreeIndentMarker", color.base03)

-- Telescope
hl("TelescopePromptBorder", color.base01, color.base01)
hl("TelescopePromptNormal", nil, color.base01)
hl("TelescopePromptPrefix", color.base08, color.base01)
hl("TelescopeSelection", nil, color.base01)


-- Menu
hl("Pmenu", nil, color.base01)
hl("PmenuSbar", nil, color.base01)
hl("PmenuThumb", nil, color.base01)
hl("PmenuSel", nil, color.base02)

-- CMP
hl("CmpItemAbbrMatch", color.base05)
hl("CmpItemAbbrMatchFuzzy", color.base05)
hl("CmpItemAbbr", color.base03)
hl("CmpItemKind", color.base0E)
hl("CmpItemMenu", color.base0E)

-- Number
hl("CursorLine")
hl("CursorLineNR")
hl("LineNr", color.base03)

-- Others
hl("NormalFloat", nil, color.base01)
hl("FloatBorder", color.base01, color.base01)
