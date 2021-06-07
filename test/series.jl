@testset "Series: $TSeries" for (TSeries, T) in [(ArbSeries, Arb), (AcbSeries, Acb)]
    @testset "Length and degree" begin
        for (p, l) in [
            (zero(TSeries), 1),
            (one(TSeries), 1),
            (TSeries(T[0, 1, 0]), 3),
            (TSeries(T[0, 1], degree = 4), 5),
        ]
            @test firstindex(p) == 0
            @test size(p) == ()
            @test size(p, 1) == 1
            @test length(p) == Arblib.degree(p) + 1 == lastindex(p) + 1 == l
        end
    end

    @testset "Get and set coefficients" begin
        @test eltype(TSeries()) == T

        p = TSeries(T[i for i = 0:10])

        @test firstindex(p) == 0
        @test lastindex(p) == 10
        @test lastindex(TSeries(degree = 5)) == 5

        @test Arblib.coeffs(p) == p[:] == 0:10

        @test all(p[i] == i for i = 0:10)

        p[3] = T(7)
        @test p[3] == 7
        p[4] = 8
        @test p[4] == 8
        p[5] = π
        @test isequal(p[5], T(π))
        if T == Arb
            p[6] = ArbRefVector(T[9])[1]
        else
            p[6] = AcbRefVector(T[9])[1]
        end
        @test p[6] == 9

        q = TSeries(prec = 512)
        q[0] = π
        @test Arblib.rel_accuracy_bits(q[0]) > 500

        @test_throws BoundsError p[-1]
        @test_throws BoundsError p[11]
    end

    @testset "Constructors" begin
        @test TSeries() == TSeries(T[0]) == zero(TSeries) == zero(TSeries())
        @test TSeries(degree = 3) ==
              TSeries(T(0), degree = 3) ==
              TSeries(T[0], degree = 3) ==
              zero(TSeries(degree = 3))
        @test TSeries(T[1]) == one(TSeries) == one(TSeries())
        @test Arblib.isx(TSeries(T[0, 1]))
        @test TSeries(T[1, 2, 0]) != TSeries(T[1, 2])
        @test TSeries([5.0]) == TSeries([5]) == TSeries(T[5])

        @test precision(TSeries(degree = 1, prec = 64)) == 64
        @test precision(TSeries(0, degree = 1, prec = 64)) == 64
        @test precision(TSeries([0], prec = 64)) == 64
        @test precision(zero(TSeries(degree = 1, prec = 64))) == 64
        @test precision(one(TSeries(degree = 1, prec = 64))) == 64

        if TSeries == AcbSeries
            @test TSeries(ArbSeries([1, 2])) == TSeries([1, 2])
            @test Arblib.degree(TSeries(ArbSeries(degree = 4))) == 4
            @test precision(TSeries(ArbSeries(prec = 64))) == 64
        end
    end

    @testset "Arithmetic" begin
        p = TSeries([1, 2, 3])
        q = TSeries([2, 3, 4])

        @test p + q == TSeries([3, 5, 7])
        @test p - q == TSeries([-1, -1, -1])
        @test p * q == TSeries([2, 7, 16])
        @test q / p == TSeries([2, -1, 0])

        @test -p == TSeries([-1, -2, -3])

        @test inv(p) == TSeries([1, -2, 1])

        let p = setprecision(p, 80), q = setprecision(q, 90)
            @test precision(p + q) == 90
            @test precision(p - q) == 90
            @test precision(p * q) == 90
            @test precision(p / q) == 90
            @test precision(-p) == 80
            @test precision(inv(p)) == 80
        end

        if TSeries == AcbSeries
            q = ArbSeries([2, 3, 4])
            @test p + q == q + p == TSeries([3, 5, 7])
            @test p - q == TSeries([-1, -1, -1])
            @test q - p == TSeries([1, 1, 1])
            @test p * q == q * p == TSeries([2, 7, 16])
            @test p / ArbSeries(1, degree = 2) == p
            @test q / AcbSeries(1, degree = 2) == AcbSeries(q)
        end
    end

    @testset "Scalar arithmetic" begin
        p = TSeries([1, 2, 3])

        @test p + T(2) ==
              T(2) + p ==
              p + 2 ==
              2 + p ==
              p + 2.0 ==
              2.0 + p ==
              TSeries([3, 2, 3])
        @test p - T(2) == p - 2 == p - 2.0 == TSeries([-1, 2, 3])
        @test T(2) - p == 2 - p == 2.0 - p == TSeries([1, -2, -3])
        @test p * T(2) ==
              T(2) * p ==
              p * 2 ==
              2 * p ==
              p * 2.0 ==
              2.0 * p ==
              TSeries([2, 4, 6])
        @test p / T(2) == p / 2 == p / 2.0 == TSeries([0.5, 1, 1.5])
        @test T(2) / p == 2 / p == 2.0 / p == TSeries([2, -4, 2])

        # TODO: Take precision of series into account when
        # converting? So that these tests would pass.
        #let p = setprecision(p, 512)
        #    @test Arblib.rel_accuracy_bits((p + π)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((π + p)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((p - π)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((π - p)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((p * π)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((π * p)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((p / π)[0]) > 500
        #    @test Arblib.rel_accuracy_bits((π / p)[0]) > 500
        #end

        let p = setprecision(p, 80)
            @test precision(p + T(2)) ==
                  precision(T(2) + p) ==
                  precision(2 + p) ==
                  precision(p + 2) ==
                  80
            @test precision(p - T(2)) == precision(p - 2) == 80
            @test precision(T(2) - p) == precision(2 - p) == 80
            @test precision(p * T(2)) ==
                  precision(T(2) * p) ==
                  precision(2 * p) ==
                  precision(p * 2) ==
                  80
            @test precision(p / T(2)) == precision(p / 2) == 80
            @test precision(T(2) / p) == precision(2 / p) == 80
        end

        if TSeries == AcbSeries
            @test p + Arb(2) == Arb(2) + p == TSeries([3, 2, 3])
            @test p - Arb(2) == TSeries([-1, 2, 3])
            @test Arb(2) - p == TSeries([1, -2, -3])
            @test p * Arb(2) == Arb(2) * p == TSeries([2, 4, 6])
            @test p / Arb(2) == TSeries([0.5, 1, 1.5])
            @test Arb(2) / p == TSeries([2, -4, 2])
        end
    end

    @testset "Composition" begin
        p = TSeries([1, 2])
        q = TSeries([0, 3])

        @test Arblib.taylor_shift(p, T(2)) == Arblib.taylor_shift(p, 2) == TSeries([5, 2])
        @test Arblib.compose(p, q) == TSeries([1, 6])
        @test Arblib.revert(TSeries([0, 2])) == TSeries([0, 0.5])

        @test precision(Arblib.taylor_shift(setprecision(p, 80), T(2))) == 80
        @test precision(Arblib.compose(setprecision(p, 80), setprecision(q, 90))) == 90
        @test precision(Arblib.revert(TSeries([0, 2], prec = 80))) == 80

        @test_throws ArgumentError Arblib.compose(p, TSeries([1, 1]))
        @test_throws ArgumentError Arblib.revert(TSeries([0]))
        @test_throws ArgumentError Arblib.revert(TSeries([1, 1]))
        @test_throws ArgumentError Arblib.revert(TSeries([0, 0, 1]))
    end

    @testset "Evaluation" begin
        p = TSeries([1, 2, 3])

        @test p(Arb(2)) == p(2) == p(2.0) == 17
        @test p(Acb(1, 2)) == p(1 + 2im) == p(1.0 + 2.0im) == -6 + 16im

        @test Arblib.evaluate2(p, Arb(2)) == Arblib.evaluate2(p, 2) == (17, 14)
        @test Arblib.evaluate2(p, Acb(1, 2)) ==
              Arblib.evaluate2(p, 1 + 2im) ==
              (-6 + 16im, 8 + 12im)

        @test precision(p(T())) == precision(p(T(prec = 2precision(p)))) == precision(p)
        @test precision(TSeries(prec = 80)(T())) == 80
    end

    @testset "Differentiation and integration" begin
        p = TSeries([1, 2, 3])

        @test Arblib.derivative(p) == TSeries([2, 6])
        @test Arblib.integral(p) == TSeries([0, 1, 1, 1])

        @test precision(Arblib.derivative(p)) == precision(p)
        @test precision(Arblib.integral(p)) == precision(p)
        @test precision(Arblib.derivative(TSeries(prec = 80))) == 80
        @test precision(Arblib.integral(TSeries(prec = 80))) == 80

        @test Arblib.degree(Arblib.derivative(p)) == 1
        @test Arblib.degree(Arblib.integral(p)) == 3
    end

    @testset "Power methods" begin
        p = TSeries([1, 2, 3])
        q = TSeries([2, 3, 0])

        @test p^q == TSeries([1, 4, 16])

        @test p^T(2) == p^Int(2) == p^UInt(2) == p^2.0 == p^2 == TSeries([1, 4, 10])
        @test p^T(-1) == p^Int(-1) == p^-1.0 == p^-1 == TSeries([1, -2, 1])

        @test precision(setprecision(p, 80)^setprecision(q, 90)) == 90
        @test precision(setprecision(p, 80)^T(2)) == 80
    end

    @testset "Series methods" begin

    end
end
