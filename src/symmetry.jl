# direct implementations
e(x::AbstractMatrix) = x
tr(x::AbstractMatrix) = collect(x')
fy(x::AbstractMatrix) = x[:,reverse(axes(x, 2))]
r180(x::AbstractMatrix) = reverse(x)

# compound implementations
r90(x::AbstractMatrix) = fy(tr(x))
r270(x::AbstractMatrix) = tr(fy(x))
fx(x::AbstractMatrix) = r180(fy(x))
trr(x::AbstractMatrix) = r90(fy(x))


∘(::Val{fy}, ::Val{tr}) = r90
∘(::Val{tr}, ::Val{fx}) = r270
∘(::Val{r180}, ::Val{fy}) = fx
∘(::Val{r90}, ::Val{fy}) = trr
∘(f::Function, g::Function) = ∘(Val(f), Val(g))
