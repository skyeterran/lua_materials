local prim = {}

function prim.float(value)
    return {
        kind = "constant",
        _type = "float",
        args = {
            value = value
        }
    }
end

return prim