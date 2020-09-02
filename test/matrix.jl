@testset "Matrix: $TRef" for (TMat, T, TRef) in [
    (ArbMatrix, Arb, Arb),
    (AcbMatrix, Acb, Acb),
    (ArbRefMatrix, Arb, ArbRef),
    (AcbRefMatrix, Acb, AcbRef),
]
    @testset "Basic" begin
        M = TMat(4, 4, prec = 128)
        @test size(M) == (4, 4)
        @test precision(M) == 128

        x = T(1.5)
        M[2, 2] = x
        @test M[2, 2] == x
        @test M[2, 2] isa TRef
        @test precision(M[2, 2]) == 128

        Arblib.add!(M, M, M)
        M2 = TMat(4, 4, prec = 128)
        M2[2, 2] = T(3)
        @test M == M2

        A = TMat([T(i + j) for i = 1:4, j = 1:4])
        @test A[4, 4] == T(8)
        A = TMat([i + j for i = 1:4, j = 1:4])
        @test A[4, 4] == T(8)
        @test precision(A) == precision(T(8))

        @test ref(A, 3, 3) isa Union{ArbRef,AcbRef}
    end
    @testset "LinearAlgebra" begin
        A = TMat(rand(3, 3))
        b = TMat(rand(3))
        c = TMat(3, 1)

        # lu factorization
        ldiv!(c, A, b)
        c′ = A \ b
        @test Arblib.overlaps(c, c′) == 1
        ldiv!(c, lu(A), b)
        @test Arblib.overlaps(c, c′) == 1
        ldiv!(c, lu!(copy(A)), b)
        @test Arblib.overlaps(c, c′) == 1
        d = copy(b)
        ldiv!(lu(A), d)
        @test Arblib.overlaps(d, c′) == 1

        # inv
        id = copy(A)
        Arblib.one!(id)
        @test Bool(Arblib.contains(inv(A) * A, id))

        # mul
        A = TMat(rand(3, 2))
        B = TMat(rand(2, 4))
        B_wrong = TMat(rand(3, 4))
        C = TMat(3, 4)
        @test_throws DimensionMismatch("Matrix sizes are not compatible.") A * B_wrong
        LinearAlgebra.mul!(C, A, B)
        @test C == A * B
    end

    @testset "indexing" begin
        A = ArbMatrix(3, 1)
        A[3, 1][] = 4
        @test A[3] == A[3, 1]
        B = ArbMatrix(reshape(1:15, 3, 5))
        @test B[1:15] == 1:15
        C = ArbMatrix(reshape(1:15, 5, 3))
        @test C[1:15] == 1:15
    end
end
