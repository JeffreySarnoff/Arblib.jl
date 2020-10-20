"""
    Arf <: Real
"""
struct Arf <: Real
    arf::arf_struct
    prec::Int

    Arf(; prec::Integer = DEFAULT_PRECISION[]) = new(arf_struct(), prec)

    Arf(x::Union{UInt,Int}; prec::Integer = DEFAULT_PRECISION[]) = new(arf_struct(x), prec)
end

"""
    Mag <: Real
"""
struct Mag <: Real
    mag::mag_struct

    Mag(x::mag_struct) = new(mag_struct(x))

    Mag(x::Union{Mag,Arf}) = new(mag_struct(cstruct(x)))
end

"""
    Arb <: Real
"""
struct Arb <: Real
    arb::arb_struct
    prec::Int

    Arb(; prec::Integer = DEFAULT_PRECISION[]) = new(arb_struct(), prec)
end

"""
    Acb <: Number
"""
struct Acb <: Number
    acb::acb_struct
    prec::Int

    Acb(; prec::Integer = DEFAULT_PRECISION[]) = new(acb_struct(), prec)
end

# Refs are in reverse order to model their possible depencies
"""
    AcbRef <: Number
"""
struct AcbRef <: Number
    acb_ptr::Ptr{acb_struct}
    prec::Int
    parent::Union{acb_vec_struct,acb_mat_struct}
end

"""
    ArbRef <: Real
"""
struct ArbRef <: Real
    arb_ptr::Ptr{arb_struct}
    prec::Int
    parent::Union{acb_struct,AcbRef,arb_vec_struct,arb_mat_struct}
end

"""
    ArfRef <: Real
"""
struct ArfRef <: Real
    arf_ptr::Ptr{arf_struct}
    prec::Int
    parent::Union{arb_struct,ArbRef}
end

"""
    MagRef <: Real
"""
struct MagRef <: Real
    mag_ptr::Ptr{mag_struct}
    parent::Union{arb_struct,ArbRef}
end

"""
    ArbPoly
"""
struct ArbPoly
    arb_poly::arb_poly_struct
    prec::Int

    ArbPoly(; prec::Integer = DEFAULT_PRECISION[]) = new(arb_poly_struct(), prec)
end

"""
    ArbSeries <: Number
"""
struct ArbSeries <: Number
    arb_poly::arb_poly_struct
    degree::Int
    prec::Int

    ArbSeries(degree::Integer; prec::Integer = DEFAULT_PRECISION[]) =
        new(arb_poly_struct(), degree, prec)
end

"""
    AcbPoly
"""
struct AcbPoly
    acb_poly::acb_poly_struct
    prec::Int

    AcbPoly(; prec::Integer = DEFAULT_PRECISION[]) = new(acb_poly_struct(), prec)
end

"""
    AcbSeries <: Number
"""
struct AcbSeries <: Number
    acb_poly::acb_poly_struct
    degree::Int
    prec::Int

    AcbSeries(degree::Integer; prec::Integer = DEFAULT_PRECISION[]) =
        new(acb_poly_struct(), degree, prec)
end

"""
    ArbVector <: DenseVector{Arb}
"""
struct ArbVector <: DenseVector{Arb}
    arb_vec::arb_vec_struct
    prec::Int
end
ArbVector(n::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    ArbVector(arb_vec_struct(n), prec)

"""
    AcbVector <: DenseVector{Acb}
"""
struct AcbVector <: DenseVector{Acb}
    acb_vec::acb_vec_struct
    prec::Int
end
AcbVector(n::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    AcbVector(acb_vec_struct(n), prec)

"""
    ArbMatrix <: DenseMatrix{Arb}
"""
struct ArbMatrix <: DenseMatrix{Arb}
    arb_mat::arb_mat_struct
    prec::Int
end
ArbMatrix(r::Integer, c::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    ArbMatrix(arb_mat_struct(r, c), prec)

"""
    AcbMatrix <: DenseMatrix{Acb}
"""
struct AcbMatrix <: DenseMatrix{Acb}
    acb_mat::acb_mat_struct
    prec::Int
end
AcbMatrix(r::Integer, c::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    AcbMatrix(acb_mat_struct(r, c), prec)

"""
    ArbRefVector <: DenseMatrix{ArbRef}
"""
struct ArbRefVector <: DenseVector{ArbRef}
    arb_vec::arb_vec_struct
    prec::Int
end
ArbRefVector(n::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    ArbRefVector(arb_vec_struct(n), prec)

"""
    AcbRefVector <: DenseMatrix{AcbRef}
"""
struct AcbRefVector <: DenseVector{AcbRef}
    acb_vec::acb_vec_struct
    prec::Int
end
AcbRefVector(n::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    AcbRefVector(acb_vec_struct(n), prec)

"""
    ArbRefMatrix <: DenseMatrix{ArbRef}
"""
struct ArbRefMatrix <: DenseMatrix{ArbRef}
    arb_mat::arb_mat_struct
    prec::Int
end
ArbRefMatrix(r::Integer, c::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    ArbRefMatrix(arb_mat_struct(r, c), prec)

"""
    AcbRefMatrix <: DenseMatrix{AcbRef}
"""
struct AcbRefMatrix <: DenseMatrix{AcbRef}
    acb_mat::acb_mat_struct
    prec::Int
end
AcbRefMatrix(r::Integer, c::Integer; prec::Integer = DEFAULT_PRECISION[]) =
    AcbRefMatrix(acb_mat_struct(r, c), prec)

# conversion between ref and non-ref arrays.
for T in [:Arb, :Acb], A in [:Vector, :Matrix]
    TA = Symbol(T, A)
    TRefA = Symbol(T, :Ref, A)
    @eval begin
        $TRefA(M::$TA) = $TRefA(cstruct(M), precision(M))
        $TA(M::$TRefA) = $TA(cstruct(M), precision(M))
    end
end

for (T, prefix) in (
    (Mag, :mag),
    (Arf, :arf),
    (Arb, :arb),
    (Acb, :acb),
    (Union{ArbVector,ArbRefVector}, :arb_vec),
    (Union{AcbVector,AcbRefVector}, :acb_vec),
    (Union{ArbMatrix,ArbRefMatrix}, :arb_mat),
    (Union{AcbMatrix,AcbRefMatrix}, :acb_mat),
    (Union{ArbPoly,ArbSeries}, :arb_poly),
    (Union{AcbPoly,AcbSeries}, :acb_poly),
)
    arbstruct = Symbol(prefix, :_struct)
    @eval begin
        cprefix(::Type{<:$T}) = $(QuoteNode(Symbol(prefix)))
        cstruct(x::$T) = getfield(x, cprefix($T))
        cstruct(x::$arbstruct) = x
        cstructtype(::Type{<:$T}) = $arbstruct
        Base.convert(::Type{$arbstruct}, x::$T) = cstruct(x)
    end
end

# handle Ref types
for prefix in [:mag, :arf, :arb, :acb]
    T = Symbol(uppercasefirst(string(prefix)))
    TRef = Symbol(T, :Ref)
    TStruct = Symbol(prefix, :_struct)
    TPtr = Symbol(prefix, :_ptr)
    @eval begin
        cprefix(::Type{$TRef}) = $(QuoteNode(prefix))
        cstructtype(::Type{$TRef}) = $TStruct
        cstruct(x::$TRef) = x.$TPtr
        Base.convert(::Type{Ptr{$TStruct}}, x::$TRef) = cstruct(x)
        Base.cconvert(::Type{Ref{$TStruct}}, x::$TRef) = cstruct(x)

        parentstruct(x::$T) = cstruct(x)
        parentstruct(x::$TRef) = x
    end
end

const MagLike = Union{Mag,MagRef,cstructtype(Mag),Ptr{cstructtype(Mag)}}
const ArfLike = Union{Arf,ArfRef,cstructtype(Arf),Ptr{cstructtype(Arf)}}
const ArbLike = Union{Arb,ArbRef,cstructtype(Arb),Ptr{cstructtype(Arb)}}
const AcbLike = Union{Acb,AcbRef,cstructtype(Acb),Ptr{cstructtype(Acb)}}
const ArbVectorLike = Union{ArbVector,ArbRefVector,cstructtype(ArbVector)}
const AcbVectorLike = Union{AcbVector,AcbRefVector,cstructtype(AcbVector)}
const ArbMatrixLike = Union{ArbMatrix,ArbRefMatrix,cstructtype(ArbMatrix)}
const AcbMatrixLike = Union{AcbMatrix,AcbRefMatrix,cstructtype(AcbMatrix)}
const ArbPolyLike = Union{ArbPoly,ArbSeries,cstructtype(ArbPoly)}
const AcbPolyLike = Union{AcbPoly,AcbSeries,cstructtype(AcbPoly)}
const ArbTypes = Union{
    Mag,
    MagRef,
    Arf,
    ArfRef,
    Arb,
    ArbRef,
    Acb,
    AcbRef,
    ArbVector,
    ArbRefVector,
    AcbVector,
    AcbRefVector,
    ArbMatrix,
    ArbRefMatrix,
    AcbMatrix,
    AcbRefMatrix,
    ArbPoly,
    ArbSeries,
    AcbPoly,
    AcbSeries,
}

Base.setindex!(x::Union{Mag,MagRef,Arf,ArfRef,Arb,ArbRef,Acb,AcbRef}, z::Number) =
    set!(x, z)
Base.setindex!(x::Union{Mag,MagRef}, z::Ptr{mag_struct}) = set!(x, z)
Base.setindex!(x::Union{Arf,ArfRef}, z::Ptr{arf_struct}) = set!(x, z)
Base.setindex!(x::Union{Arb,ArbRef}, z::Ptr{arb_struct}) = set!(x, z)
Base.setindex!(x::Union{Acb,AcbRef}, z::Ptr{acb_struct}) = set!(x, z)

Base.Float64(x::MagLike) = get(x)
function Base.Float64(x::ArfLike; rnd::Union{arb_rnd,RoundingMode} = RoundNearest)
    ccall(@libarb(arf_get_d), Cdouble, (Ref{arf_struct}, arb_rnd), x, rnd)
end
function Base.Int(x::ArfLike; rnd::Union{arb_rnd,RoundingMode} = RoundNearest)
    ccall(@libarb(arf_get_si), Clong, (Ref{arf_struct}, arb_rnd), x, rnd)
end
Base.Float64(x::ArbLike) = Float64(midref(x))
Base.ComplexF64(z::AcbLike) = Complex(Float64(realref(z)), Float64(imagref(z)))
