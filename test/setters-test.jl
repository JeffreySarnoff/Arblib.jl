@testset "setters" begin
    @testset "Mag" begin
        @test π <
              Float64(Arblib.set!(Mag(), π)) ==
              Float64(Arblib.set!(Arblib.radref(Arb()), π)) ==
              Float64(Arblib.set!(Arblib.mag_struct(), π)) <
              3.15
    end

    @testset "Arb" begin
        @test Arblib.set!(Arb(), BigFloat(1.0)) == one(Arb)
        @test Arblib.set!(Arblib.realref(Acb()), BigFloat(1.0)) == one(Arb)
        @test Arblib.equal(Arblib.set!(Arblib.arb_struct(), BigFloat(1.0)), one(Arb))
        @test Arblib.set!(Arb(), one(Mag)) == one(Arb)
        @test Arblib.set!(Arblib.realref(Acb()), one(Mag)) == one(Arb)
        @test Arblib.equal(Arblib.set!(Arblib.arb_struct(), one(Mag).mag), one(Arb))

        @test Arblib.set!(Arb(), 1 // 2) == one(Arb) / 2
        @test Arblib.set!(Arblib.realref(Acb()), 1 // 2) == one(Arb) / 2
        @test Arblib.equal(Arblib.set!(Arblib.arb_struct(), 1 // 2), one(Arb) / 2)

        @test Arb(3) < Arblib.set!(Arb(), π) < Arb(4)
        @test Arblib.equal(Arblib.set!(Arb(), π), Arblib.set!(Arblib.realref(Acb()), π))
        @test Arblib.equal(Arblib.set!(Arb(), π), Arblib.set!(Arblib.arb_struct(), π))

        @test Arb(2) < Arblib.set!(Arb(), ℯ) < Arb(3)
        @test Arblib.equal(Arblib.set!(Arb(), ℯ), Arblib.set!(Arblib.realref(Acb()), ℯ))
        @test Arblib.equal(Arblib.set!(Arb(), ℯ), Arblib.set!(Arblib.arb_struct(), ℯ))

        @test Arb(0) < Arblib.set!(Arb(), MathConstants.γ) < Arb(1)
        @test Arblib.equal(
            Arblib.set!(Arb(), MathConstants.γ),
            Arblib.set!(Arblib.realref(Acb()), MathConstants.γ),
        )
        @test Arblib.equal(
            Arblib.set!(Arb(), MathConstants.γ),
            Arblib.set!(Arblib.arb_struct(), MathConstants.γ),
        )

        @test Arb(0) < Arblib.set!(Arb(), MathConstants.catalan) < Arb(1)
        @test Arblib.equal(
            Arblib.set!(Arb(), MathConstants.catalan),
            Arblib.set!(Arblib.realref(Acb()), MathConstants.catalan),
        )
        @test Arblib.equal(
            Arblib.set!(Arb(), MathConstants.catalan),
            Arblib.set!(Arblib.arb_struct(), MathConstants.catalan),
        )

        @test Arblib.overlaps(
            Arb(BigFloat(MathConstants.φ)),
            Arblib.set!(Arb(), MathConstants.φ),
        )
        @test Arblib.equal(
            Arblib.set!(Arb(), MathConstants.φ),
            Arblib.set!(Arblib.realref(Acb()), MathConstants.φ),
        )
        @test Arblib.equal(
            Arblib.set!(Arb(), MathConstants.φ),
            Arblib.set!(Arblib.arb_struct(), MathConstants.φ),
        )
    end

    @testset "Acb" begin
        @test Arblib.set!(Acb(), BigFloat(1.0)) == one(Acb)
        @test Arblib.equal(Arblib.set!(Arblib.acb_struct(), BigFloat(1.0)), one(Acb))
        x = Arblib.set!(Acb(), ℯ)
        @test isequal(Arblib.realref(x), Arb(ℯ))
        @test Arblib.imagref(x) == zero(Arb)
        @test Arblib.equal(Arblib.set!(Arblib.acb_struct(), BigFloat(1.0)), one(Acb))
        @test Arblib.set!(Acb(), one(Arf).arf) == one(Acb)
        @test Arblib.equal(Arblib.set!(Arblib.acb_struct(), one(Arf).arf), one(Acb))
        @test Arblib.set!(Acb(0, 5), BigFloat(1.0)) == one(Acb)

        @test Arblib.set!(Acb(), BigFloat(1.0), 2) == Acb(1, 2)
        x = Arblib.set!(Acb(), π, Arf(4))
        @test isequal(Arblib.realref(x), Arb(π))
        @test isequal(Arblib.imagref(x), Arb(4))
        @test Arblib.set!(Acb(), Arb(1), Arf(2)) == Acb(1, 2)
        @test Arblib.set!(Acb(), Arb(1).arb, Arf(2).arf) == Acb(1, 2)

        @test Arblib.set!(Acb(), Complex(1, 2)) == Acb(1, 2)
        @test Arblib.set!(Acb(), Complex(BigFloat(1), BigFloat(2))) == Acb(1, 2)
        @test Arblib.equal(Arblib.set!(Arblib.acb_struct(), Complex(1, 2)), Acb(1, 2))

        x = Arblib.set!(Acb(), π)
        @test isequal(Arblib.realref(x), Arb(π))
        @test Arblib.imagref(x) == zero(Arb)
        x = Arblib.set!(Arblib.acb_struct(), π)
        @test Arblib.equal(Arblib.realref(x), Arb(π))
        @test Arblib.equal(Arblib.imagref(x), zero(Arb))
    end

    @testset "Set Rational" begin
        z = Arb(prec = 64)
        z[] = 1 // 2
        @test z == 0.5

        z = Acb(prec = 64)
        z[] = 1 // 2
        @test z == 0.5

        z = Acb(prec = 64)
        z[] = 1 // 2 + 3 // 4 * im
        @test z == 0.5 + 0.75im
    end
end
