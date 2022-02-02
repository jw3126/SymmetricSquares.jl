# direct implementations
e(x::AbstractMatrix) = x
tr(x::AbstractMatrix) = collect(x')
fx(x::AbstractMatrix) = reverse(x; dims=1)
fy(x::AbstractMatrix) = reverse(x; dims=2)
r180(x::AbstractMatrix) = reverse(x)

# compound implementations
r90(x::AbstractMatrix) = fy(x') # fy(x') is slightly more efficient than fy(tr(x))
r270(x::AbstractMatrix) = fx(x') # fx(x') is slightly more efficient than fx(tr(x))
trr(x::AbstractMatrix) = r180(x') # r180(x') is slightly more efficient than r180(tr(x))

# group operation for elements of the symmetry group
Base.:∘(::typeof(e   ) , ::typeof(e   ) ) = e
Base.:∘(::typeof(e   ) , ::typeof(fx  ) ) = fx
Base.:∘(::typeof(e   ) , ::typeof(fy  ) ) = fy
Base.:∘(::typeof(e   ) , ::typeof(tr  ) ) = tr
Base.:∘(::typeof(e   ) , ::typeof(trr ) ) = trr
Base.:∘(::typeof(e   ) , ::typeof(r90 ) ) = r90
Base.:∘(::typeof(e   ) , ::typeof(r180) ) = r180
Base.:∘(::typeof(e   ) , ::typeof(r270) ) = r270

Base.:∘(::typeof(fx  ) , ::typeof(e   ) ) = fx
Base.:∘(::typeof(fx  ) , ::typeof(fx  ) ) = e
Base.:∘(::typeof(fx  ) , ::typeof(fy  ) ) = r180
Base.:∘(::typeof(fx  ) , ::typeof(tr  ) ) = r270
Base.:∘(::typeof(fx  ) , ::typeof(trr ) ) = r90
Base.:∘(::typeof(fx  ) , ::typeof(r90 ) ) = trr
Base.:∘(::typeof(fx  ) , ::typeof(r180) ) = fy
Base.:∘(::typeof(fx  ) , ::typeof(r270) ) = tr

Base.:∘(::typeof(fy  ) , ::typeof(e   ) ) = fy
Base.:∘(::typeof(fy  ) , ::typeof(fx  ) ) = r180
Base.:∘(::typeof(fy  ) , ::typeof(fy  ) ) = e
Base.:∘(::typeof(fy  ) , ::typeof(tr  ) ) = r90
Base.:∘(::typeof(fy  ) , ::typeof(trr ) ) = r270
Base.:∘(::typeof(fy  ) , ::typeof(r90 ) ) = tr
Base.:∘(::typeof(fy  ) , ::typeof(r180) ) = fx
Base.:∘(::typeof(fy  ) , ::typeof(r270) ) = trr

Base.:∘(::typeof(tr  ) , ::typeof(e   ) ) = tr
Base.:∘(::typeof(tr  ) , ::typeof(fx  ) ) = r90
Base.:∘(::typeof(tr  ) , ::typeof(fy  ) ) = r270
Base.:∘(::typeof(tr  ) , ::typeof(tr  ) ) = e
Base.:∘(::typeof(tr  ) , ::typeof(trr ) ) = r180
Base.:∘(::typeof(tr  ) , ::typeof(r90 ) ) = fx
Base.:∘(::typeof(tr  ) , ::typeof(r180) ) = trr
Base.:∘(::typeof(tr  ) , ::typeof(r270) ) = fy

Base.:∘(::typeof(trr ) , ::typeof(e   ) ) = trr
Base.:∘(::typeof(trr ) , ::typeof(fx  ) ) = r270
Base.:∘(::typeof(trr ) , ::typeof(fy  ) ) = r90
Base.:∘(::typeof(trr ) , ::typeof(tr  ) ) = r180
Base.:∘(::typeof(trr ) , ::typeof(trr ) ) = e
Base.:∘(::typeof(trr ) , ::typeof(r90 ) ) = fy
Base.:∘(::typeof(trr ) , ::typeof(r180) ) = tr
Base.:∘(::typeof(trr ) , ::typeof(r270) ) = fx

Base.:∘(::typeof(r90 ) , ::typeof(e   ) ) = r90
Base.:∘(::typeof(r90 ) , ::typeof(fx  ) ) = tr
Base.:∘(::typeof(r90 ) , ::typeof(fy  ) ) = trr
Base.:∘(::typeof(r90 ) , ::typeof(tr  ) ) = fy
Base.:∘(::typeof(r90 ) , ::typeof(trr ) ) = fx
Base.:∘(::typeof(r90 ) , ::typeof(r90 ) ) = r180
Base.:∘(::typeof(r90 ) , ::typeof(r180) ) = r270
Base.:∘(::typeof(r90 ) , ::typeof(r270) ) = e

Base.:∘(::typeof(r180) , ::typeof(e   ) ) = r180
Base.:∘(::typeof(r180) , ::typeof(fx  ) ) = fy
Base.:∘(::typeof(r180) , ::typeof(fy  ) ) = fx
Base.:∘(::typeof(r180) , ::typeof(tr  ) ) = trr
Base.:∘(::typeof(r180) , ::typeof(trr ) ) = tr
Base.:∘(::typeof(r180) , ::typeof(r90 ) ) = r270
Base.:∘(::typeof(r180) , ::typeof(r180) ) = e
Base.:∘(::typeof(r180) , ::typeof(r270) ) = r90

Base.:∘(::typeof(r270) , ::typeof(e   ) ) = r270
Base.:∘(::typeof(r270) , ::typeof(fx  ) ) = trr
Base.:∘(::typeof(r270) , ::typeof(fy  ) ) = tr
Base.:∘(::typeof(r270) , ::typeof(tr  ) ) = fx
Base.:∘(::typeof(r270) , ::typeof(trr ) ) = fy
Base.:∘(::typeof(r270) , ::typeof(r90 ) ) = e
Base.:∘(::typeof(r270) , ::typeof(r180) ) = r90
Base.:∘(::typeof(r270) , ::typeof(r270) ) = r180
