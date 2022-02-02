using SymmetricSquares
using Test

@testset "SymmetricSquares" begin
    @testset "Symmetry group" begin
        include("symmetry.jl")
    end
end
