function clear!(v::acb_vec_struct)
    ccall(@libarb(_acb_vec_clear), Cvoid, (Ptr{acb_struct}, Clong), v.entries, v.n)
end
Base.size(v::acb_vec_struct) = (v.n,)
Base.getindex(v::acb_vec_struct, i::Integer) = v.entries + (i - 1) * sizeof(acb_struct)
function Base.setindex!(v::acb_vec_struct, x, i::Integer)
    set!(v[i], x)
    return x
end

Base.size(v::AcbVector) = size(v.acb_vec)
Base.cconvert(::Type{Ptr{acb_struct}}, v::AcbVector) = v.acb_vec
Base.unsafe_convert(::Type{Ptr{acb_struct}}, v::acb_vec_struct) = v.entries

function AcbVector(v::AbstractVector, prec::Integer = _precision(first(v)))
    V = AcbVector(length(v); prec = prec)
    @inbounds for (i, vᵢ) in enumerate(v)
        V[i] = vᵢ
    end
    return V
end

Base.@propagate_inbounds function Base.getindex(v::AcbVector, i::Integer)
    @boundscheck checkbounds(v, i)
    return AcbRef(v.acb_vec[i], precision(v), cstruct(v))
end

Base.@propagate_inbounds function Base.setindex!(v::AcbVector, x, i::Integer)
    @boundscheck checkbounds(v, i)
    v.acb_vec[i] = x
    return x
end
