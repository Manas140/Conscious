local theme = _G.theme

local present, base16 = pcall(require, "base16-colorscheme")
if not present then
  return
end

local present, colors = pcall(require, "colors." .. theme)
if present then
  base16.setup(colors)
else  
  vim.cmd("colorscheme base16-" .. theme)
end

-- Highlights
function hl(highlight, fg, bg)
  vim.cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
end

-- Status Line
hl("StatusInactive", colors.base03, "none")
hl("StatusLineNC", "none", colors.base00)
hl("StatusNormal", colors.base00, colors.base0B)
hl("StatusReplace", colors.base00, colors.base08)
hl("StatusInsert", colors.base00, colors.base0B)
hl("StatusCommand", colors.base00, colors.base0A)
hl("StatusVisual", colors.base00, colors.base0D)
hl("StatusTerminal", colors.base00, colors.base0E)

-- Nvim Tree
hl("NvimTreeFolderIcon", colors.base0D, "none")
hl("NvimTreeGitDirty", colors.base08, "none")
hl("NvimTreeGitNew", colors.base0B, "none")
hl("NvimTreeGitDeleted", colors.base08, "none")
hl("NvimTreeGitRenamed", colors.base0A, "none")
hl("NvimTreeGitExecFile", colors.base0B, "none")
hl("NvimTreeSpecialFile", colors.base0E, "none")
hl("NvimTreeGitImageFile", colors.base0C, "none")
hl("NvimTreeWindowPicker", colors.base00, colors.base0B)
hl("NvimTreeIndentMarker", colors.base0D, "none")

-- Others
hl("VertSplit", colors.base01, "none")
hl("IndentBlanklineContextChar", colors.base0B, "none")
