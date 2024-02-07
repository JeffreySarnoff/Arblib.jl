@testset "show" begin
    Mag = Arblib.Mag
    @testset "string" begin
        @test Arblib._string(Mag()) isa String
        @test !isempty(Arblib._string(Mag(2.3)))
        @test Arblib.string_nice(Arb()) isa String
        @test Arblib.string_nice(Acb()) isa String
    end

    @testset "dump" begin
        for x in (Mag(π), Arf(1 // 3), Arb(π))
            str = Arblib.dump_string(x)
            y = Arblib.load_string!(zero(x), str)
            z = Arblib.load_string(typeof(x), str)
            @test isequal(x, y)
            @test isequal(x, z)
        end
    end

    @testset "show" begin
        prec = 32

        P = ArbPoly(Arb[1, 2, 0, π], prec = prec)
        @test "$P" == "1.00000000 + 2.00000000⋅x + [3.14159265 +/- 3.59e-9]⋅x^3"
        P = AcbPoly([Acb[1, 2, 0, π]; Acb(1, 1)], prec = prec)
        @test "$P" ==
              "1.00000000 + 2.00000000⋅x + [3.14159265 +/- 3.59e-9]⋅x^3 + (1.00000000 + 1.00000000im)⋅x^4"
        P = ArbSeries(Arb[1, 2, 0, π], degree = 4, prec = prec)
        @test "$P" == "1.00000000 + 2.00000000⋅x + [3.14159265 +/- 3.59e-9]⋅x^3 + 𝒪(x^5)"
        P = AcbSeries([Acb[1, 2, 0, π]; Acb(1, 1)], degree = 5, prec = prec)
        @test "$P" ==
              "1.00000000 + 2.00000000⋅x + [3.14159265 +/- 3.59e-9]⋅x^3 + (1.00000000 + 1.00000000im)⋅x^4 + 𝒪(x^6)"

        @test "$(ArbPoly())" == "$(AcbPoly())" == "0"
        @test "$(ArbSeries())" == "$(AcbSeries())" == "𝒪(x)"
    end
end
