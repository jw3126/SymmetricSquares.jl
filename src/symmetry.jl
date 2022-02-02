# direct implementations
e(x::AbstractMatrix) = x
tr(x::AbstractMatrix) = collect(x')
fx(x::AbstractMatrix) = reverse(x, dims=1)
fy(x::AbstractMatrix) = reverse(x, dims=2)
r180(x::AbstractMatrix) = reverse(x)

# compound implementations
r90(x::AbstractMatrix) = fy(x') # fy(x') is slightly more efficient than fy(tr(x))
r270(x::AbstractMatrix) = fx(x') # fx(x') is slightly more efficient than fx(tr(x))
trr(x::AbstractMatrix) = r180(x') # r180(x') is slightly more efficient than r180(tr(x))

# group operation for elements of the symmetry group
Base.:∘(::Val{e}, ::Val{e}) = e
Base.:∘(::Val{e}, ::Val{fx}) = fx
Base.:∘(::Val{e}, ::Val{fy}) = fy
Base.:∘(::Val{e}, ::Val{tr}) = tr
Base.:∘(::Val{e}, ::Val{trr}) = trr
Base.:∘(::Val{e}, ::Val{r90}) = r90
Base.:∘(::Val{e}, ::Val{r180}) = r180
Base.:∘(::Val{e}, ::Val{r270}) = r270

Base.:∘(::Val{fx}, ::Val{e}) = fx
Base.:∘(::Val{fx}, ::Val{fx}) = e
Base.:∘(::Val{fx}, ::Val{fy}) = r180
Base.:∘(::Val{fx}, ::Val{tr}) = r270
Base.:∘(::Val{fx}, ::Val{trr}) = r90
Base.:∘(::Val{fx}, ::Val{r90}) = trr
Base.:∘(::Val{fx}, ::Val{r180}) = fy
Base.:∘(::Val{fx}, ::Val{r270}) = tr

Base.:∘(::Val{fy}, ::Val{e}) = fy
Base.:∘(::Val{fy}, ::Val{fx}) = r180
Base.:∘(::Val{fy}, ::Val{fy}) = e
Base.:∘(::Val{fy}, ::Val{tr}) = r90
Base.:∘(::Val{fy}, ::Val{trr}) = r270
Base.:∘(::Val{fy}, ::Val{r90}) = tr
Base.:∘(::Val{fy}, ::Val{r180}) = fx
Base.:∘(::Val{fy}, ::Val{r270}) = trr

Base.:∘(::Val{tr}, ::Val{e}) = tr
Base.:∘(::Val{tr}, ::Val{fx}) = r90
Base.:∘(::Val{tr}, ::Val{fy}) = r270
Base.:∘(::Val{tr}, ::Val{tr}) = e
Base.:∘(::Val{tr}, ::Val{trr}) = r180
Base.:∘(::Val{tr}, ::Val{r90}) = fx
Base.:∘(::Val{tr}, ::Val{r180}) = trr
Base.:∘(::Val{tr}, ::Val{r270}) = fy

Base.:∘(::Val{trr}, ::Val{e}) = trr
Base.:∘(::Val{trr}, ::Val{fx}) = r270
Base.:∘(::Val{trr}, ::Val{fy}) = r90
Base.:∘(::Val{trr}, ::Val{tr}) = r180
Base.:∘(::Val{trr}, ::Val{trr}) = e
Base.:∘(::Val{trr}, ::Val{r90}) = fy
Base.:∘(::Val{trr}, ::Val{r180}) = tr
Base.:∘(::Val{trr}, ::Val{r270}) = fx

Base.:∘(::Val{r90}, ::Val{e}) = r90
Base.:∘(::Val{r90}, ::Val{fx}) = tr
Base.:∘(::Val{r90}, ::Val{fy}) = trr
Base.:∘(::Val{r90}, ::Val{tr}) = fy
Base.:∘(::Val{r90}, ::Val{trr}) = fx
Base.:∘(::Val{r90}, ::Val{r90}) = r180
Base.:∘(::Val{r90}, ::Val{r180}) = r270
Base.:∘(::Val{r90}, ::Val{r270}) = e

Base.:∘(::Val{r180}, ::Val{e}) = r180
Base.:∘(::Val{r180}, ::Val{fx}) = fy
Base.:∘(::Val{r180}, ::Val{fy}) = fx
Base.:∘(::Val{r180}, ::Val{tr}) = trr
Base.:∘(::Val{r180}, ::Val{trr}) = tr
Base.:∘(::Val{r180}, ::Val{r90}) = r270
Base.:∘(::Val{r180}, ::Val{r180}) = e
Base.:∘(::Val{r180}, ::Val{r270}) = r90

Base.:∘(::Val{r270}, ::Val{e}) = r270
Base.:∘(::Val{r270}, ::Val{fx}) = trr
Base.:∘(::Val{r270}, ::Val{fy}) = tr
Base.:∘(::Val{r270}, ::Val{tr}) = fx
Base.:∘(::Val{r270}, ::Val{trr}) = fy
Base.:∘(::Val{r270}, ::Val{r90}) = e
Base.:∘(::Val{r270}, ::Val{r180}) = r90
Base.:∘(::Val{r270}, ::Val{r270}) = r180

Base.:∘(f::Function, g::Function) = ∘(Val(f), Val(g))
