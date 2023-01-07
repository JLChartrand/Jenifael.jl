function filteredField(ooquote::Expr)
    n = length(ooquote.args)
    fields = []
    funcs = []
    for i in 1:2:n
        if ooquote.args[i+1].head == :(::)
            push!(fields, ooquote.args[i])
            push!(fields, ooquote.args[i + 1])
        else
            push!(funcs, ooquote.args[i + 1])
        end
    end
    fieldsAsQuote = Expr(:block, fields...)
    methodsAsQuote = Expr(:block, funcs...)
    return fieldsAsQuote, funcs
end
macro OOCall(expr)
    @assert expr.head == :call
    this, funcName = expr.args[1].args
    if length(expr.args) == 1
        newcall = Expr(:call, funcName.value, this)
    else
        newcall = Expr(:call, funcName.value, this, expr.args[3:end...])
    end
    return newcall
end
function convertOOToFunctional(expr::Expr, funcType::Union{Expr, Symbol})
    firstArg = Expr(:(::), :this, funcType)
    funccall = firstArg
    expr2 = copy(expr)
    #expr2.args[1] = Expr(:call, expr2.args[1], funccall)
    #@show expr2.args[1].args
    expr2.args[1].args = [expr2.args[1].args[1], funccall, expr2.args[1].args[2:end]...]
    return expr2
end

function filteredField(ooquote::Expr)
    n = length(ooquote.args)
    fields = []
    funcs = []
    for i in 1:2:n
        if ooquote.args[i+1].head == :(::)
            push!(fields, ooquote.args[i])
            push!(fields, ooquote.args[i + 1])
        else
            push!(funcs, ooquote.args[i + 1])
        end
    end
    fieldsAsQuote = Expr(:block, fields...)
    methodsAsQuote = Expr(:block, funcs...)
    return fieldsAsQuote, funcs
end
macro OOCall(expr)
    @assert expr.head == :call
    this, funcName = expr.args[1].args
    if length(expr.args) == 1
        newcall = Expr(:call, funcName.value, this)
    else
        newcall = Expr(:call, funcName.value, this, expr.args[3:end...])
    end
    return newcall
end
function convertOOToFunctional(expr::Expr, funcType::Union{Expr, Symbol})
    firstArg = Expr(:(::), :this, funcType)
    funccall = firstArg
    expr2 = copy(expr)
    #expr2.args[1] = Expr(:call, expr2.args[1], funccall)
    #@show expr2.args[1].args
    expr2.args[1].args = [expr2.args[1].args[1], funccall, expr2.args[1].args[2:end]...]
    return expr2
end