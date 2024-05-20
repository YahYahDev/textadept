 
local parse = require("ctl.Parse")

local function LexC()
    local dirpath = parse.GetAllBlock(buffer.filename, "^", "/") -- Gets path minus filename

    for i = 1, #dirpath -1 do -- Reconstructs path from choped buffer.filename
        dirpath[1] = str.Merge(dirpath[1].."/", dirpath[i + 1])
    end

    local ctags = io.popen("ctags -f - -R "..dirpath[1].."/".." --kinds-C=t") -- Use ctags to parse a projects directory
    local tags = ctags:read("*a")
    ctags:close()
    
    local types = {}
        
        
    content = parse.GetLines(tags)
    for i = 1, #content do
        if string.find(content[i], "typedef") then
            types[#types + 1] = parse.GetBlock(content[i], "^", "%s")
            
        end
    end


    events.connect(events.LEXER_LOADED, function(name)
        if name == 'ansi_c' then buffer.lexer:set_word_list(lexer.TYPE, types, true) end -- Update word list to include custom types
    end)
    
end

LexC()
