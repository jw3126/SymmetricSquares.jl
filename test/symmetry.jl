@testset "Symmetric matrices" begin
    m = [
        1 2 1
        2 3 2
        1 2 1
    ]

    @test e(m) == m
    @test r90(m) == m
    @test r180(m) == m
    @test r270(m) == m
    @test tr(m) == m
    @test trr(m) == m
    @test fx(m) == m
    @test fy(m) == m
end

@testset "Non-symmetric matrices" begin
    m = [
        1 2 3
        4 5 6
        7 8 9
    ]

    @test e(m) == m
    @test r90(m) == [
        7 4 1
        8 5 2
        9 6 3
    ]
    @test r180(m) == [
        9 8 7
        6 5 4
        3 2 1
    ]
    @test r180(m) == [
        9 8 7
        6 5 4
        3 2 1
    ]
    @test r270(m) == [
        3 6 9
        2 5 8
        1 4 7
    ]
    @test tr(m) == [
        1 4 7
        2 5 8
        3 6 9
    ]
    @test trr(m) == [
        9 6 3
        8 5 2
        7 4 1
    ]
    @test fx(m) == [
        7 8 9
        4 5 6
        1 2 3
    ]
    @test fy(m) == [
        3 2 1
        6 5 4
        9 8 7
    ]
end

@testset "Group operation" begin
    # the '∘' function acts as function composition and group operation at the same time
    # it can be used prevent unneeded computations, e.g., (r180 ∘ r180)(m) does not actually
    # rotate m twice by 180 degrees but directly returns e(m)
    m = rand(10, 10)

    # validate that taking these shortcuts returns the expected results
    @test (e ∘ e)(m) == e(e(m))
    @test (e ∘ fx)(m) == e(fx(m))
    @test (e ∘ fy)(m) == e(fy(m))
    @test (e ∘ tr)(m) == e(tr(m))
    @test (e ∘ trr)(m) == e(trr(m))
    @test (e ∘ r90)(m) == e(r90(m))
    @test (e ∘ r180)(m) == e(r180(m))
    @test (e ∘ r270)(m) == e(r270(m))

    @test (fx ∘ e)(m) == fx(e(m))
    @test (fx ∘ fx)(m) == fx(fx(m))
    @test (fx ∘ fy)(m) == fx(fy(m))
    @test (fx ∘ tr)(m) == fx(tr(m))
    @test (fx ∘ trr)(m) == fx(trr(m))
    @test (fx ∘ r90)(m) == fx(r90(m))
    @test (fx ∘ r180)(m) == fx(r180(m))
    @test (fx ∘ r270)(m) == fx(r270(m))

    @test (fy ∘ e)(m) == fy(e(m))
    @test (fy ∘ fx)(m) == fy(fx(m))
    @test (fy ∘ fy)(m) == fy(fy(m))
    @test (fy ∘ tr)(m) == fy(tr(m))
    @test (fy ∘ trr)(m) == fy(trr(m))
    @test (fy ∘ r90)(m) == fy(r90(m))
    @test (fy ∘ r180)(m) == fy(r180(m))
    @test (fy ∘ r270)(m) == fy(r270(m))

    @test (tr ∘ e)(m) == tr(e(m))
    @test (tr ∘ fx)(m) == tr(fx(m))
    @test (tr ∘ fy)(m) == tr(fy(m))
    @test (tr ∘ tr)(m) == tr(tr(m))
    @test (tr ∘ trr)(m) == tr(trr(m))
    @test (tr ∘ r90)(m) == tr(r90(m))
    @test (tr ∘ r180)(m) == tr(r180(m))
    @test (tr ∘ r270)(m) == tr(r270(m))

    @test (trr ∘ e)(m) == trr(e(m))
    @test (trr ∘ fx)(m) == trr(fx(m))
    @test (trr ∘ fy)(m) == trr(fy(m))
    @test (trr ∘ tr)(m) == trr(tr(m))
    @test (trr ∘ trr)(m) == trr(trr(m))
    @test (trr ∘ r90)(m) == trr(r90(m))
    @test (trr ∘ r180)(m) == trr(r180(m))
    @test (trr ∘ r270)(m) == trr(r270(m))

    @test (r90 ∘ e)(m) == r90(e(m))
    @test (r90 ∘ fx)(m) == r90(fx(m))
    @test (r90 ∘ fy)(m) == r90(fy(m))
    @test (r90 ∘ tr)(m) == r90(tr(m))
    @test (r90 ∘ trr)(m) == r90(trr(m))
    @test (r90 ∘ r90)(m) == r90(r90(m))
    @test (r90 ∘ r180)(m) == r90(r180(m))
    @test (r90 ∘ r270)(m) == r90(r270(m))

    @test (r180 ∘ e)(m) == r180(e(m))
    @test (r180 ∘ fx)(m) == r180(fx(m))
    @test (r180 ∘ fy)(m) == r180(fy(m))
    @test (r180 ∘ tr)(m) == r180(tr(m))
    @test (r180 ∘ trr)(m) == r180(trr(m))
    @test (r180 ∘ r90)(m) == r180(r90(m))
    @test (r180 ∘ r180)(m) == r180(r180(m))
    @test (r180 ∘ r270)(m) == r180(r270(m))

    @test (r270 ∘ e)(m) == r270(e(m))
    @test (r270 ∘ fx)(m) == r270(fx(m))
    @test (r270 ∘ fy)(m) == r270(fy(m))
    @test (r270 ∘ tr)(m) == r270(tr(m))
    @test (r270 ∘ trr)(m) == r270(trr(m))
    @test (r270 ∘ r90)(m) == r270(r90(m))
    @test (r270 ∘ r180)(m) == r270(r180(m))
    @test (r270 ∘ r270)(m) == r270(r270(m))
end
