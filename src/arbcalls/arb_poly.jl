###
### **arb_poly.h** -- polynomials over the real numbers
###

### Types, macros and constants

### Memory management
arbcall"void arb_poly_init(arb_poly_t poly)"
arbcall"void arb_poly_clear(arb_poly_t poly)"
arbcall"void arb_poly_fit_length(arb_poly_t poly, slong len)"
arbcall"void _arb_poly_set_length(arb_poly_t poly, slong len)"
arbcall"void _arb_poly_normalise(arb_poly_t poly)"
arbcall"slong arb_poly_allocated_bytes(const arb_poly_t x)"

### Basic manipulation
#mo arbcall"slong arb_poly_length(const arb_poly_t poly)" # clashes with Base.length
arbcall"slong arb_poly_degree(const arb_poly_t poly)"
arbcall"int arb_poly_is_zero(const arb_poly_t poly)"
arbcall"int arb_poly_is_one(const arb_poly_t poly)"
arbcall"int arb_poly_is_x(const arb_poly_t poly)"
arbcall"void arb_poly_zero(arb_poly_t poly)"
arbcall"void arb_poly_one(arb_poly_t poly)"
arbcall"void arb_poly_set(arb_poly_t dest, const arb_poly_t src)"
arbcall"void arb_poly_set_round(arb_poly_t dest, const arb_poly_t src, slong prec)"
arbcall"void arb_poly_set_trunc(arb_poly_t dest, const arb_poly_t src, slong n)"
arbcall"void arb_poly_set_trunc_round(arb_poly_t dest, const arb_poly_t src, slong n, slong prec)"
arbcall"void arb_poly_set_coeff_si(arb_poly_t poly, slong n, slong c)"
arbcall"void arb_poly_set_coeff_arb(arb_poly_t poly, slong n, const arb_t c)"
arbcall"void arb_poly_get_coeff_arb(arb_t v, const arb_poly_t poly, slong n)"
arbcall"void _arb_poly_shift_right(arb_ptr res, arb_srcptr poly, slong len, slong n)"
arbcall"void arb_poly_shift_right(arb_poly_t res, const arb_poly_t poly, slong n)"
arbcall"void _arb_poly_shift_left(arb_ptr res, arb_srcptr poly, slong len, slong n)"
arbcall"void arb_poly_shift_left(arb_poly_t res, const arb_poly_t poly, slong n)"
arbcall"void arb_poly_truncate(arb_poly_t poly, slong n)"
arbcall"slong arb_poly_valuation(const arb_poly_t poly)"

### Conversions
#ni arbcall"void arb_poly_set_fmpz_poly(arb_poly_t poly, const fmpz_poly_t src, slong prec)"
#ni arbcall"void arb_poly_set_fmpq_poly(arb_poly_t poly, const fmpq_poly_t src, slong prec)"
arbcall"void arb_poly_set_si(arb_poly_t poly, slong src)"

### Input and output
arbcall"void arb_poly_printd(const arb_poly_t poly, slong digits)"
#ns arbcall"void arb_poly_fprintd(FILE * file, const arb_poly_t poly, slong digits)"

### Random generation
#ns arbcall"void arb_poly_randtest(arb_poly_t poly, flint_rand_t state, slong len, slong prec, slong mag_bits)"

### Comparisons
arbcall"int arb_poly_contains(const arb_poly_t poly1, const arb_poly_t poly2)"
#ni arbcall"int arb_poly_contains_fmpz_poly(const arb_poly_t poly1, const fmpz_poly_t poly2)"
#ni arbcall"int arb_poly_contains_fmpq_poly(const arb_poly_t poly1, const fmpq_poly_t poly2)"
arbcall"int arb_poly_equal(const arb_poly_t A, const arb_poly_t B)"
arbcall"int _arb_poly_overlaps(arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2)"
arbcall"int arb_poly_overlaps(const arb_poly_t poly1, const arb_poly_t poly2)"
#ni arbcall"int arb_poly_get_unique_fmpz_poly(fmpz_poly_t z, const arb_poly_t x)"

### Bounds
arbcall"void _arb_poly_majorant(arb_ptr res, arb_srcptr poly, slong len, slong prec)"
arbcall"void arb_poly_majorant(arb_poly_t res, const arb_poly_t poly, slong prec)"

### Arithmetic
#mo arbcall"void _arb_poly_add(arb_ptr C, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong prec)" # clashes with _arb_vec_add
arbcall"void arb_poly_add(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong prec)"
arbcall"void arb_poly_add_si(arb_poly_t C, const arb_poly_t A, slong B, slong prec)"
#mo arbcall"void _arb_poly_sub(arb_ptr C, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong prec)" # clashes with _arb_vec_sub
arbcall"void arb_poly_sub(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong prec)"
arbcall"void arb_poly_add_series(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong len, slong prec)"
arbcall"void arb_poly_sub_series(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong len, slong prec)"
arbcall"void arb_poly_neg(arb_poly_t C, const arb_poly_t A)"
arbcall"void arb_poly_scalar_mul_2exp_si(arb_poly_t C, const arb_poly_t A, slong c)"
arbcall"void arb_poly_scalar_mul(arb_poly_t C, const arb_poly_t A, const arb_t c, slong prec)"
arbcall"void arb_poly_scalar_div(arb_poly_t C, const arb_poly_t A, const arb_t c, slong prec)"
arbcall"void _arb_poly_mullow_classical(arb_ptr C, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong n, slong prec)"
arbcall"void _arb_poly_mullow_block(arb_ptr C, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong n, slong prec)"
arbcall"void _arb_poly_mullow(arb_ptr C, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong n, slong prec)"
arbcall"void arb_poly_mullow_classical(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong n, slong prec)"
arbcall"void arb_poly_mullow_ztrunc(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong n, slong prec)"
arbcall"void arb_poly_mullow_block(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong n, slong prec)"
arbcall"void arb_poly_mullow(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong n, slong prec)"
arbcall"void _arb_poly_mul(arb_ptr C, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong prec)"
arbcall"void arb_poly_mul(arb_poly_t C, const arb_poly_t A, const arb_poly_t B, slong prec)"
arbcall"void _arb_poly_inv_series(arb_ptr Q, arb_srcptr A, slong Alen, slong len, slong prec)"
arbcall"void arb_poly_inv_series(arb_poly_t Q, const arb_poly_t A, slong n, slong prec)"
arbcall"void _arb_poly_div_series(arb_ptr Q, arb_srcptr A, slong Alen, arb_srcptr B, slong Blen, slong n, slong prec)"
arbcall"void arb_poly_div_series(arb_poly_t Q, const arb_poly_t A, const arb_poly_t B, slong n, slong prec)"
arbcall"void _arb_poly_div(arb_ptr Q, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong prec)"
arbcall"void _arb_poly_rem(arb_ptr R, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong prec)"
arbcall"void _arb_poly_divrem(arb_ptr Q, arb_ptr R, arb_srcptr A, slong lenA, arb_srcptr B, slong lenB, slong prec)"
arbcall"int arb_poly_divrem(arb_poly_t Q, arb_poly_t R, const arb_poly_t A, const arb_poly_t B, slong prec)"
arbcall"void _arb_poly_div_root(arb_ptr Q, arb_t R, arb_srcptr A, slong len, const arb_t c, slong prec)"

### Composition
arbcall"void _arb_poly_taylor_shift_horner(arb_ptr g, const arb_t c, slong n, slong prec)"
arbcall"void arb_poly_taylor_shift_horner(arb_poly_t g, const arb_poly_t f, const arb_t c, slong prec)"
arbcall"void _arb_poly_taylor_shift_divconquer(arb_ptr g, const arb_t c, slong n, slong prec)"
arbcall"void arb_poly_taylor_shift_divconquer(arb_poly_t g, const arb_poly_t f, const arb_t c, slong prec)"
arbcall"void _arb_poly_taylor_shift_convolution(arb_ptr g, const arb_t c, slong n, slong prec)"
arbcall"void arb_poly_taylor_shift_convolution(arb_poly_t g, const arb_poly_t f, const arb_t c, slong prec)"
arbcall"void _arb_poly_taylor_shift(arb_ptr g, const arb_t c, slong n, slong prec)"
arbcall"void arb_poly_taylor_shift(arb_poly_t g, const arb_poly_t f, const arb_t c, slong prec)"
arbcall"void _arb_poly_compose_horner(arb_ptr res, arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2, slong prec)"
arbcall"void arb_poly_compose_horner(arb_poly_t res, const arb_poly_t poly1, const arb_poly_t poly2, slong prec)"
arbcall"void _arb_poly_compose_divconquer(arb_ptr res, arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2, slong prec)"
arbcall"void arb_poly_compose_divconquer(arb_poly_t res, const arb_poly_t poly1, const arb_poly_t poly2, slong prec)"
arbcall"void _arb_poly_compose(arb_ptr res, arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2, slong prec)"
arbcall"void arb_poly_compose(arb_poly_t res, const arb_poly_t poly1, const arb_poly_t poly2, slong prec)"
arbcall"void _arb_poly_compose_series_horner(arb_ptr res, arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2, slong n, slong prec)"
arbcall"void arb_poly_compose_series_horner(arb_poly_t res, const arb_poly_t poly1, const arb_poly_t poly2, slong n, slong prec)"
arbcall"void _arb_poly_compose_series_brent_kung(arb_ptr res, arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2, slong n, slong prec)"
arbcall"void arb_poly_compose_series_brent_kung(arb_poly_t res, const arb_poly_t poly1, const arb_poly_t poly2, slong n, slong prec)"
arbcall"void _arb_poly_compose_series(arb_ptr res, arb_srcptr poly1, slong len1, arb_srcptr poly2, slong len2, slong n, slong prec)"
arbcall"void arb_poly_compose_series(arb_poly_t res, const arb_poly_t poly1, const arb_poly_t poly2, slong n, slong prec)"
arbcall"void _arb_poly_revert_series_lagrange(arb_ptr h, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_revert_series_lagrange(arb_poly_t h, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_revert_series_newton(arb_ptr h, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_revert_series_newton(arb_poly_t h, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_revert_series_lagrange_fast(arb_ptr h, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_revert_series_lagrange_fast(arb_poly_t h, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_revert_series(arb_ptr h, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_revert_series(arb_poly_t h, const arb_poly_t f, slong n, slong prec)"

### Evaluation
arbcall"void _arb_poly_evaluate_horner(arb_t y, arb_srcptr f, slong len, const arb_t x, slong prec)"
arbcall"void arb_poly_evaluate_horner(arb_t y, const arb_poly_t f, const arb_t x, slong prec)"
arbcall"void _arb_poly_evaluate_rectangular(arb_t y, arb_srcptr f, slong len, const arb_t x, slong prec)"
arbcall"void arb_poly_evaluate_rectangular(arb_t y, const arb_poly_t f, const arb_t x, slong prec)"
arbcall"void _arb_poly_evaluate(arb_t y, arb_srcptr f, slong len, const arb_t x, slong prec)"
arbcall"void arb_poly_evaluate(arb_t y, const arb_poly_t f, const arb_t x, slong prec)"
arbcall"void _arb_poly_evaluate_acb_horner(acb_t y, arb_srcptr f, slong len, const acb_t x, slong prec)"
arbcall"void arb_poly_evaluate_acb_horner(acb_t y, const arb_poly_t f, const acb_t x, slong prec)"
arbcall"void _arb_poly_evaluate_acb_rectangular(acb_t y, arb_srcptr f, slong len, const acb_t x, slong prec)"
arbcall"void arb_poly_evaluate_acb_rectangular(acb_t y, const arb_poly_t f, const acb_t x, slong prec)"
arbcall"void _arb_poly_evaluate_acb(acb_t y, arb_srcptr f, slong len, const acb_t x, slong prec)"
arbcall"void arb_poly_evaluate_acb(acb_t y, const arb_poly_t f, const acb_t x, slong prec)"
arbcall"void _arb_poly_evaluate2_horner(arb_t y, arb_t z, arb_srcptr f, slong len, const arb_t x, slong prec)"
arbcall"void arb_poly_evaluate2_horner(arb_t y, arb_t z, const arb_poly_t f, const arb_t x, slong prec)"
arbcall"void _arb_poly_evaluate2_rectangular(arb_t y, arb_t z, arb_srcptr f, slong len, const arb_t x, slong prec)"
arbcall"void arb_poly_evaluate2_rectangular(arb_t y, arb_t z, const arb_poly_t f, const arb_t x, slong prec)"
arbcall"void _arb_poly_evaluate2(arb_t y, arb_t z, arb_srcptr f, slong len, const arb_t x, slong prec)"
arbcall"void arb_poly_evaluate2(arb_t y, arb_t z, const arb_poly_t f, const arb_t x, slong prec)"
arbcall"void _arb_poly_evaluate2_acb_horner(acb_t y, acb_t z, arb_srcptr f, slong len, const acb_t x, slong prec)"
arbcall"void arb_poly_evaluate2_acb_horner(acb_t y, acb_t z, const arb_poly_t f, const acb_t x, slong prec)"
arbcall"void _arb_poly_evaluate2_acb_rectangular(acb_t y, acb_t z, arb_srcptr f, slong len, const acb_t x, slong prec)"
arbcall"void arb_poly_evaluate2_acb_rectangular(acb_t y, acb_t z, const arb_poly_t f, const acb_t x, slong prec)"
arbcall"void _arb_poly_evaluate2_acb(acb_t y, acb_t z, arb_srcptr f, slong len, const acb_t x, slong prec)"
arbcall"void arb_poly_evaluate2_acb(acb_t y, acb_t z, const arb_poly_t f, const acb_t x, slong prec)"

### Product trees
arbcall"void _arb_poly_product_roots(arb_ptr poly, arb_srcptr xs, slong n, slong prec)"
arbcall"void arb_poly_product_roots(arb_poly_t poly, arb_srcptr xs, slong n, slong prec)"
arbcall"void _arb_poly_product_roots_complex(arb_ptr poly, arb_srcptr r, slong rn, acb_srcptr c, slong cn, slong prec)"
arbcall"void arb_poly_product_roots_complex(arb_poly_t poly, arb_srcptr r, slong rn, acb_srcptr c, slong cn, slong prec)"
#ni arbcall"arb_ptr * _arb_poly_tree_alloc(slong len)"
#ni arbcall"void _arb_poly_tree_free(arb_ptr * tree, slong len)"
#ni arbcall"void _arb_poly_tree_build(arb_ptr * tree, arb_srcptr roots, slong len, slong prec)"

### Multipoint evaluation
arbcall"void _arb_poly_evaluate_vec_iter(arb_ptr ys, arb_srcptr poly, slong plen, arb_srcptr xs, slong n, slong prec)"
arbcall"void arb_poly_evaluate_vec_iter(arb_ptr ys, const arb_poly_t poly, arb_srcptr xs, slong n, slong prec)"
#ni arbcall"void _arb_poly_evaluate_vec_fast_precomp(arb_ptr vs, arb_srcptr poly, slong plen, arb_ptr * tree, slong len, slong prec)"
arbcall"void _arb_poly_evaluate_vec_fast(arb_ptr ys, arb_srcptr poly, slong plen, arb_srcptr xs, slong n, slong prec)"
arbcall"void arb_poly_evaluate_vec_fast(arb_ptr ys, const arb_poly_t poly, arb_srcptr xs, slong n, slong prec)"

### Interpolation
arbcall"void _arb_poly_interpolate_newton(arb_ptr poly, arb_srcptr xs, arb_srcptr ys, slong n, slong prec)"
arbcall"void arb_poly_interpolate_newton(arb_poly_t poly, arb_srcptr xs, arb_srcptr ys, slong n, slong prec)"
arbcall"void _arb_poly_interpolate_barycentric(arb_ptr poly, arb_srcptr xs, arb_srcptr ys, slong n, slong prec)"
arbcall"void arb_poly_interpolate_barycentric(arb_poly_t poly, arb_srcptr xs, arb_srcptr ys, slong n, slong prec)"
#ni arbcall"void _arb_poly_interpolation_weights(arb_ptr w, arb_ptr * tree, slong len, slong prec)"
#ni arbcall"void _arb_poly_interpolate_fast_precomp(arb_ptr poly, arb_srcptr ys, arb_ptr * tree, arb_srcptr weights, slong len, slong prec)"
arbcall"void _arb_poly_interpolate_fast(arb_ptr poly, arb_srcptr xs, arb_srcptr ys, slong len, slong prec)"
arbcall"void arb_poly_interpolate_fast(arb_poly_t poly, arb_srcptr xs, arb_srcptr ys, slong n, slong prec)"

### Differentiation
arbcall"void _arb_poly_derivative(arb_ptr res, arb_srcptr poly, slong len, slong prec)"
arbcall"void arb_poly_derivative(arb_poly_t res, const arb_poly_t poly, slong prec)"
arbcall"void _arb_poly_integral(arb_ptr res, arb_srcptr poly, slong len, slong prec)"
arbcall"void arb_poly_integral(arb_poly_t res, const arb_poly_t poly, slong prec)"

### Transforms
arbcall"void _arb_poly_borel_transform(arb_ptr res, arb_srcptr poly, slong len, slong prec)"
arbcall"void arb_poly_borel_transform(arb_poly_t res, const arb_poly_t poly, slong prec)"
arbcall"void _arb_poly_inv_borel_transform(arb_ptr res, arb_srcptr poly, slong len, slong prec)"
arbcall"void arb_poly_inv_borel_transform(arb_poly_t res, const arb_poly_t poly, slong prec)"
arbcall"void _arb_poly_binomial_transform_basecase(arb_ptr b, arb_srcptr a, slong alen, slong len, slong prec)"
arbcall"void arb_poly_binomial_transform_basecase(arb_poly_t b, const arb_poly_t a, slong len, slong prec)"
arbcall"void _arb_poly_binomial_transform_convolution(arb_ptr b, arb_srcptr a, slong alen, slong len, slong prec)"
arbcall"void arb_poly_binomial_transform_convolution(arb_poly_t b, const arb_poly_t a, slong len, slong prec)"
arbcall"void _arb_poly_binomial_transform(arb_ptr b, arb_srcptr a, slong alen, slong len, slong prec)"
arbcall"void arb_poly_binomial_transform(arb_poly_t b, const arb_poly_t a, slong len, slong prec)"

### Powers and elementary functions
arbcall"void _arb_poly_pow_ui_trunc_binexp(arb_ptr res, arb_srcptr f, slong flen, ulong exp, slong len, slong prec)"
arbcall"void arb_poly_pow_ui_trunc_binexp(arb_poly_t res, const arb_poly_t poly, ulong exp, slong len, slong prec)"
arbcall"void _arb_poly_pow_ui(arb_ptr res, arb_srcptr f, slong flen, ulong exp, slong prec)"
arbcall"void arb_poly_pow_ui(arb_poly_t res, const arb_poly_t poly, ulong exp, slong prec)"
arbcall"void _arb_poly_pow_series(arb_ptr h, arb_srcptr f, slong flen, arb_srcptr g, slong glen, slong len, slong prec)"
arbcall"void arb_poly_pow_series(arb_poly_t h, const arb_poly_t f, const arb_poly_t g, slong len, slong prec)"
arbcall"void _arb_poly_pow_arb_series(arb_ptr h, arb_srcptr f, slong flen, const arb_t g, slong len, slong prec)"
arbcall"void arb_poly_pow_arb_series(arb_poly_t h, const arb_poly_t f, const arb_t g, slong len, slong prec)"
arbcall"void _arb_poly_sqrt_series(arb_ptr g, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sqrt_series(arb_poly_t g, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_rsqrt_series(arb_ptr g, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_rsqrt_series(arb_poly_t g, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_log_series(arb_ptr res, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_log_series(arb_poly_t res, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_log1p_series(arb_ptr res, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_log1p_series(arb_poly_t res, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_atan_series(arb_ptr res, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_atan_series(arb_poly_t res, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_asin_series(arb_ptr res, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_asin_series(arb_poly_t res, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_acos_series(arb_ptr res, arb_srcptr f, slong flen, slong n, slong prec)"
arbcall"void arb_poly_acos_series(arb_poly_t res, const arb_poly_t f, slong n, slong prec)"
arbcall"void _arb_poly_exp_series_basecase(arb_ptr f, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_exp_series_basecase(arb_poly_t f, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_exp_series(arb_ptr f, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_exp_series(arb_poly_t f, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sin_cos_series_basecase(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec, int times_pi)"
arbcall"void arb_poly_sin_cos_series_basecase(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec, int times_pi)"
arbcall"void _arb_poly_sin_cos_series_tangent(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec, int times_pi)"
arbcall"void arb_poly_sin_cos_series_tangent(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec, int times_pi)"
arbcall"void _arb_poly_sin_cos_series(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sin_cos_series(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sin_series(arb_ptr s, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sin_series(arb_poly_t s, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_cos_series(arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_cos_series(arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_tan_series(arb_ptr g, arb_srcptr h, slong hlen, slong len, slong prec)"
arbcall"void arb_poly_tan_series(arb_poly_t g, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sin_cos_pi_series(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sin_cos_pi_series(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sin_pi_series(arb_ptr s, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sin_pi_series(arb_poly_t s, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_cos_pi_series(arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_cos_pi_series(arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_cot_pi_series(arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_cot_pi_series(arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sinh_cosh_series_basecase(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sinh_cosh_series_basecase(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sinh_cosh_series_exponential(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sinh_cosh_series_exponential(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sinh_cosh_series(arb_ptr s, arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sinh_cosh_series(arb_poly_t s, arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sinh_series(arb_ptr s, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sinh_series(arb_poly_t s, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_cosh_series(arb_ptr c, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_cosh_series(arb_poly_t c, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sinc_series(arb_ptr s, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sinc_series(arb_poly_t s, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_sinc_pi_series(arb_ptr s, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_sinc_pi_series(arb_poly_t s, const arb_poly_t h, slong n, slong prec)"

### Lambert W function
arbcall"void _arb_poly_lambertw_series(arb_ptr res, arb_srcptr z, slong zlen, int flags, slong len, slong prec)"
arbcall"void arb_poly_lambertw_series(arb_poly_t res, const arb_poly_t z, int flags, slong len, slong prec)"

### Gamma function and factorials
arbcall"void _arb_poly_gamma_series(arb_ptr res, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_gamma_series(arb_poly_t res, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_rgamma_series(arb_ptr res, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_rgamma_series(arb_poly_t res, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_lgamma_series(arb_ptr res, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_lgamma_series(arb_poly_t res, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_digamma_series(arb_ptr res, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_digamma_series(arb_poly_t res, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_rising_ui_series(arb_ptr res, arb_srcptr f, slong flen, ulong r, slong trunc, slong prec)"
arbcall"void arb_poly_rising_ui_series(arb_poly_t res, const arb_poly_t f, ulong r, slong trunc, slong prec)"

### Zeta function
arbcall"void arb_poly_zeta_series(arb_poly_t res, const arb_poly_t s, const arb_t a, int deflate, slong n, slong prec)"
arbcall"void _arb_poly_riemann_siegel_theta_series(arb_ptr res, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_riemann_siegel_theta_series(arb_poly_t res, const arb_poly_t h, slong n, slong prec)"
arbcall"void _arb_poly_riemann_siegel_z_series(arb_ptr res, arb_srcptr h, slong hlen, slong n, slong prec)"
arbcall"void arb_poly_riemann_siegel_z_series(arb_poly_t res, const arb_poly_t h, slong n, slong prec)"

### Root-finding
arbcall"void _arb_poly_root_bound_fujiwara(mag_t bound, arb_srcptr poly, slong len)"
arbcall"void arb_poly_root_bound_fujiwara(mag_t bound, arb_poly_t poly)"
arbcall"void _arb_poly_newton_convergence_factor(arf_t convergence_factor, arb_srcptr poly, slong len, const arb_t convergence_interval, slong prec)"
arbcall"int _arb_poly_newton_step(arb_t xnew, arb_srcptr poly, slong len, const arb_t x, const arb_t convergence_interval, const arf_t convergence_factor, slong prec)"
arbcall"void _arb_poly_newton_refine_root(arb_t r, arb_srcptr poly, slong len, const arb_t start, const arb_t convergence_interval, const arf_t convergence_factor, slong eval_extra_prec, slong prec)"

### Other special polynomials
arbcall"void _arb_poly_swinnerton_dyer_ui(arb_ptr poly, ulong n, slong trunc, slong prec)"
arbcall"void arb_poly_swinnerton_dyer_ui(arb_poly_t poly, ulong n, slong prec)"
