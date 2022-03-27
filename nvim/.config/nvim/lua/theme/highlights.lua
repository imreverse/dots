local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end
local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end
local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

function highlight(colors)
    local black = colors.black
    local black2 = colors.black2
    local blue = colors.blue
    local cyan = colors.cyan
    local pink = colors.pink
    local darker_black = colors.darker_black
    local folder_bg = colors.folder_bg
    local green = colors.green
    local grey = colors.grey
    local grey_fg = colors.grey_fg
    local line = colors.line
    local nord_blue = colors.nord_blue
    local one_bg = colors.one_bg
    local one_bg2 = colors.one_bg2
    local pmenu_bg = colors.pmenu_bg
    local purple = colors.purple
    local red = colors.red
    local white = colors.white
    local yellow = colors.yellow
    local orange = colors.orange
    local one_bg3 = colors.one_bg3

    fg_bg("Normal",white, black)
    fg("cursorlinenr", white)

    -- Pmenu
    bg("Pmenu", one_bg)
    bg("PmenuSbar", one_bg2)
    bg("PmenuSel", pmenu_bg)
    bg("PmenuThumb", nord_blue)
    fg("CmpItemAbbr", white)
    fg("CmpItemAbbrMatch", white)
    fg("CmpItemKind", white)
    fg("CmpItemMenu", white)

    -- fg("LineNr", grey)
    fg("NvimInternalError", red)
    fg("VertSplit", one_bg2)

    -- Git signs
    fg_bg("DiffAdd", green, "NONE")
    fg_bg("DiffChange", yellow, "NONE")
    fg_bg("DiffChangeDelete", red, "NONE")
    fg_bg("DiffModified", red, "NONE")
    fg_bg("DiffDelete", red, "NONE")

    -- Indent blankline plugin
    fg("IndentBlanklineChar", line)
    fg("IndentBlanklineContextChar", pink)

    -- Lsp diagnostics
    fg("DiagnosticHint", purple)
    fg("DiagnosticError", red)
    fg("DiagnosticWarn", yellow)
    fg("DiagnosticInformation", green)

    -- Nvim Tree
    fg("NvimTreeEmptyFolderName", folder_bg)
    fg("NvimTreeEndOfBuffer", darker_black)
    fg("NvimTreeFolderIcon", folder_bg)
    fg("NvimTreeFolderName", folder_bg)
    fg("NvimTreeGitDirty", red)
    fg("NvimTreeIndentMarker", one_bg2)
    fg("NvimTreeOpenedFile", cyan)
    fg("NvimTreeExecFile", white)
    fg("NvimTreeSpecialFile", white)
    bg("NvimTreeNormal", darker_black)
    bg("NvimTreeNormalNC", darker_black)
    fg("NvimTreeOpenedFolderName", folder_bg)
    fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
    fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
    fg("NvimTreeVertSplit", darker_black)
    bg("NvimTreeVertSplit", darker_black)
    fg_bg("NvimTreeWindowPicker", red, black2)

    -- Telescope
    fg_bg("TelescopeBorder", darker_black, darker_black)
    fg_bg("TelescopePromptBorder", black2, black2)
    fg_bg("TelescopePromptNormal", white, black2)
    fg_bg("TelescopePromptPrefix", red, black2)
    bg("TelescopeNormal", darker_black)
    fg_bg("TelescopePreviewTitle", black, green)
    fg_bg("TelescopePromptTitle", black, red)
    fg_bg("TelescopeResultsTitle", darker_black, darker_black)
    bg("TelescopeSelection", black2)
end

return highlight
