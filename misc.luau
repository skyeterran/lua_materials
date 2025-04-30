local misc = {}

function misc.debug(x)
    if type(x) == "table" then
        local x_len = 0
        for _, _ in x do
            x_len += 1
        end
        result = "{"
        local i = 1
        for k, v in x do
            if i == x_len then
                result = result .. `{k} = {misc.debug(v)}`
            else
                result = result .. `{k} = {misc.debug(v)}, `
            end
            i += 1
        end
        result = result .. "}"
        return result
    else
        return `{x}`
    end
end

function misc.display(x)
    print(misc.debug(x))
end

return misc