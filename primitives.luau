local primitives = {}

function primitives.float(value)
    return {
        kind = "constant",
        _type = "float",
        args = {
            value = value
        }
    }
end

return primitives