local prim = {}

function prim.node(args)
    local result = {
        kind = args.kind,
        _type = args._type,
        args = args.args
    }
    setmetatable(result, {
        __add = function(a, b)
            return prim.node{
                kind = "add",
                _type = a._type,
                args = {
                    a = a,
                    b = b
                }
            }
        end,
    })
    return result
end

function prim.constant(_type, value)
    return prim.node{
        kind = "constant",
        _type = _type,
        args = {
            value = value
        }
    }
end

function prim.float(value)
    return prim.constant("float", value)
end

function prim.vec2(...)
    return prim.constant("vec2", {...})
end

return prim