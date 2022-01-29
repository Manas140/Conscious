local base16 = require('base16')

-- themes
local paradise_dark = base16.theme_from_array {
	"151515"; "1f1f1f"; "282828"; "3b3b3b";
	"e8e3e3"; "e8e3e3"; "e8e3e3"; "e8e3e3";
  "b66467"; "d9bc8c"; "d9bc8c"; "8c977d";
	"8aa6a2"; "8da3b9"; "a988b0"; "e8e3e3";
}
local paradise_light = base16.theme_from_array {
	"E8E3E3"; "DED9D9"; "D5D1D1"; "C2BEBE";
	"747272"; "747272"; "747272"; "747272";
  "b66467"; "d9bc8c"; "d9bc8c"; "8c977d";
	"8aa6a2"; "8da3b9"; "a988b0"; "747272";
}
local uwu = base16.theme_from_array {
  "131A1C"; "1b2224"; "232a2c"; "3c3e3e";
  "868888"; "d6d6d6"; "1f2123"; "161819";
  "ef7cbb"; "e59e67"; "e7ac7e"; "6bb05d"; 
  "5b98a9"; "7ab3c3"; "e74c4c"; "e74c4c"; 
}

-- base16(base16.themes["classic-dark"], true) -- to use default base16-themes
base16(paradise_dark, true)

-- higlights
vim.cmd [[
  exe "hi StatusInactive guibg=background guifg=".g:terminal_color_8 
  exe "hi StatusNormal guifg=background guibg=".g:terminal_color_2
  exe "hi StatusReplace guifg=background guibg=".g:terminal_color_1
  exe "hi StatusInsert guifg=background guibg=".g:terminal_color_2
  exe "hi StatusCommand guifg=background guibg=".g:terminal_color_3
  exe "hi StatusVisual guifg=background guibg=".g:terminal_color_4
  exe "hi StatusTerminal guifg=background guibg=".g:terminal_color_5

  exe "hi NvimTreeGitDirty guifg=".g:terminal_color_1
  exe "hi NvimTreeGitNew guifg=".g:terminal_color_2
  exe "hi NvimTreeGitDeleted guifg=".g:terminal_color_1
  exe "hi NvimTreeGitRenamed guifg=".g:terminal_color_3
  exe "hi NvimTreeSpecialFile guifg=".g:terminal_color_5
  exe "hi NvimTreeExecFile guifg=".g:terminal_color_2
  exe "hi NvimTreeImageFile guifg=".g:terminal_color_7

  hi EndOfBuffer guifg=background 
  hi LineNr guibg=background
  hi SignColumn guibg=background
  hi VertSplit guibg=background

  hi! link TabLineSel StatusInsert
  hi TabLine guibg=background
  hi TabLineFill guibg=background

  hi FoldColumn guibg=background                                                                         
  hi DiffAdd guibg=background                                                                         
  hi DiffChange guibg=background                                             
  hi DiffDelete guibg=background                                                                
  hi DiffText guibg=background
]]
