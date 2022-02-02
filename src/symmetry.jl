# direct implementations
e(x::AbstractMatrix) = x
tr(x::AbstractMatrix) = collect(x')
fx(x::AbstractMatrix) = reverse(x, dims=1)
fy(x::AbstractMatrix) = reverse(x, dims=2)
r180(x::AbstractMatrix) = reverse(x)

# compound implementations
r90(x::AbstractMatrix) = fy(tr(x)) # mini optimization to fy(x') ?
r270(x::AbstractMatrix) = tr(fy(x))
trr(x::AbstractMatrix) = r90(fy(x))

∘(::Val{fy}, ::Val{tr}) = r90
∘(::Val{tr}, ::Val{fx}) = r270
∘(::Val{r180}, ::Val{fy}) = fx
∘(::Val{r90}, ::Val{fy}) = trr
∘(f::Function, g::Function) = ∘(Val(f), Val(g))
