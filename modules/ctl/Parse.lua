if str == nil then
    str = require("ctl.Str")

    if str == nil then
        print("ERROR: Unable to require('Modules.Str')")
    end
end
---@class parse
parse = {
---
---@param source string
---@param from string
---@param to string
---@return string
    GetBlock = function (source, from, to)
        local From_first, From_last = str.Find(source, from)
        local To_first, To_last = str.Find(source, to)

        return str.Copy(source, From_last +1, To_first -1)
    end,

---
---@param source string
---@param from string
---@param to string
---@return table
    GetAllBlock = function (source, from, to)
        local blocks = {}

        local loop = 1

        local From_first, From_last

        local To_first, To_last

        while true do
            From_first, From_last = str.Find(source, from)

            To_first, To_last = str.Find(source, to)

            if From_first == nil or To_first == nil then
                break
            end

            blocks[loop] = str.Copy(source, From_last +1, To_first -1)
            source = str.Copy(source, To_last +1, str.Len(source))
            loop = loop +1
        end

        return blocks
    end,

    GetLines = function (content)
        local Chunk = content
        local Lines = parse.GetAllBlock(Chunk, "^", "\n")

        for i = 1, #Lines do
            local line = parse.GetBlock(Chunk, "^", "\n")
            Chunk = parse.GetBlock(Chunk, "\n", "$")
            Lines[i] = line
        end

        return Lines
    end,

}


return parse
