@testset "Symmetric matrices" begin
    m = [1 2 1;
         2 3 2;
         1 2 1]

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
    m = [1 2 3;
         4 5 6;
         7 8 9]

    @test e(m) == m
    @test r90(m) == [7 4 1;
                     8 5 2;
                     9 6 3]
    @test r180(m) == [9 8 7;
                      6 5 4;
                      3 2 1]
    @test r180(m) == [9 8 7;
                      6 5 4;
                      3 2 1]
    @test r270(m) == [3 6 9;
                      2 5 8
                      1 4 7]
    @test tr(m) == [1 4 7;
                    2 5 8;
                    3 6 9]
    @test trr(m) == [9 6 3;
                     8 5 2;
                     7 4 1]
    @test fx(m) == [7 8 9;
                    4 5 6;
                    1 2 3]
    @test fy(m) == [3 2 1;
                   6 5 4;
                   9 8 7]
end
