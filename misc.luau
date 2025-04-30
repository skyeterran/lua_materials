local misc = {}

function misc.debug(x)
    if type(x) == "table" then
        local x_len = 0
        local is_array = true
        for k, _ in x do
            x_len += 1
            if k ~= x_len then
                is_array = false
            end
        end
        local result = ""
        result = "{"
        local i = 1
        for k, v in x do
            local key_name = if is_array then "" else `{k} = `
            if i == x_len then
                result = result .. `{key_name}{misc.debug(v)}`
            else
                result = result .. `{key_name}{misc.debug(v)}, `
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