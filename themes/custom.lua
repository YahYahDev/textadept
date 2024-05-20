-- Copyright 2007-2024 Mitchell. See LICENSE.
-- Dark theme for Textadept.

local view, colors, styles = view, view.colors, view.styles

-- Greyscale colors.
colors.black = 0x000000
colors.light_black = 0x333333
colors.dark_grey = 0x666666
colors.grey = 0x999999 -- unused

colors.light_grey = 0xCCCCCC
-- #cccccc - Default text, variables

colors.white = 0xFFFFFF -- unused

-- Normal colors.
colors.red = 0x0000cc
-- - Strings
colors.orange = 0x0066CC
-- - Comments?

colors.yellow = 0x10f0f0
-- #f0d010 - Types

colors.lime = 0x00ff77
-- #77ff00 - Brackets, comma's, dot's, semicolin's, ect

colors.babyblue = 0xffbb90
-- #90bbff - Functions

colors.green = 0x009900

colors.teal = 0xffff55
-- #00dfef - Keywords, control flow

colors.blue = 0xCC6600

colors.violet = 0xCC0066

colors.purple = 0xff00cc
-- #cc00ff - Pre-processor
colors.magenta = 0x6600CC

-- Custom colors.
colors.background = 0x161511
-- #111516 - Background

colors.linenumber = 0xafaf0f
-- #0fafaf - Line number

-- colors.currentlinenumber = 0xffff0f
-- Unable to have current line number till i patch core of text adept to allow it


-- Default font.
if not font then font = WIN32 and 'Consolas' or OSX and 'Monaco' or 'Monospace' end
if not size then size = not OSX and 10 or 12 end

-- Predefined styles.
styles[view.STYLE_DEFAULT] = {
	font = font, size = size, fore = colors.light_grey, back = colors.background
}

styles[view.STYLE_LINENUMBER] = {fore = colors.linenumber, back = colors.background}
styles[view.STYLE_BRACELIGHT] = {fore = colors.lime, bold = true}
styles[view.STYLE_BRACEBAD] = {fore = colors.red}
-- styles[view.STYLE_CONTROLCHAR] = {}
styles[view.STYLE_INDENTGUIDE] = {fore = colors.light_gray}
styles[view.STYLE_CALLTIP] = {fore = colors.light_grey, back = colors.light_black}
styles[view.STYLE_FOLDDISPLAYTEXT] = {fore = colors.dark_grey, back = colors.light_black}

-- Tag styles.
styles[lexer.ANNOTATION] = {fore = colors.magenta}
styles[lexer.ATTRIBUTE] = {fore = colors.violet}
styles[lexer.BOLD] = {bold = true}
styles[lexer.CLASS] = {fore = colors.babyblue}
styles[lexer.CODE] = {fore = colors.dark_grey, eol_filled = true}
styles[lexer.COMMENT] = {fore = colors.dark_grey}
-- styles[lexer.CONSTANT] = {}
styles[lexer.CONSTANT_BUILTIN] = {fore = colors.purple}
styles[lexer.EMBEDDED] = {fore = colors.purple}
styles[lexer.ERROR] = {fore = colors.red}

-- Function highlighting
styles[lexer.FUNCTION] = {italic = true, fore = colors.babyblue} -- Default???
styles[lexer.FUNCTION_BUILTIN] = {italic = true, fore = colors.babyblue} -- Standard lib function?
styles[lexer.FUNCTION_METHOD] = {italic = true, fore = colors.babyblue} -- Method aka object function?

styles[lexer.HEADING] = {fore = colors.magenta}

-- styles[lexer.IDENTIFIER] = {} -- Unsure for what this is used for
styles[lexer.ITALIC] = {italic = true}
styles[lexer.LINK] = {underline = true}
styles[lexer.LIST] = {fore = colors.teal}

styles[lexer.LABEL] = {fore = colors.teal} -- Goto labels?
styles[lexer.NUMBER] = {fore = colors.teal} -- Const number
styles[lexer.PREPROCESSOR] = {fore = colors.purple} -- Pre-processor
styles[lexer.KEYWORD] = {bold = true, fore = colors.teal} -- Keyword
styles[lexer.OPERATOR] = {bold = true, fore = colors.lime} -- Brackets ect
styles[lexer.VARIABLE] = {italic = true, fore = colors.light_gray} -- Variables
styles[lexer.STRING] = {fore = colors.red} -- Strings
styles[lexer.TYPE] = {bold = true, fore = colors.yellow} -- Types

styles[lexer.REFERENCE] = {underline = true}
styles[lexer.REGEX] = {fore = colors.lime}
styles[lexer.TAG] = {fore = colors.blue}
styles[lexer.UNDERLINE] = {underline = true}
-- styles[lexer.VARIABLE_BUILTIN] = {fore = colors.yellow}
-- styles[lexer.WHITESPACE] = {}

-- CSS.
styles.property = styles[lexer.ATTRIBUTE]
-- styles.pseudoclass = {}
-- styles.pseudoelement = {}
-- Diff.
styles.addition = {fore = colors.green}
styles.deletion = {fore = colors.red}
styles.change = {fore = colors.yellow}
-- HTML.
styles.tag_unknown = styles.tag .. {italic = true}
styles.attribute_unknown = styles.attribute .. {italic = true}
-- Latex, TeX, and Texinfo.
styles.command = styles[lexer.KEYWORD]
styles.command_section = styles[lexer.HEADING]
styles.environment = styles[lexer.TYPE]
styles.environment_math = styles[lexer.NUMBER]
-- Makefile.
-- styles.target = {}
-- Markdown.
-- styles.hr = {}
-- Python.
styles.keyword_soft = {}
-- XML.
-- styles.cdata = {}
-- YAML.
styles.error_indent = {back = colors.red}

-- Element colors.
-- view.element_color[view.ELEMENT_SELECTION_TEXT] = colors.light_grey
view.element_color[view.ELEMENT_SELECTION_BACK] = colors.light_black
-- view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_TEXT] = colors.light_grey
view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_BACK] = colors.light_black
-- view.element_color[view.ELEMENT_SELECTION_SECONDARY_TEXT] = colors.light_grey
view.element_color[view.ELEMENT_SELECTION_SECONDARY_BACK] = colors.light_black
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_TEXT] = colors.light_grey
view.element_color[view.ELEMENT_SELECTION_INACTIVE_BACK] = colors.light_black
view.element_color[view.ELEMENT_CARET] = colors.light_grey
-- view.element_color[view.ELEMENT_CARET_ADDITIONAL] =
if view ~= ui.command_entry then
	view.element_color[view.ELEMENT_CARET_LINE_BACK] = colors.light_black | 0x80000000
end
view.caret_line_layer = view.LAYER_UNDER_TEXT

-- Fold Margin.
view:set_fold_margin_color(true, colors.background)
view:set_fold_margin_hi_color(true, colors.background)

-- Markers.
-- view.marker_fore[textadept.bookmarks.MARK_BOOKMARK] = colors.black
view.marker_back[textadept.bookmarks.MARK_BOOKMARK] = colors.blue
-- view.marker_fore[textadept.run.MARK_WARNING] = colors.black
view.marker_back[textadept.run.MARK_WARNING] = colors.yellow
-- view.marker_fore[textadept.run.MARK_ERROR] = colors.black
view.marker_back[textadept.run.MARK_ERROR] = colors.red
for i = view.MARKNUM_FOLDEREND, view.MARKNUM_FOLDEROPEN do -- fold margin
	view.marker_fore[i] = colors.black
	view.marker_back[i] = colors.dark_grey
	view.marker_back_selected[i] = colors.light_grey
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND] = colors.yellow
view.indic_alpha[ui.find.INDIC_FIND] = 0x80
view.indic_fore[textadept.editing.INDIC_HIGHLIGHT] = colors.orange
view.indic_alpha[textadept.editing.INDIC_HIGHLIGHT] = 0x80
view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER] = colors.light_grey
view.indic_fore[textadept.run.INDIC_WARNING] = colors.yellow
view.indic_fore[textadept.run.INDIC_ERROR] = colors.red

-- Call tips.
view.call_tip_fore_hlt = colors.blue

-- Long Lines.
view.edge_color = colors.light_black

-- Find & replace pane entries.
ui.find.entry_font = font .. ' ' .. size
