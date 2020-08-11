###
### **acb.h** -- complex numbers
###

### Types, macros and constants

### Memory management
arbcall"void acb_init(acb_t x)"
arbcall"void acb_clear(acb_t x)"
# arbcall"acb_ptr _acb_vec_init(slong n)"
arbcall"void _acb_vec_clear(acb_ptr v, slong n)"
arbcall"slong acb_allocated_bytes(const acb_t x)"
arbcall"slong _acb_vec_allocated_bytes(acb_srcptr vec, slong len)"
# arbcall"double _acb_vec_estimate_allocated_bytes(slong len, slong prec)"

### Basic manipulation
arbcall"void acb_zero(acb_t z)"
arbcall"void acb_one(acb_t z)"
arbcall"void acb_onei(acb_t z)"
arbcall"void acb_set(acb_t z, const acb_t x)"
arbcall"void acb_set_ui(acb_t z, ulong x)"
arbcall"void acb_set_si(acb_t z, slong x)"
arbcall"void acb_set_d(acb_t z, double x)"
# arbcall"void acb_set_fmpz(acb_t z, const fmpz_t x)"
arbcall"void acb_set_arb(acb_t z, const arb_t c)"
arbcall"void acb_set_si_si(acb_t z, slong x, slong y)"
arbcall"void acb_set_d_d(acb_t z, double x, double y)"
# arbcall"void acb_set_fmpz_fmpz(acb_t z, const fmpz_t x, const fmpz_t y)"
arbcall"void acb_set_arb_arb(acb_t z, const arb_t x, const arb_t y)"
# arbcall"void acb_set_fmpq(acb_t z, const fmpq_t x, slong prec)"
arbcall"void acb_set_round(acb_t z, const acb_t x, slong prec)"
# arbcall"void acb_set_round_fmpz(acb_t z, const fmpz_t x, slong prec)"
arbcall"void acb_set_round_arb(acb_t z, const arb_t x, slong prec)"
arbcall"void acb_swap(acb_t z, acb_t x)"
arbcall"void acb_add_error_mag(acb_t x, const mag_t err)"
arbcall"void acb_get_mid(acb_t m, const acb_t x)"

### Input and output
# arbcall"void acb_print(const acb_t x)"
##arbcall"void acb_fprint(FILE * file, const acb_t x)"
arbcall"void acb_printd(const acb_t x, slong digits)"
##arbcall"void acb_fprintd(FILE * file, const acb_t x, slong digits)"
arbcall"void acb_printn(const acb_t x, slong digits, ulong flags)"
##arbcall"void acb_fprintn(FILE * file, const acb_t x, slong digits, ulong flags)"

### Random number generation
##arbcall"void acb_randtest(acb_t z, flint_rand_t state, slong prec, slong mag_bits)"
##arbcall"void acb_randtest_special(acb_t z, flint_rand_t state, slong prec, slong mag_bits)"
##arbcall"void acb_randtest_precise(acb_t z, flint_rand_t state, slong prec, slong mag_bits)"
##arbcall"void acb_randtest_param(acb_t z, flint_rand_t state, slong prec, slong mag_bits)"

### Precision and comparisons
arbcall"int acb_is_zero(const acb_t z)"
arbcall"int acb_is_one(const acb_t z)"
arbcall"int acb_is_finite(const acb_t z)"
arbcall"int acb_is_exact(const acb_t z)"
arbcall"int acb_is_int(const acb_t z)"
arbcall"int acb_is_int_2exp_si(const acb_t x, slong e)"
arbcall"int acb_equal(const acb_t x, const acb_t y)"
arbcall"int acb_equal_si(const acb_t x, slong y)"
arbcall"int acb_eq(const acb_t x, const acb_t y)"
arbcall"int acb_ne(const acb_t x, const acb_t y)"
arbcall"int acb_overlaps(const acb_t x, const acb_t y)"
arbcall"void acb_union(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_get_abs_ubound_arf(arf_t u, const acb_t z, slong prec)"
arbcall"void acb_get_abs_lbound_arf(arf_t u, const acb_t z, slong prec)"
arbcall"void acb_get_rad_ubound_arf(arf_t u, const acb_t z, slong prec)"
arbcall"void acb_get_mag(mag_t u, const acb_t x)"
arbcall"void acb_get_mag_lower(mag_t u, const acb_t x)"
# arbcall"int acb_contains_fmpq(const acb_t x, const fmpq_t y)"
# arbcall"int acb_contains_fmpz(const acb_t x, const fmpz_t y)"
arbcall"int acb_contains(const acb_t x, const acb_t y)"
arbcall"int acb_contains_zero(const acb_t x)"
arbcall"int acb_contains_int(const acb_t x)"
arbcall"int acb_contains_interior(const acb_t x, const acb_t y)"
arbcall"slong acb_rel_error_bits(const acb_t x)"
arbcall"slong acb_rel_accuracy_bits(const acb_t x)"
arbcall"slong acb_rel_one_accuracy_bits(const acb_t x)"
arbcall"slong acb_bits(const acb_t x)"
arbcall"void acb_indeterminate(acb_t x)"
arbcall"void acb_trim(acb_t y, const acb_t x)"
arbcall"int acb_is_real(const acb_t x)"
# arbcall"int acb_get_unique_fmpz(fmpz_t z, const acb_t x)"

### Complex parts
arbcall"void acb_get_real(arb_t re, const acb_t z)"
arbcall"void acb_get_imag(arb_t im, const acb_t z)"
arbcall"void acb_arg(arb_t r, const acb_t z, slong prec)"
arbcall"void acb_abs(arb_t r, const acb_t z, slong prec)"
arbcall"void acb_sgn(acb_t r, const acb_t z, slong prec)"
arbcall"void acb_csgn(arb_t r, const acb_t z)"

### Arithmetic
arbcall"void acb_neg(acb_t z, const acb_t x)"
arbcall"void acb_neg_round(acb_t z, const acb_t x, slong prec)"
arbcall"void acb_conj(acb_t z, const acb_t x)"
arbcall"void acb_add_ui(acb_t z, const acb_t x, ulong y, slong prec)"
arbcall"void acb_add_si(acb_t z, const acb_t x, slong y, slong prec)"
# arbcall"void acb_add_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)"
arbcall"void acb_add_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_add(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_sub_ui(acb_t z, const acb_t x, ulong y, slong prec)"
arbcall"void acb_sub_si(acb_t z, const acb_t x, slong y, slong prec)"
# arbcall"void acb_sub_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)"
arbcall"void acb_sub_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_sub(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_mul_onei(acb_t z, const acb_t x)"
arbcall"void acb_div_onei(acb_t z, const acb_t x)"
arbcall"void acb_mul_ui(acb_t z, const acb_t x, ulong y, slong prec)"
arbcall"void acb_mul_si(acb_t z, const acb_t x, slong y, slong prec)"
# arbcall"void acb_mul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)"
arbcall"void acb_mul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_mul(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_mul_2exp_si(acb_t z, const acb_t x, slong e)"
# arbcall"void acb_mul_2exp_fmpz(acb_t z, const acb_t x, const fmpz_t e)"
arbcall"void acb_sqr(acb_t z, const acb_t x, slong prec)"
arbcall"void acb_cube(acb_t z, const acb_t x, slong prec)"
arbcall"void acb_addmul(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_addmul_ui(acb_t z, const acb_t x, ulong y, slong prec)"
arbcall"void acb_addmul_si(acb_t z, const acb_t x, slong y, slong prec)"
# arbcall"void acb_addmul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)"
arbcall"void acb_addmul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_submul(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_submul_ui(acb_t z, const acb_t x, ulong y, slong prec)"
arbcall"void acb_submul_si(acb_t z, const acb_t x, slong y, slong prec)"
# arbcall"void acb_submul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)"
arbcall"void acb_submul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_inv(acb_t z, const acb_t x, slong prec)"
arbcall"void acb_div_ui(acb_t z, const acb_t x, ulong y, slong prec)"
arbcall"void acb_div_si(acb_t z, const acb_t x, slong y, slong prec)"
# arbcall"void acb_div_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)"
arbcall"void acb_div_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_div(acb_t z, const acb_t x, const acb_t y, slong prec)"

### Dot product
arbcall"void acb_dot_precise(acb_t res, const acb_t s, int subtract, acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void acb_dot_simple(acb_t res, const acb_t s, int subtract, acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void acb_dot(acb_t res, const acb_t s, int subtract, acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec)"
arbcall"void acb_approx_dot(acb_t res, const acb_t s, int subtract, acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec)"

### Mathematical constants
arbcall"void acb_const_pi(acb_t y, slong prec)"

### Powers and roots
arbcall"void acb_sqrt(acb_t r, const acb_t z, slong prec)"
arbcall"void acb_sqrt_analytic(acb_t r, const acb_t z, int analytic, slong prec)"
arbcall"void acb_rsqrt(acb_t r, const acb_t z, slong prec)"
arbcall"void acb_rsqrt_analytic(acb_t r, const acb_t z, int analytic, slong prec)"
# arbcall"void acb_quadratic_roots_fmpz(acb_t r1, acb_t r2, const fmpz_t a, const fmpz_t b, const fmpz_t c, slong prec)"
arbcall"void acb_root_ui(acb_t r, const acb_t z, ulong k, slong prec)"
# arbcall"void acb_pow_fmpz(acb_t y, const acb_t b, const fmpz_t e, slong prec)"
arbcall"void acb_pow_ui(acb_t y, const acb_t b, ulong e, slong prec)"
arbcall"void acb_pow_si(acb_t y, const acb_t b, slong e, slong prec)"
arbcall"void acb_pow_arb(acb_t z, const acb_t x, const arb_t y, slong prec)"
arbcall"void acb_pow(acb_t z, const acb_t x, const acb_t y, slong prec)"
arbcall"void acb_pow_analytic(acb_t r, const acb_t x, const acb_t y, int analytic, slong prec)"
arbcall"void acb_unit_root(acb_t res, ulong order, slong prec)"

### Exponentials and logarithms
arbcall"void acb_exp(acb_t y, const acb_t z, slong prec)"
arbcall"void acb_exp_pi_i(acb_t y, const acb_t z, slong prec)"
arbcall"void acb_exp_invexp(acb_t s, acb_t t, const acb_t z, slong prec)"
arbcall"void acb_expm1(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_log(acb_t y, const acb_t z, slong prec)"
arbcall"void acb_log_analytic(acb_t r, const acb_t z, int analytic, slong prec)"
arbcall"void acb_log1p(acb_t z, const acb_t x, slong prec)"

### Trigonometric functions
arbcall"void acb_sin(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_cos(acb_t c, const acb_t z, slong prec)"
arbcall"void acb_sin_cos(acb_t s, acb_t c, const acb_t z, slong prec)"
arbcall"void acb_tan(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_cot(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_sin_pi(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_cos_pi(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_sin_cos_pi(acb_t s, acb_t c, const acb_t z, slong prec)"
arbcall"void acb_tan_pi(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_cot_pi(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_sec(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_csc(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_sinc(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_sinc_pi(acb_t s, const acb_t z, slong prec)"

### Inverse trigonometric functions
arbcall"void acb_asin(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_acos(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_atan(acb_t res, const acb_t z, slong prec)"

### Hyperbolic functions
arbcall"void acb_sinh(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_cosh(acb_t c, const acb_t z, slong prec)"
arbcall"void acb_sinh_cosh(acb_t s, acb_t c, const acb_t z, slong prec)"
arbcall"void acb_tanh(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_coth(acb_t s, const acb_t z, slong prec)"
arbcall"void acb_sech(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_csch(acb_t res, const arb_t z, slong prec)"

### Inverse hyperbolic functions
arbcall"void acb_asinh(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_acosh(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_atanh(acb_t res, const acb_t z, slong prec)"

### Lambert W function
# arbcall"void acb_lambertw_asymp(acb_t res, const acb_t z, const fmpz_t k, slong L, slong M, slong prec)"
# arbcall"int acb_lambertw_check_branch(const acb_t w, const fmpz_t k, slong prec)"
# arbcall"void acb_lambertw_bound_deriv(mag_t res, const acb_t z, const acb_t ez1, const fmpz_t k)"
# arbcall"void acb_lambertw(acb_t res, const acb_t z, const fmpz_t k, int flags, slong prec)"

### Rising factorials
arbcall"void acb_rising_ui_bs(acb_t z, const acb_t x, ulong n, slong prec)"
arbcall"void acb_rising_ui_rs(acb_t z, const acb_t x, ulong n, ulong step, slong prec)"
arbcall"void acb_rising_ui_rec(acb_t z, const acb_t x, ulong n, slong prec)"
arbcall"void acb_rising_ui(acb_t z, const acb_t x, ulong n, slong prec)"
arbcall"void acb_rising(acb_t z, const acb_t x, const acb_t n, slong prec)"

### Gamma function
arbcall"void acb_gamma(acb_t y, const acb_t x, slong prec)"
arbcall"void acb_rgamma(acb_t y, const acb_t x, slong prec)"
arbcall"void acb_lgamma(acb_t y, const acb_t x, slong prec)"
arbcall"void acb_digamma(acb_t y, const acb_t x, slong prec)"
arbcall"void acb_log_sin_pi(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_polygamma(acb_t res, const acb_t s, const acb_t z, slong prec)"
arbcall"void acb_barnes_g(acb_t res, const acb_t z, slong prec)"
arbcall"void acb_log_barnes_g(acb_t res, const acb_t z, slong prec)"

### Zeta function
arbcall"void acb_zeta(acb_t z, const acb_t s, slong prec)"
arbcall"void acb_hurwitz_zeta(acb_t z, const acb_t s, const acb_t a, slong prec)"
arbcall"void acb_bernoulli_poly_ui(acb_t res, ulong n, const acb_t x, slong prec)"

### Polylogarithms
arbcall"void acb_polylog(acb_t w, const acb_t s, const acb_t z, slong prec)"
arbcall"void acb_polylog_si(acb_t w, slong s, const acb_t z, slong prec)"

### Arithmetic-geometric mean
arbcall"void acb_agm1(acb_t m, const acb_t z, slong prec)"
arbcall"void acb_agm1_cpx(acb_ptr m, const acb_t z, slong len, slong prec)"
arbcall"void acb_agm(acb_t m, const acb_t x, const acb_t y, slong prec)"

### Other special functions
arbcall"void acb_chebyshev_t_ui(acb_t a, ulong n, const acb_t x, slong prec)"
arbcall"void acb_chebyshev_u_ui(acb_t a, ulong n, const acb_t x, slong prec)"
arbcall"void acb_chebyshev_t2_ui(acb_t a, acb_t b, ulong n, const acb_t x, slong prec)"
arbcall"void acb_chebyshev_u2_ui(acb_t a, acb_t b, ulong n, const acb_t x, slong prec)"

### Piecewise real functions
arbcall"void acb_real_abs(acb_t res, const acb_t z, int analytic, slong prec)"
arbcall"void acb_real_sgn(acb_t res, const acb_t z, int analytic, slong prec)"
arbcall"void acb_real_heaviside(acb_t res, const acb_t z, int analytic, slong prec)"
arbcall"void acb_real_floor(acb_t res, const acb_t z, int analytic, slong prec)"
arbcall"void acb_real_ceil(acb_t res, const acb_t z, int analytic, slong prec)"
arbcall"void acb_real_max(acb_t res, const acb_t x, const acb_t y, int analytic, slong prec)"
arbcall"void acb_real_min(acb_t res, const acb_t x, const acb_t y, int analytic, slong prec)"
arbcall"void acb_real_sqrtpos(acb_t res, const acb_t z, int analytic, slong prec)"
