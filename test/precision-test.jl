@testset "precision" begin
    precdefault = 256
    prec = 64

    @testset "precision: $T" for T in
                                 (Arf, Arb, Acb, ArbPoly, ArbSeries, AcbPoly, AcbSeries)
        @test precision(T()) == precdefault
        @test precision(T(prec = prec)) == prec

        @test precision(Arblib.cstruct(T())) == precdefault
        @test precision(Arblib.cstruct(T(prec = prec))) == precdefault

        @test precision(T) == precdefault
        @test precision(Arblib.cstructtype(T)) == precdefault
        @test precision(Ptr{Arblib.cstructtype(T)}) == precdefault

        if T in [ArbPoly, ArbSeries, AcbPoly, AcbSeries]
            @test precision(T()[0]) == precdefault
            @test precision(T(prec = prec)[0]) == prec
        end
    end

    @testset "setprecision: $T" for T in
                                    (Arf, Arb, Acb, ArbPoly, ArbSeries, AcbPoly, AcbSeries)
        x = T()
        @test precision(x) == precdefault

        y = setprecision(x, prec)
        @test precision(y) == prec
        @test isequal(x, y)

        if T in [Arf, Arb, Acb]
            Arblib.set!(y, 2)
            @test !isequal(x, y)
        elseif T in [ArbPoly, ArbSeries, AcbPoly, AcbSeries]
            @test precision(y[0]) == prec
            y[0] = eltype(T)(2)
            @test !isequal(x, y)
        end
    end

    @testset "setprecision 2" begin
        x = Arb("0.1")
        @test precision(x) == 256
        @test precision(Arb) == 256
        @test string(x) ==
              "[0.1000000000000000000000000000000000000000000000000000000000000000000000000000 +/- 1.95e-78]"

        setprecision(Arb, 64)
        @test precision(x) == 256
        @test precision(Arb) == 64
        y = Arb("0.1")
        @test precision(y) == 64
        @test string(y) == "[0.100000000000000000 +/- 1.22e-20]"

        setprecision(Arb, 256)
    end

    @testset "precision change: $T" for T in
                                        [ArbMatrix, ArbRefMatrix, AcbMatrix, AcbRefMatrix]
        A = T(3, 3; prec = 96)
        @test precision(A) == 96
        @test precision(A[1, 1]) == 96
        B = setprecision(A, 128)
        @test precision(B) == 128
        @test precision(B[1, 1]) == 128
        A[1, 1][] = 1
        @test A[1, 1] == B[1, 1]
    end
end
