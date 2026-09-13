-- ============================================================
-- BATCH 1: Semester III and IV THEORY courses
-- ITC301, ITC302, ITC303, ITC304, ITC305, ITC401, ITC402, ITC403, ITC404, ITC405
-- One test per module, 20 questions per test
-- test_id = md5(random()::text)  (32-char hex)
-- course_semester = 'Semester III' or 'Semester IV'
-- ============================================================

INSERT INTO tests
(test_id, test_name, test_description, course_name, course_code, course_semester, course_branch, questions, test_duration, created_at)
VALUES

-- ============================================================
-- ITC301 - EM3 | Semester III | Module I: Laplace Transform
-- ============================================================
(md5(random()::text),
 'Laplace Transform',
 'Module I of Engineering Mathematics-III: Definition, existence, Laplace transform of standard functions, properties (linearity, shifting, change of scale, multiplication and division by t, derivatives and integrals), and evaluation of real integrals.',
 'Engineering Mathematics-III','ITC301 - EM3','Semester III','IT',
 '[
  {"question":"Laplace transform of e^(at) is:","options_a":"1/(s-a)","options_b":"1/(s+a)","options_c":"a/(s^2+a^2)","options_d":"s/(s^2+a^2)","correct_answer":"option_a"},
  {"question":"L{sin(at)} equals:","options_a":"a/(s^2+a^2)","options_b":"s/(s^2+a^2)","options_c":"a/(s^2-a^2)","options_d":"1/(s^2+a^2)","correct_answer":"option_a"},
  {"question":"L{cos(at)} equals:","options_a":"s/(s^2+a^2)","options_b":"a/(s^2+a^2)","options_c":"1/(s^2+a^2)","options_d":"s/(s^2-a^2)","correct_answer":"option_a"},
  {"question":"L{t^n}, n>=0 equals:","options_a":"n!/s^(n+1)","options_b":"s^n/n!","options_c":"n/s^n","options_d":"1/s^n","correct_answer":"option_a"},
  {"question":"L{1} (unit step) equals:","options_a":"1/s","options_b":"s","options_c":"1/s^2","options_d":"s^2","correct_answer":"option_a"},
  {"question":"L{e^(at) f(t)} equals:","options_a":"F(s-a)","options_b":"F(s+a)","options_c":"F(s)","options_d":"a F(s)","correct_answer":"option_a"},
  {"question":"Second shifting theorem involves:","options_a":"Unit step function","options_b":"Delta function only","options_c":"Cosine only","options_d":"Sine only","correct_answer":"option_a"},
  {"question":"L{f(t-a) u(t-a)} equals:","options_a":"e^(-as) F(s)","options_b":"e^(as) F(s)","options_c":"F(s-a)","options_d":"a F(s)","correct_answer":"option_a"},
  {"question":"Change of scale property: L{f(at)} equals:","options_a":"(1/a) F(s/a)","options_b":"a F(as)","options_c":"F(s-a)","options_d":"F(s+a)","correct_answer":"option_a"},
  {"question":"L{t f(t)} equals:","options_a":"-dF/ds","options_b":"dF/ds","options_c":"F(s)/s","options_d":"s F(s)","correct_answer":"option_a"},
  {"question":"L{f(t)/t} equals:","options_a":"Integral of F(u) du from s to infinity","options_b":"F(s)/s","options_c":"s F(s)","options_d":"dF/ds","correct_answer":"option_a"},
  {"question":"L{f''(t)} equals:","options_a":"s^2 F(s) - s f(0) - f''(0)","options_b":"s^2 F(s)","options_c":"s F(s) - f(0)","options_d":"F(s)/s^2","correct_answer":"option_a"},
  {"question":"L{f''(t)} equals:","options_a":"s F(s) - f(0)","options_b":"s F(s) + f(0)","options_c":"F(s)/s","options_d":"F(s) - f(0)","correct_answer":"option_a"},
  {"question":"Laplace transform exists if:","options_a":"Integral converges","options_b":"f is continuous","options_c":"f is bounded","options_d":"f is monotonic","correct_answer":"option_a"},
  {"question":"L{sinh(at)} equals:","options_a":"a/(s^2-a^2)","options_b":"a/(s^2+a^2)","options_c":"s/(s^2-a^2)","options_d":"s/(s^2+a^2)","correct_answer":"option_a"},
  {"question":"L{cosh(at)} equals:","options_a":"s/(s^2-a^2)","options_b":"s/(s^2+a^2)","options_c":"a/(s^2-a^2)","options_d":"a/(s^2+a^2)","correct_answer":"option_a"},
  {"question":"Laplace transform is a ______ transform.","options_a":"Integral","options_b":"Derivative","options_c":"Discrete","options_d":"Fractional","correct_answer":"option_a"},
  {"question":"Heaviside unit step function is denoted by:","options_a":"u(t)","options_b":"d(t)","options_c":"h(t)","options_d":"e(t)","correct_answer":"option_a"},
  {"question":"Dirac delta function is:","options_a":"Generalized function","options_b":"Polynomial","options_c":"Rational","options_d":"Exponential","correct_answer":"option_a"},
  {"question":"L of periodic function with period T equals:","options_a":"(1/(1-e^(-sT))) * integral_0^T e^(-st) f(t) dt","options_b":"F(s) * T","options_c":"F(s)/T","options_d":"T F(s)","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC301 - EM3 | Semester III | Module II: Inverse Laplace Transform
-- ============================================================
(md5(random()::text),
 'Inverse Laplace Transform',
 'Module II of Engineering Mathematics-III: Definition of inverse Laplace transform, linearity, partial fractions, use of derivatives, convolution theorem and applications to ordinary differential equations.',
 'Engineering Mathematics-III','ITC301 - EM3','Semester III','IT',
 '[
  {"question":"Inverse Laplace of 1/s is:","options_a":"1","options_b":"t","options_c":"s","options_d":"0","correct_answer":"option_a"},
  {"question":"Inverse Laplace of 1/s^2 is:","options_a":"t","options_b":"1","options_c":"t^2","options_d":"s","correct_answer":"option_a"},
  {"question":"Inverse Laplace of 1/(s-a) is:","options_a":"e^(at)","options_b":"e^(-at)","options_c":"a","options_d":"1/a","correct_answer":"option_a"},
  {"question":"Inverse Laplace of a/(s^2+a^2) is:","options_a":"sin(at)","options_b":"cos(at)","options_c":"sinh(at)","options_d":"cosh(at)","correct_answer":"option_a"},
  {"question":"Inverse Laplace of s/(s^2+a^2) is:","options_a":"cos(at)","options_b":"sin(at)","options_c":"cosh(at)","options_d":"sinh(at)","correct_answer":"option_a"},
  {"question":"Convolution theorem is used to find:","options_a":"Inverse Laplace of product","options_b":"Derivative","options_c":"Integral only","options_d":"Limit","correct_answer":"option_a"},
  {"question":"L^-1{F(s) G(s)} equals:","options_a":"f * g (convolution)","options_b":"f . g","options_c":"f + g","options_d":"f - g","correct_answer":"option_a"},
  {"question":"Partial fraction method helps in:","options_a":"Splitting rational functions","options_b":"Integrating","options_c":"Differentiating","options_d":"Factoring primes","correct_answer":"option_a"},
  {"question":"Inverse Laplace of 1/(s^2+a^2) is:","options_a":"(1/a) sin(at)","options_b":"sin(at)","options_c":"cos(at)","options_d":"(1/a) cos(at)","correct_answer":"option_a"},
  {"question":"Inverse Laplace of 1/(s+a) is:","options_a":"e^(-at)","options_b":"e^(at)","options_c":"a","options_d":"1/a","correct_answer":"option_a"},
  {"question":"Inverse Laplace of s/(s^2-a^2) is:","options_a":"cosh(at)","options_b":"sinh(at)","options_c":"cos(at)","options_d":"sin(at)","correct_answer":"option_a"},
  {"question":"Inverse Laplace of a/(s^2-a^2) is:","options_a":"sinh(at)","options_b":"cosh(at)","options_c":"sin(at)","options_d":"cos(at)","correct_answer":"option_a"},
  {"question":"Inverse Laplace of 1/s^n (n>0) is:","options_a":"t^(n-1)/(n-1)!","options_b":"t^n/n!","options_c":"1/t^n","options_d":"n t^n","correct_answer":"option_a"},
  {"question":"Inverse Laplace of F(s)/s is:","options_a":"Integral of f from 0 to t","options_b":"Derivative of f","options_c":"f(t) * t","options_d":"f(t)/t","correct_answer":"option_a"},
  {"question":"Inverse Laplace of derivative of F(s) equals:","options_a":"-t f(t)","options_b":"t f(t)","options_c":"f(t)/t","options_d":"-f(t)/t","correct_answer":"option_a"},
  {"question":"The inverse Laplace transform is:","options_a":"Unique","options_b":"Not unique","options_c":"Always zero","options_d":"Always constant","correct_answer":"option_a"},
  {"question":"Inverse Laplace of (s+3)/((s+1)(s+2)) needs:","options_a":"Partial fractions","options_b":"Convolution only","options_c":"Taylor series","options_d":"Integration","correct_answer":"option_a"},
  {"question":"Inverse Laplace used to solve:","options_a":"Initial value problems","options_b":"Linear algebra problems only","options_c":"Set theory","options_d":"Graph theory","correct_answer":"option_a"},
  {"question":"Boundary value problems can be solved with:","options_a":"Laplace transforms","options_b":"Only matrices","options_c":"Only numerical methods","options_d":"Only graphical methods","correct_answer":"option_a"},
  {"question":"Inverse Laplace of e^(-as) F(s) is:","options_a":"f(t-a) u(t-a)","options_b":"f(t+a)","options_c":"f(t)","options_d":"f(-t)","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC301 - EM3 | Semester III | Module III: Fourier Series
-- ============================================================
(md5(random()::text),
 'Fourier Series',
 'Module III of Engineering Mathematics-III: Dirichlet conditions, Fourier series of periodic functions with period 2pi and 2l, even and odd functions, half-range sine and cosine series, Parseval identity.',
 'Engineering Mathematics-III','ITC301 - EM3','Semester III','IT',
 '[
  {"question":"Fourier series represents:","options_a":"Periodic functions","options_b":"Only polynomials","options_c":"Only constants","options_d":"Only linear functions","correct_answer":"option_a"},
  {"question":"Dirichlet conditions ensure:","options_a":"Convergence of Fourier series","options_b":"Divergence","options_c":"Continuity only","options_d":"Differentiability only","correct_answer":"option_a"},
  {"question":"Period of sin(nx) is:","options_a":"2pi/n","options_b":"n pi","options_c":"pi","options_d":"2pi","correct_answer":"option_a"},
  {"question":"Fourier coefficients a_0 in series of f on [-pi,pi] equals:","options_a":"(1/pi) int_{-pi}^{pi} f(x) dx","options_b":"(1/(2pi)) int f dx","options_c":"int f dx","options_d":"0","correct_answer":"option_a"},
  {"question":"Fourier coefficient a_n equals:","options_a":"(1/pi) int f(x) cos(nx) dx","options_b":"(1/pi) int f(x) sin(nx) dx","options_c":"(1/(2pi)) int f dx","options_d":"0","correct_answer":"option_a"},
  {"question":"Fourier coefficient b_n equals:","options_a":"(1/pi) int f(x) sin(nx) dx","options_b":"(1/pi) int f(x) cos(nx) dx","options_c":"0","options_d":"(1/(2pi)) int f dx","correct_answer":"option_a"},
  {"question":"Fourier series of an even function contains:","options_a":"Only cosine terms","options_b":"Only sine terms","options_c":"Both sine and cosine","options_d":"Only constant","correct_answer":"option_a"},
  {"question":"Fourier series of an odd function contains:","options_a":"Only sine terms","options_b":"Only cosine terms","options_c":"Only constant","options_d":"Both terms","correct_answer":"option_a"},
  {"question":"Half range sine series is used for:","options_a":"Odd extension","options_b":"Even extension","options_c":"Neither","options_d":"Both","correct_answer":"option_a"},
  {"question":"Half range cosine series is used for:","options_a":"Even extension","options_b":"Odd extension","options_c":"Neither","options_d":"Both","correct_answer":"option_a"},
  {"question":"Period of a function f(x) with period 2l gives series with terms:","options_a":"n pi x / l","options_b":"n x","options_c":"n x/l","options_d":"n pi x","correct_answer":"option_a"},
  {"question":"Parseval identity relates:","options_a":"Energy of function to sum of squares of coefficients","options_b":"Derivative to integral","options_c":"Limits to continuity","options_d":"Zeroes to poles","correct_answer":"option_a"},
  {"question":"For f(x)=x on [-pi,pi], Fourier series has:","options_a":"Only sine terms","options_b":"Only cosine terms","options_c":"Both terms","options_d":"Only constant","correct_answer":"option_a"},
  {"question":"For f(x)=x^2 on [-pi,pi], Fourier series has:","options_a":"Only cosine terms","options_b":"Only sine terms","options_c":"Both terms","options_d":"Only constant","correct_answer":"option_a"},
  {"question":"Fourier series of f(x)=|x| on [-pi,pi] has:","options_a":"Only cosine terms","options_b":"Only sine terms","options_c":"Both","options_d":"Only constant","correct_answer":"option_a"},
  {"question":"Fourier series of a constant k is:","options_a":"k itself","options_b":"0","options_c":"sin(x)","options_d":"cos(x)","correct_answer":"option_a"},
  {"question":"Dirichlet conditions include:","options_a":"f finite, single valued, finite number of discontinuities","options_b":"f infinite","options_c":"f multi-valued","options_d":"f discontinuous everywhere","correct_answer":"option_a"},
  {"question":"Complex form of Fourier series uses:","options_a":"Exponentials","options_b":"Logarithms","options_c":"Only polynomials","options_d":"Only constants","correct_answer":"option_a"},
  {"question":"Orthogonal set of functions:","options_a":"Integral of product over period is zero for distinct indices","options_b":"Integral is always 1","options_c":"Integral is always infinite","options_d":"Functions are equal","correct_answer":"option_a"},
  {"question":"At a point of discontinuity, Fourier series converges to:","options_a":"Average of left and right limits","options_b":"Left limit only","options_c":"Right limit only","options_d":"Zero","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC301 - EM3 | Semester III | Module IV: Complex Variables
-- ============================================================
(md5(random()::text),
 'Complex Variables',
 'Module IV of Engineering Mathematics-III: Function of complex variable, limit, continuity, differentiability, analytic functions, C-R equations, Milne-Thomson method, harmonic functions and orthogonal trajectories.',
 'Engineering Mathematics-III','ITC301 - EM3','Semester III','IT',
 '[
  {"question":"A complex variable is denoted by:","options_a":"z = x + iy","options_b":"z = x - y","options_c":"z = x * y","options_d":"z = x / y","correct_answer":"option_a"},
  {"question":"Analytic function satisfies:","options_a":"Cauchy-Riemann equations","options_b":"Only continuity","options_c":"Only differentiability","options_d":"Nothing","correct_answer":"option_a"},
  {"question":"Cauchy-Riemann equations are:","options_a":"u_x = v_y, u_y = -v_x","options_b":"u_x = -v_y, u_y = v_x","options_c":"u_x = v_x, u_y = v_y","options_d":"u_x + v_y = 0 only","correct_answer":"option_a"},
  {"question":"A function analytic everywhere is called:","options_a":"Entire","options_b":"Meromorphic","options_c":"Singular","options_d":"Constant","correct_answer":"option_a"},
  {"question":"Harmonic function satisfies:","options_a":"Laplace equation","options_b":"Wave equation","options_c":"Heat equation","options_d":"Helmholtz equation","correct_answer":"option_a"},
  {"question":"Harmonic conjugate of u is:","options_a":"v","options_b":"u","options_c":"z","options_d":"-u","correct_answer":"option_a"},
  {"question":"Milne-Thomson method finds:","options_a":"f(z) from u or v","options_b":"Limits","options_c":"Series","options_d":"Residues","correct_answer":"option_a"},
  {"question":"Orthogonal trajectories of u = c are:","options_a":"Level curves of v","options_b":"Level curves of u","options_c":"Zeroes","options_d":"Poles","correct_answer":"option_a"},
  {"question":"If f(z) is analytic then u and v are:","options_a":"Harmonic","options_b":"Polynomial","options_c":"Rational","options_d":"Exponential","correct_answer":"option_a"},
  {"question":"Derivative of f(z) = z^2 at z = i equals:","options_a":"2i","options_b":"-2i","options_c":"2","options_d":"-2","correct_answer":"option_a"},
  {"question":"Limit of f(z) = (z^2-1)/(z-1) as z→1 is:","options_a":"2","options_b":"1","options_c":"0","options_d":"Infinity","correct_answer":"option_a"},
  {"question":"Continuity of f(z) at z0 requires:","options_a":"Limit exists and equals f(z0)","options_b":"f(z0) exists","options_c":"Limit exists","options_d":"z0 = 0","correct_answer":"option_a"},
  {"question":"Differentiability of f(z) implies:","options_a":"Continuity","options_b":"Analyticity","options_c":"Harmonicity","options_d":"Nothing","correct_answer":"option_a"},
  {"question":"Analyticity of f(z) at z0 requires:","options_a":"Differentiable in a neighborhood","options_b":"Continuous at z0","options_c":"Continuous only","options_d":"Bounded","correct_answer":"option_a"},
  {"question":"If v = x^2 - y^2 then u is:","options_a":"2xy + c","options_b":"x^2 + y^2","options_c":"x - y","options_d":"x + y","correct_answer":"option_a"},
  {"question":"If u = x^2 - y^2, harmonic conjugate v equals:","options_a":"2xy + c","options_b":"x^2 + y^2","options_c":"xy","options_d":"x - y","correct_answer":"option_a"},
  {"question":"If u = e^x cos y, then v equals:","options_a":"e^x sin y + c","options_b":"e^x cos y + c","options_c":"e^-x sin y","options_d":"sin y","correct_answer":"option_a"},
  {"question":"The orthogonal trajectories are:","options_a":"Curves intersecting at right angles","options_b":"Parallel curves","options_c":"Coincident curves","options_d":"Tangent curves","correct_answer":"option_a"},
  {"question":"C-R equations are necessary but not sufficient unless:","options_a":"Partial derivatives are continuous","options_b":"f is bounded","options_c":"f is real","options_d":"f is polynomial","correct_answer":"option_a"},
  {"question":"A function f(z) = z conjugate is:","options_a":"Nowhere analytic","options_b":"Analytic everywhere","options_c":"Analytic at 0 only","options_d":"Harmonic everywhere","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC301 - EM3 | Semester III | Module V: Statistical Techniques
-- ============================================================
(md5(random()::text),
 'Statistical Techniques',
 'Module V of Engineering Mathematics-III: Karl Pearson coefficient of correlation, Spearman rank correlation, lines of regression, fitting of first and second degree curves, covariance and exponential curve fitting.',
 'Engineering Mathematics-III','ITC301 - EM3','Semester III','IT',
 '[
  {"question":"Karl Pearson correlation coefficient lies in:","options_a":"[-1, 1]","options_b":"[0, 1]","options_c":"[1, 2]","options_d":"[-2, -1]","correct_answer":"option_a"},
  {"question":"Correlation coefficient r = 1 means:","options_a":"Perfect positive linear correlation","options_b":"Perfect negative","options_c":"No correlation","options_d":"Nonlinear","correct_answer":"option_a"},
  {"question":"Correlation coefficient r = 0 means:","options_a":"No linear correlation","options_b":"Perfect positive","options_c":"Perfect negative","options_d":"Nonlinear","correct_answer":"option_a"},
  {"question":"Spearman rank correlation uses:","options_a":"Ranks","options_b":"Actual values","options_c":"Derivatives","options_d":"Integrals","correct_answer":"option_a"},
  {"question":"Lines of regression are used to:","options_a":"Predict one variable from another","options_b":"Find correlation only","options_c":"Find mean only","options_d":"Find median only","correct_answer":"option_a"},
  {"question":"Regression coefficient of y on x is:","options_a":"r * (sigma_y / sigma_x)","options_b":"r * (sigma_x / sigma_y)","options_c":"r^2","options_d":"r","correct_answer":"option_a"},
  {"question":"Regression coefficient of x on y is:","options_a":"r * (sigma_x / sigma_y)","options_b":"r * (sigma_y / sigma_x)","options_c":"r","options_d":"r^2","correct_answer":"option_a"},
  {"question":"Fitting a straight line y = a + bx uses:","options_a":"Method of least squares","options_b":"Newton method","options_c":"Euler method","options_d":"Runge-Kutta","correct_answer":"option_a"},
  {"question":"Fitting a parabola y = a + bx + cx^2 uses:","options_a":"Least squares with normal equations","options_b":"Correlation","options_c":"Spearman","options_d":"Median","correct_answer":"option_a"},
  {"question":"Covariance measures:","options_a":"Joint variability of two variables","options_b":"Only mean","options_c":"Only variance","options_d":"Only mode","correct_answer":"option_a"},
  {"question":"Correlation is independent of:","options_a":"Change of origin and scale","options_b":"Units only","options_c":"Values","options_d":"Sample size","correct_answer":"option_a"},
  {"question":"Rank correlation formula uses:","options_a":"Difference of ranks squared","options_b":"Difference of means","options_c":"Difference of variances","options_d":"Difference of coefficients","correct_answer":"option_a"},
  {"question":"Fitting an exponential curve y = a e^(bx) is often done by:","options_a":"Log transformation","options_b":"Power transformation only","options_c":"No transformation","options_d":"Differentiation","correct_answer":"option_a"},
  {"question":"If r = 0.8, the relationship is:","options_a":"Strong positive","options_b":"Strong negative","options_c":"Weak positive","options_d":"Weak negative","correct_answer":"option_a"},
  {"question":"If r = -0.9, the relationship is:","options_a":"Strong negative","options_b":"Strong positive","options_c":"Weak negative","options_d":"Weak positive","correct_answer":"option_a"},
  {"question":"Two regression lines intersect at:","options_a":"Mean of x and mean of y","options_b":"Origin","options_c":"(1,1)","options_d":"(0,1)","correct_answer":"option_a"},
  {"question":"The product of regression coefficients equals:","options_a":"r^2","options_b":"r","options_c":"1","options_d":"0","correct_answer":"option_a"},
  {"question":"In Spearman rank, ties are handled by:","options_a":"Average rank","options_b":"Highest rank","options_c":"Lowest rank","options_d":"Ignore","correct_answer":"option_a"},
  {"question":"Normal equations for least squares line are:","options_a":"Sum y = na + b sum x; sum xy = a sum x + b sum x^2","options_b":"Only one equation","options_c":"No equations","options_d":"Integral equations","correct_answer":"option_a"},
  {"question":"Curve fitting minimizes:","options_a":"Sum of squared errors","options_b":"Sum of errors","options_c":"Sum of absolute errors only","options_d":"Maximum error","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC301 - EM3 | Semester III | Module VI: Probability
-- ============================================================
(md5(random()::text),
 'Probability',
 'Module VI of Engineering Mathematics-III: basics of probability, conditional probability, total probability, Bayes theorem, discrete and continuous random variables, pdf, expectation, variance, standard deviation and moment generating function.',
 'Engineering Mathematics-III','ITC301 - EM3','Semester III','IT',
 '[
  {"question":"Probability of sample space is:","options_a":"1","options_b":"0","options_c":"0.5","options_d":"Infinity","correct_answer":"option_a"},
  {"question":"Conditional probability P(A|B) is:","options_a":"P(A ∩ B)/P(B)","options_b":"P(A) P(B)","options_c":"P(A) + P(B)","options_d":"P(A) - P(B)","correct_answer":"option_a"},
  {"question":"Total probability theorem uses:","options_a":"Partition of sample space","options_b":"Only one event","options_c":"Only independence","options_d":"Only mutual exclusivity","correct_answer":"option_a"},
  {"question":"Bayes theorem gives:","options_a":"Posterior probability","options_b":"Prior only","options_c":"Joint only","options_d":"Marginal only","correct_answer":"option_a"},
  {"question":"Discrete random variable takes:","options_a":"Countable values","options_b":"Interval values","options_c":"Only integers","options_d":"Only reals","correct_answer":"option_a"},
  {"question":"Continuous random variable takes:","options_a":"Interval values","options_b":"Countable values","options_c":"Only integers","options_d":"Only rationals","correct_answer":"option_a"},
  {"question":"Sum of all probabilities in discrete distribution equals:","options_a":"1","options_b":"0","options_c":"0.5","options_d":"Infinity","correct_answer":"option_a"},
  {"question":"PDF integrated over reals equals:","options_a":"1","options_b":"0","options_c":"0.5","options_d":"Infinity","correct_answer":"option_a"},
  {"question":"Expectation E[X] equals:","options_a":"Sum x p(x) for discrete","options_b":"Sum p(x) only","options_c":"Sum x only","options_d":"1","correct_answer":"option_a"},
  {"question":"Variance is:","options_a":"E[X^2] - (E[X])^2","options_b":"E[X]^2","options_c":"E[X^2]","options_d":"E[X]","correct_answer":"option_a"},
  {"question":"Standard deviation is:","options_a":"Square root of variance","options_b":"Variance","options_c":"Mean","options_d":"Median","correct_answer":"option_a"},
  {"question":"MGF of random variable X is:","options_a":"E[e^(tX)]","options_b":"E[X]","options_c":"E[X^2]","options_d":"E[tX]","correct_answer":"option_a"},
  {"question":"If two events are independent, P(A ∩ B) equals:","options_a":"P(A) P(B)","options_b":"P(A) + P(B)","options_c":"P(A) - P(B)","options_d":"P(A)/P(B)","correct_answer":"option_a"},
  {"question":"Probability of an impossible event is:","options_a":"0","options_b":"1","options_c":"0.5","options_d":"Infinity","correct_answer":"option_a"},
  {"question":"Binomial distribution is for:","options_a":"Number of successes in n trials","options_b":"Waiting times","options_c":"Continuous","options_d":"Only symmetric","correct_answer":"option_a"},
  {"question":"Poisson distribution is for:","options_a":"Number of events in an interval","options_b":"Continuous","options_c":"Only symmetric","options_d":"Only bounded","correct_answer":"option_a"},
  {"question":"Normal distribution is:","options_a":"Continuous symmetric","options_b":"Discrete","options_c":"Skewed","options_d":"Bounded","correct_answer":"option_a"},
  {"question":"Mean of a Poisson distribution with rate λ is:","options_a":"λ","options_b":"λ^2","options_c":"1/λ","options_d":"sqrt(λ)","correct_answer":"option_a"},
  {"question":"Variance of a Poisson distribution with rate λ is:","options_a":"λ","options_b":"λ^2","options_c":"1/λ","options_d":"sqrt(λ)","correct_answer":"option_a"},
  {"question":"Mean and variance of a standard normal distribution are:","options_a":"0 and 1","options_b":"1 and 0","options_c":"0 and 0","options_d":"1 and 1","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC302 - DSA | Semester III | Module I: Linked Lists
-- ============================================================
(md5(random()::text),
 'Linked Lists',
 'Module I of Data Structure and Analysis: singly, doubly and circular linked lists, operations (insert, delete, traverse, search), dynamic memory allocation and comparison with arrays.',
 'Data Structure and Analysis','ITC302 - DSA','Semester III','IT',
 '[
  {"question":"A linked list is a:","options_a":"Linear dynamic data structure","options_b":"Static structure","options_c":"Nonlinear structure","options_d":"Hashed structure","correct_answer":"option_a"},
  {"question":"In a singly linked list each node has:","options_a":"Data and a next pointer","options_b":"Data only","options_c":"Two next pointers","options_d":"Only a next pointer","correct_answer":"option_a"},
  {"question":"In a doubly linked list each node has:","options_a":"Data and prev, next pointers","options_b":"Only prev pointer","options_c":"Only next pointer","options_d":"Data only","correct_answer":"option_a"},
  {"question":"A circular linked list:","options_a":"Last node points to first","options_b":"First points to null","options_c":"No pointers","options_d":"Only nulls","correct_answer":"option_a"},
  {"question":"Insertion at the beginning of a singly linked list takes:","options_a":"O(1)","options_b":"O(n)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Insertion at the end of a singly linked list without tail pointer takes:","options_a":"O(n)","options_b":"O(1)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Deletion from the beginning of a singly linked list takes:","options_a":"O(1)","options_b":"O(n)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Traversal of a linked list takes:","options_a":"O(n)","options_b":"O(1)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Random access in a linked list takes:","options_a":"O(n)","options_b":"O(1)","options_c":"O(log n)","options_d":"O(1) with index","correct_answer":"option_a"},
  {"question":"Random access in an array takes:","options_a":"O(1)","options_b":"O(n)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Memory in a linked list is:","options_a":"Dynamically allocated","options_b":"Statically allocated","options_c":"Contiguous","options_d":"Stack only","correct_answer":"option_a"},
  {"question":"Overhead of a linked list is:","options_a":"Pointer storage","options_b":"None","options_c":"Index storage","options_d":"Padding","correct_answer":"option_a"},
  {"question":"Circular linked list is useful in:","options_a":"Round-robin scheduling","options_b":"Sorting","options_c":"Searching","options_d":"Hashing","correct_answer":"option_a"},
  {"question":"A doubly linked list allows:","options_a":"Bidirectional traversal","options_b":"Only forward traversal","options_c":"Only backward traversal","options_d":"No traversal","correct_answer":"option_a"},
  {"question":"Stack can be implemented using:","options_a":"Linked list","options_b":"Array only","options_c":"Queue only","options_d":"Tree only","correct_answer":"option_a"},
  {"question":"Queue can be implemented using:","options_a":"Linked list","options_b":"Array only","options_c":"Tree only","options_d":"Graph only","correct_answer":"option_a"},
  {"question":"Header node in a linked list:","options_a":"Simplifies operations","options_b":"Is data node","options_c":"Is tail node","options_d":"Is not allowed","correct_answer":"option_a"},
  {"question":"Josephus problem is solved using:","options_a":"Circular linked list","options_b":"Singly linked list","options_c":"Doubly linked list","options_d":"Array","correct_answer":"option_a"},
  {"question":"Polynomial addition can use:","options_a":"Linked list","options_b":"Only array","options_c":"Only tree","options_d":"Only graph","correct_answer":"option_a"},
  {"question":"Which is NOT an advantage of linked list over array?","options_a":"Random access","options_b":"Dynamic size","options_c":"Efficient insert","options_d":"Efficient delete","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC302 - DSA | Semester III | Module II: Stacks and Queues
-- ============================================================
(md5(random()::text),
 'Stacks and Queues',
 'Module II of Data Structure and Analysis: stack operations (push, pop, peek), queue operations (enqueue, dequeue), circular queue, priority queue, and applications such as expression evaluation.',
 'Data Structure and Analysis','ITC302 - DSA','Semester III','IT',
 '[
  {"question":"A stack follows:","options_a":"LIFO","options_b":"FIFO","options_c":"Random","options_d":"Priority","correct_answer":"option_a"},
  {"question":"A queue follows:","options_a":"FIFO","options_b":"LIFO","options_c":"Random","options_d":"Priority","correct_answer":"option_a"},
  {"question":"Push operation adds element to:","options_a":"Top of stack","options_b":"Bottom of stack","options_c":"Middle","options_d":"Rear","correct_answer":"option_a"},
  {"question":"Pop operation removes element from:","options_a":"Top of stack","options_b":"Bottom","options_c":"Middle","options_d":"Front","correct_answer":"option_a"},
  {"question":"Enqueue adds to:","options_a":"Rear of queue","options_b":"Front of queue","options_c":"Middle","options_d":"Top","correct_answer":"option_a"},
  {"question":"Dequeue removes from:","options_a":"Front of queue","options_b":"Rear of queue","options_c":"Middle","options_d":"Top","correct_answer":"option_a"},
  {"question":"Circular queue solves:","options_a":"False overflow","options_b":"Underflow","options_c":"Memory leak","options_d":"Deadlock","correct_answer":"option_a"},
  {"question":"Infix expression A+B*C converts to postfix as:","options_a":"ABC*+","options_b":"AB+C*","options_c":"A+BC*","options_d":"ABC+*","correct_answer":"option_a"},
  {"question":"Postfix ABC*+ evaluates to:","options_a":"A + B*C","options_b":"(A+B)*C","options_c":"A*B+C","options_d":"A+B+C","correct_answer":"option_a"},
  {"question":"Stack is used in:","options_a":"Function call management","options_b":"Sorting only","options_c":"Hashing only","options_d":"Only graph BFS","correct_answer":"option_a"},
  {"question":"Balanced parentheses check uses:","options_a":"Stack","options_b":"Queue","options_c":"Tree","options_d":"Graph","correct_answer":"option_a"},
  {"question":"BFS uses:","options_a":"Queue","options_b":"Stack","options_c":"Tree","options_d":"Graph","correct_answer":"option_a"},
  {"question":"DFS uses:","options_a":"Stack","options_b":"Queue","options_c":"Tree","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Priority queue removes element with:","options_a":"Highest priority","options_b":"FIFO","options_c":"LIFO","options_d":"Random","correct_answer":"option_a"},
  {"question":"Stack overflow occurs when:","options_a":"Push to full stack","options_b":"Pop from empty","options_c":"Push to empty","options_d":"Pop from full","correct_answer":"option_a"},
  {"question":"Stack underflow occurs when:","options_a":"Pop from empty stack","options_b":"Push to full","options_c":"Pop from full","options_d":"Push to empty","correct_answer":"option_a"},
  {"question":"Time complexity of push in array stack:","options_a":"O(1)","options_b":"O(n)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Time complexity of pop in array stack:","options_a":"O(1)","options_b":"O(n)","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Deque allows:","options_a":"Insert and delete at both ends","options_b":"Only at front","options_c":"Only at rear","options_d":"Only in middle","correct_answer":"option_a"},
  {"question":"Round robin scheduling uses:","options_a":"Circular queue","options_b":"Stack","options_c":"Tree","options_d":"Graph","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC302 - DSA | Semester III | Module III: Trees
-- ============================================================
(md5(random()::text),
 'Trees',
 'Module III of Data Structure and Analysis: binary tree, binary search tree, traversal (inorder, preorder, postorder), AVL trees, B trees, and tree applications.',
 'Data Structure and Analysis','ITC302 - DSA','Semester III','IT',
 '[
  {"question":"A tree is a:","options_a":"Nonlinear hierarchical structure","options_b":"Linear structure","options_c":"Cycle structure","options_d":"Hashed structure","correct_answer":"option_a"},
  {"question":"Root of a tree has:","options_a":"No parent","options_b":"One parent","options_c":"Two parents","options_d":"Multiple parents","correct_answer":"option_a"},
  {"question":"A leaf node has:","options_a":"No children","options_b":"One child","options_c":"Two children","options_d":"Three children","correct_answer":"option_a"},
  {"question":"Inorder traversal of BST gives:","options_a":"Sorted order","options_b":"Reverse sorted","options_c":"Random order","options_d":"Level order","correct_answer":"option_a"},
  {"question":"Preorder traversal order is:","options_a":"Root, left, right","options_b":"Left, root, right","options_c":"Left, right, root","options_d":"Right, root, left","correct_answer":"option_a"},
  {"question":"Postorder traversal order is:","options_a":"Left, right, root","options_b":"Root, left, right","options_c":"Left, root, right","options_d":"Right, root, left","correct_answer":"option_a"},
  {"question":"Height of a balanced BST with n nodes is:","options_a":"O(log n)","options_b":"O(n)","options_c":"O(n^2)","options_d":"O(1)","correct_answer":"option_a"},
  {"question":"AVL tree is:","options_a":"Height balanced BST","options_b":"Unbalanced BST","options_c":"Heap","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Balance factor in AVL is:","options_a":"Height(left) - Height(right)","options_b":"Height(right) - Height(left)","options_c":"Sum of heights","options_d":"Product of heights","correct_answer":"option_a"},
  {"question":"AVL balance factor can be:","options_a":"-1, 0, 1","options_b":"Any integer","options_c":"Only 0","options_d":"Only positive","correct_answer":"option_a"},
  {"question":"B tree is used in:","options_a":"Databases and file systems","options_b":"Only stacks","options_c":"Only queues","options_d":"Only graphs","correct_answer":"option_a"},
  {"question":"Maximum children of an order-m B tree is:","options_a":"m","options_b":"m-1","options_c":"m+1","options_d":"2m","correct_answer":"option_a"},
  {"question":"BST search time (balanced) is:","options_a":"O(log n)","options_b":"O(n)","options_c":"O(n^2)","options_d":"O(1)","correct_answer":"option_a"},
  {"question":"BST search time (worst) is:","options_a":"O(n)","options_b":"O(log n)","options_c":"O(1)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Number of edges in a tree with n nodes is:","options_a":"n-1","options_b":"n","options_c":"n+1","options_d":"2n","correct_answer":"option_a"},
  {"question":"Level order traversal uses:","options_a":"Queue","options_b":"Stack","options_c":"Heap","options_d":"Graph","correct_answer":"option_a"},
  {"question":"A complete binary tree can be stored as:","options_a":"Array","options_b":"Linked list only","options_c":"Graph","options_d":"Set","correct_answer":"option_a"},
  {"question":"Huffman coding uses:","options_a":"Binary tree","options_b":"Graph","options_c":"Stack","options_d":"Queue","correct_answer":"option_a"},
  {"question":"Successor of a node in BST is:","options_a":"Smallest node in right subtree","options_b":"Largest node in left subtree","options_c":"Parent","options_d":"Root","correct_answer":"option_a"},
  {"question":"Predecessor of a node in BST is:","options_a":"Largest node in left subtree","options_b":"Smallest node in right subtree","options_c":"Parent","options_d":"Root","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC302 - DSA | Semester III | Module IV: Recursion and Storage Management
-- ============================================================
(md5(random()::text),
 'Recursion and Storage Management',
 'Module IV of Data Structure and Analysis: recursion basics, winding and unwinding, tail and indirect recursion, storage management techniques (first fit, best fit, worst fit, buddy systems) and garbage collection.',
 'Data Structure and Analysis','ITC302 - DSA','Semester III','IT',
 '[
  {"question":"Recursion means:","options_a":"Function calls itself","options_b":"Function calls another","options_c":"Loop","options_d":"Branching","correct_answer":"option_a"},
  {"question":"Base case in recursion:","options_a":"Stops recursion","options_b":"Starts recursion","options_c":"Increments recursion","options_d":"Nothing","correct_answer":"option_a"},
  {"question":"Recursion uses:","options_a":"Stack","options_b":"Queue","options_c":"Tree","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Winding phase in recursion:","options_a":"Before base case","options_b":"After base case","options_c":"At base case","options_d":"Never","correct_answer":"option_a"},
  {"question":"Unwinding phase in recursion:","options_a":"After base case","options_b":"Before base case","options_c":"At base case","options_d":"Never","correct_answer":"option_a"},
  {"question":"Tail recursion:","options_a":"Recursive call is last statement","options_b":"Recursive call is first","options_c":"No recursive call","options_d":"Two recursive calls","correct_answer":"option_a"},
  {"question":"Indirect recursion involves:","options_a":"Mutual calls among functions","options_b":"Only one function","options_c":"No function","options_d":"Only loops","correct_answer":"option_a"},
  {"question":"First fit strategy:","options_a":"First suitable hole","options_b":"Smallest suitable hole","options_c":"Largest suitable hole","options_d":"Random hole","correct_answer":"option_a"},
  {"question":"Best fit strategy:","options_a":"Smallest suitable hole","options_b":"First suitable hole","options_c":"Largest suitable hole","options_d":"Random hole","correct_answer":"option_a"},
  {"question":"Worst fit strategy:","options_a":"Largest suitable hole","options_b":"Smallest suitable hole","options_c":"First suitable hole","options_d":"Random hole","correct_answer":"option_a"},
  {"question":"Fragmentation refers to:","options_a":"Wasted memory","options_b":"Full memory","options_c":"Empty process","options_d":"Stack overflow","correct_answer":"option_a"},
  {"question":"Buddy system allocates:","options_a":"Power-of-two sized blocks","options_b":"Random sized blocks","options_c":"Only fixed size","options_d":"Only page size","correct_answer":"option_a"},
  {"question":"Binary buddy system splits blocks:","options_a":"Into two equal halves","options_b":"Into three","options_c":"Into four","options_d":"Never splits","correct_answer":"option_a"},
  {"question":"Fibonacci buddy system splits blocks based on:","options_a":"Fibonacci numbers","options_b":"Powers of 2","options_c":"Primes","options_d":"Random","correct_answer":"option_a"},
  {"question":"Compaction is:","options_a":"Combining free memory holes","options_b":"Splitting memory","options_c":"Freeing stack","options_d":"Zeroing memory","correct_answer":"option_a"},
  {"question":"Garbage collection:","options_a":"Reclaims unused memory","options_b":"Allocates memory","options_c":"Copies memory","options_d":"Zeros memory","correct_answer":"option_a"},
  {"question":"Reference counting is a form of:","options_a":"Garbage collection","options_b":"Allocation","options_c":"Compaction","options_d":"Fragmentation","correct_answer":"option_a"},
  {"question":"Boundary tag method:","options_a":"Uses tags for free blocks","options_b":"Uses bitmap","options_c":"Uses pointer stack","options_d":"Uses hashmap","correct_answer":"option_a"},
  {"question":"Recursion memory uses:","options_a":"Stack frame per call","options_b":"Heap only","options_c":"Static memory only","options_d":"Register only","correct_answer":"option_a"},
  {"question":"Deep recursion can cause:","options_a":"Stack overflow","options_b":"Heap overflow","options_c":"Deadlock","options_d":"Race condition","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC302 - DSA | Semester III | Module V: Searching and Sorting
-- ============================================================
(md5(random()::text),
 'Searching and Sorting',
 'Module V of Data Structure and Analysis: sequential and binary search, hashing (division, mid-square, folding, truncation), collision resolution techniques, and sorting algorithms (insertion, selection, merge, quick, radix).',
 'Data Structure and Analysis','ITC302 - DSA','Semester III','IT',
 '[
  {"question":"Linear search worst-case time:","options_a":"O(n)","options_b":"O(log n)","options_c":"O(1)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Binary search requires:","options_a":"Sorted array","options_b":"Any array","options_c":"Linked list","options_d":"Tree","correct_answer":"option_a"},
  {"question":"Binary search time complexity:","options_a":"O(log n)","options_b":"O(n)","options_c":"O(1)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Hashing provides:","options_a":"Average O(1) search","options_b":"O(n) always","options_c":"O(log n)","options_d":"O(n^2)","correct_answer":"option_a"},
  {"question":"Division method hash function uses:","options_a":"Key mod table size","options_b":"Key divided by 2","options_c":"Key squared","options_d":"Key log","correct_answer":"option_a"},
  {"question":"Mid-square method:","options_a":"Square the key and take middle digits","options_b":"Multiply by 2","options_c":"Divide by 2","options_d":"Take log","correct_answer":"option_a"},
  {"question":"Folding method:","options_a":"Split key into parts and sum","options_b":"Multiply key parts","options_c":"Divide key parts","options_d":"Take log","correct_answer":"option_a"},
  {"question":"Truncation method:","options_a":"Ignore part of the key","options_b":"Add parts","options_c":"Multiply parts","options_d":"Square key","correct_answer":"option_a"},
  {"question":"Collision occurs when:","options_a":"Two keys hash to same index","options_b":"Two keys have different hashes","options_c":"Table full","options_d":"Table empty","correct_answer":"option_a"},
  {"question":"Linear probing is:","options_a":"Open addressing technique","options_b":"Chaining","options_c":"Sorting","options_d":"Searching","correct_answer":"option_a"},
  {"question":"Quadratic probing probes with:","options_a":"Quadratic step","options_b":"Linear step","options_c":"Random step","options_d":"No step","correct_answer":"option_a"},
  {"question":"Double hashing uses:","options_a":"Two hash functions","options_b":"One hash function","options_c":"No hash","options_d":"Random","correct_answer":"option_a"},
  {"question":"Separate chaining uses:","options_a":"Linked lists","options_b":"Arrays","options_c":"Trees","options_d":"Graphs","correct_answer":"option_a"},
  {"question":"Bubble sort worst case:","options_a":"O(n^2)","options_b":"O(n log n)","options_c":"O(n)","options_d":"O(log n)","correct_answer":"option_a"},
  {"question":"Insertion sort worst case:","options_a":"O(n^2)","options_b":"O(n log n)","options_c":"O(n)","options_d":"O(log n)","correct_answer":"option_a"},
  {"question":"Merge sort worst case:","options_a":"O(n log n)","options_b":"O(n^2)","options_c":"O(n)","options_d":"O(log n)","correct_answer":"option_a"},
  {"question":"Quick sort worst case:","options_a":"O(n^2)","options_b":"O(n log n)","options_c":"O(n)","options_d":"O(log n)","correct_answer":"option_a"},
  {"question":"Quick sort average case:","options_a":"O(n log n)","options_b":"O(n^2)","options_c":"O(n)","options_d":"O(log n)","correct_answer":"option_a"},
  {"question":"Radix sort is:","options_a":"Non-comparison based","options_b":"Comparison based","options_c":"Hash based","options_d":"Tree based","correct_answer":"option_a"},
  {"question":"Merge sort is:","options_a":"Stable","options_b":"Unstable","options_c":"Neither","options_d":"Both","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC302 - DSA | Semester III | Module VI: Applications of Data Structures
-- ============================================================
(md5(random()::text),
 'Applications of Data Structures',
 'Module VI of Data Structure and Analysis: applications of linked lists (polynomials), stacks (expression evaluation), queues (scheduling), trees (Huffman), graphs (Dijkstra, MST with Prim and Kruskal).',
 'Data Structure and Analysis','ITC302 - DSA','Semester III','IT',
 '[
  {"question":"Polynomial addition uses:","options_a":"Linked list","options_b":"Stack","options_c":"Queue","options_d":"Tree","correct_answer":"option_a"},
  {"question":"Infix to postfix conversion uses:","options_a":"Stack","options_b":"Queue","options_c":"Tree","options_d":"Heap","correct_answer":"option_a"},
  {"question":"Postfix evaluation uses:","options_a":"Stack","options_b":"Queue","options_c":"Tree","options_d":"Heap","correct_answer":"option_a"},
  {"question":"Huffman tree is used for:","options_a":"Data compression","options_b":"Sorting","options_c":"Searching","options_d":"Hashing","correct_answer":"option_a"},
  {"question":"Heap sort uses:","options_a":"Heap data structure","options_b":"Stack","options_c":"Queue","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Dijkstra algorithm finds:","options_a":"Shortest paths","options_b":"MST","options_c":"Cycle","options_d":"Articulation point","correct_answer":"option_a"},
  {"question":"Prim algorithm finds:","options_a":"Minimum spanning tree","options_b":"Shortest path","options_c":"Topological order","options_d":"Cycle","correct_answer":"option_a"},
  {"question":"Kruskal algorithm finds:","options_a":"Minimum spanning tree","options_b":"Shortest path","options_c":"Cycle","options_d":"Articulation point","correct_answer":"option_a"},
  {"question":"BFS uses:","options_a":"Queue","options_b":"Stack","options_c":"Heap","options_d":"Tree","correct_answer":"option_a"},
  {"question":"DFS uses:","options_a":"Stack","options_b":"Queue","options_c":"Heap","options_d":"Tree","correct_answer":"option_a"},
  {"question":"Josephus problem uses:","options_a":"Circular linked list","options_b":"Stack","options_c":"Queue","options_d":"Heap","correct_answer":"option_a"},
  {"question":"Round robin scheduling uses:","options_a":"Circular queue","options_b":"Stack","options_c":"Heap","options_d":"Tree","correct_answer":"option_a"},
  {"question":"Bracket matching uses:","options_a":"Stack","options_b":"Queue","options_c":"Heap","options_d":"Tree","correct_answer":"option_a"},
  {"question":"Function call stack uses:","options_a":"Stack","options_b":"Queue","options_c":"Heap","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Undo operation in editors uses:","options_a":"Stack","options_b":"Queue","options_c":"Heap","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Printer queue uses:","options_a":"Queue","options_b":"Stack","options_c":"Tree","options_d":"Graph","correct_answer":"option_a"},
  {"question":"Graph adjacency matrix is:","options_a":"2D array","options_b":"1D array","options_c":"Linked list","options_d":"Hashmap","correct_answer":"option_a"},
  {"question":"Graph adjacency list uses:","options_a":"Linked lists","options_b":"2D array","options_c":"1D array","options_d":"Set","correct_answer":"option_a"},
  {"question":"Topological sort is for:","options_a":"DAGs","options_b":"Any graph","options_c":"Trees only","options_d":"Cyclic graphs","correct_answer":"option_a"},
  {"question":"Cycle detection in directed graph uses:","options_a":"DFS","options_b":"BFS only","options_c":"Hashing","options_d":"Sorting","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC303 - DBMS | Semester III | Module I: Introduction
-- ============================================================
(md5(random()::text),
 'Introduction to DBMS',
 'Module I of Database Management System: DBMS basics, need, advantages over file systems, data models, database architecture, three-schema architecture, data independence and DBMS users.',
 'Database Management System','ITC303 - DBMS','Semester III','IT',
 '[
  {"question":"DBMS stands for:","options_a":"Database Management System","options_b":"Data Backup Management System","options_c":"Database Mapping System","options_d":"Data Block Management System","correct_answer":"option_a"},
  {"question":"DBMS provides:","options_a":"Controlled access to data","options_b":"Only storage","options_c":"Only query","options_d":"Only backup","correct_answer":"option_a"},
  {"question":"File system drawbacks include:","options_a":"Data redundancy","options_b":"Data consistency","options_c":"Data independence","options_d":"Concurrency","correct_answer":"option_a"},
  {"question":"Data redundancy leads to:","options_a":"Inconsistency","options_b":"Consistency","options_c":"Integrity","options_d":"Security","correct_answer":"option_a"},
  {"question":"DBMS helps in achieving:","options_a":"Data independence","options_b":"Data redundancy","options_c":"Data loss","options_d":"Data corruption","correct_answer":"option_a"},
  {"question":"Three-schema architecture has:","options_a":"Internal, conceptual, external","options_b":"Logical, physical","options_c":"Front, back","options_d":"Local, global","correct_answer":"option_a"},
  {"question":"Physical level describes:","options_a":"How data is stored","options_b":"How data is viewed","options_c":"How data is queried","options_d":"How data is defined","correct_answer":"option_a"},
  {"question":"Logical level describes:","options_a":"What data is stored and relationships","options_b":"How data is stored","options_c":"How users see data","options_d":"How data is backed up","correct_answer":"option_a"},
  {"question":"View level describes:","options_a":"How users see data","options_b":"How data is stored","options_c":"How data is queried","options_d":"How data is backed up","correct_answer":"option_a"},
  {"question":"Data independence means:","options_a":"Changes in one level don''t affect others","options_b":"Data is independent of user","options_c":"Data is independent of hardware","options_d":"Data is duplicated","correct_answer":"option_a"},
  {"question":"DBMS is:","options_a":"System software","options_b":"Application software","options_c":"Hardware","options_d":"Firmware","correct_answer":"option_a"},
  {"question":"Data model is:","options_a":"A way to describe data","options_b":"A file format","options_c":"A file system","options_d":"A hardware device","correct_answer":"option_a"},
  {"question":"Relational model organizes data as:","options_a":"Tables","options_b":"Trees","options_c":"Graphs","options_d":"Objects","correct_answer":"option_a"},
  {"question":"Hierarchical model organizes data as:","options_a":"Tree","options_b":"Table","options_c":"Graph","options_d":"Object","correct_answer":"option_a"},
  {"question":"Network model organizes data as:","options_a":"Graph","options_b":"Table","options_c":"Tree","options_d":"Object","correct_answer":"option_a"},
  {"question":"DBMS user types include:","options_a":"DBA, developers, end users","options_b":"Only DBA","options_c":"Only developers","options_d":"Only end users","correct_answer":"option_a"},
  {"question":"DBA stands for:","options_a":"Database Administrator","options_b":"Data Backup Admin","options_c":"Database Access","options_d":"Data Block Admin","correct_answer":"option_a"},
  {"question":"DBMS provides concurrency:","options_a":"Multiple users can access simultaneously","options_b":"Only one user at a time","options_c":"No access","options_d":"Random access","correct_answer":"option_a"},
  {"question":"DBMS ensures:","options_a":"Integrity, security, consistency","options_b":"Only storage","options_c":"Only queries","options_d":"Only backup","correct_answer":"option_a"},
  {"question":"DDL is:","options_a":"Data Definition Language","options_b":"Data Dump Language","options_c":"Data Delete Language","options_d":"Data Design Language","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC303 - DBMS | Semester III | Module II: ER Model
-- ============================================================
(md5(random()::text),
 'ER Model',
 'Module II of Database Management System: Entity-Relationship model, entities, attributes, relationships, cardinality ratios, participation constraints, weak entities and extended ER (EER) features.',
 'Database Management System','ITC303 - DBMS','Semester III','IT',
 '[
  {"question":"ER model represents:","options_a":"Conceptual data","options_b":"Physical storage","options_c":"Query plans","options_d":"Indexes","correct_answer":"option_a"},
  {"question":"Entity is:","options_a":"Real-world object","options_b":"Attribute","options_c":"Relationship","options_d":"Table","correct_answer":"option_a"},
  {"question":"Attribute is:","options_a":"Property of an entity","options_b":"An object","options_c":"A relationship","options_d":"A table","correct_answer":"option_a"},
  {"question":"Relationship is:","options_a":"Association among entities","options_b":"Attribute","options_c":"Entity","options_d":"Table","correct_answer":"option_a"},
  {"question":"Primary key is:","options_a":"Unique identifier of an entity","options_b":"Any attribute","options_c":"Foreign key","options_d":"Candidate key","correct_answer":"option_a"},
  {"question":"Composite attribute:","options_a":"Composed of multiple attributes","options_b":"Single attribute","options_c":"Derived attribute","options_d":"Multivalued","correct_answer":"option_a"},
  {"question":"Derived attribute:","options_a":"Derived from other attributes","options_b":"Base attribute","options_c":"Composite attribute","options_d":"Multivalued","correct_answer":"option_a"},
  {"question":"Multivalued attribute:","options_a":"Can have multiple values","options_b":"One value","options_c":"Derived","options_d":"Composite","correct_answer":"option_a"},
  {"question":"Cardinality ratio describes:","options_a":"Number of entities participating","options_b":"Size of entity","options_c":"Size of attribute","options_d":"Size of relation","correct_answer":"option_a"},
  {"question":"1:1 cardinality:","options_a":"One-to-one","options_b":"One-to-many","options_c":"Many-to-one","options_d":"Many-to-many","correct_answer":"option_a"},
  {"question":"1:N cardinality:","options_a":"One-to-many","options_b":"One-to-one","options_c":"Many-to-one","options_d":"Many-to-many","correct_answer":"option_a"},
  {"question":"M:N cardinality:","options_a":"Many-to-many","options_b":"One-to-many","options_c":"One-to-one","options_d":"Many-to-one","correct_answer":"option_a"},
  {"question":"Participation constraint:","options_a":"Total or partial","options_b":"Only total","options_c":"Only partial","options_d":"Random","correct_answer":"option_a"},
  {"question":"Weak entity:","options_a":"Has no key of its own","options_b":"Has key","options_c":"Is an attribute","options_d":"Is a relationship","correct_answer":"option_a"},
  {"question":"Generalization is:","options_a":"Bottom-up approach","options_b":"Top-down","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Specialization is:","options_a":"Top-down approach","options_b":"Bottom-up","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Aggregation in ER:","options_a":"Treats relationship as entity","options_b":"Treats entity as relationship","options_c":"Splits entity","options_d":"Splits attribute","correct_answer":"option_a"},
  {"question":"ER diagram is:","options_a":"Graphical representation","options_b":"Textual only","options_c":"Binary only","options_d":"Numeric only","correct_answer":"option_a"},
  {"question":"Relationship degree:","options_a":"Number of entities involved","options_b":"Number of attributes","options_c":"Number of keys","options_d":"Number of indexes","correct_answer":"option_a"},
  {"question":"Recursive relationship:","options_a":"Entity related to itself","options_b":"Two entities","options_c":"Three entities","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC303 - DBMS | Semester III | Module III: Relational Model
-- ============================================================
(md5(random()::text),
 'Relational Model',
 'Module III of Database Management System: relational model concepts, schemas, keys (primary, candidate, foreign), integrity constraints, and relational algebra operations.',
 'Database Management System','ITC303 - DBMS','Semester III','IT',
 '[
  {"question":"Relational model represents data as:","options_a":"Tables","options_b":"Trees","options_c":"Graphs","options_d":"Objects","correct_answer":"option_a"},
  {"question":"Row in a relation is called:","options_a":"Tuple","options_b":"Attribute","options_c":"Field","options_d":"Column","correct_answer":"option_a"},
  {"question":"Column in a relation is called:","options_a":"Attribute","options_b":"Tuple","options_c":"Row","options_d":"Record","correct_answer":"option_a"},
  {"question":"Degree of a relation:","options_a":"Number of attributes","options_b":"Number of tuples","options_c":"Number of keys","options_d":"Number of indexes","correct_answer":"option_a"},
  {"question":"Cardinality of a relation:","options_a":"Number of tuples","options_b":"Number of attributes","options_c":"Number of keys","options_d":"Number of indexes","correct_answer":"option_a"},
  {"question":"Primary key:","options_a":"Uniquely identifies a tuple","options_b":"Any attribute","options_c":"Foreign key","options_d":"Superkey only","correct_answer":"option_a"},
  {"question":"Candidate key:","options_a":"Minimal superkey","options_b":"Any attribute","options_c":"Foreign key","options_d":"Primary key","correct_answer":"option_a"},
  {"question":"Foreign key:","options_a":"Refers to primary key of another relation","options_b":"Any attribute","options_c":"Primary key","options_d":"Candidate key","correct_answer":"option_a"},
  {"question":"Superkey is:","options_a":"Any set of attributes uniquely identifying a tuple","options_b":"Only primary key","options_c":"Only foreign key","options_d":"Only candidate key","correct_answer":"option_a"},
  {"question":"Entity integrity:","options_a":"Primary key cannot be NULL","options_b":"Foreign key cannot be NULL","options_c":"Any attribute can be NULL","options_d":"No constraints","correct_answer":"option_a"},
  {"question":"Referential integrity:","options_a":"Foreign key must refer to existing primary key","options_b":"Primary key must be NULL","options_c":"No constraint","options_d":"Random","correct_answer":"option_a"},
  {"question":"Selection operation:","options_a":"Selects rows","options_b":"Selects columns","options_c":"Selects both","options_d":"None","correct_answer":"option_a"},
  {"question":"Projection operation:","options_a":"Selects columns","options_b":"Selects rows","options_c":"Selects both","options_d":"None","correct_answer":"option_a"},
  {"question":"Union operation:","options_a":"Combines tuples","options_b":"Combines attributes","options_c":"Combines both","options_d":"None","correct_answer":"option_a"},
  {"question":"Join operation:","options_a":"Combines relations based on condition","options_b":"Combines attributes only","options_c":"Combines tuples only","options_d":"None","correct_answer":"option_a"},
  {"question":"Cartesian product:","options_a":"All pairs of tuples from two relations","options_b":"Common tuples","options_c":"Common attributes","options_d":"None","correct_answer":"option_a"},
  {"question":"Set difference operation:","options_a":"Returns tuples in one relation not in another","options_b":"Union of tuples","options_c":"Intersection of tuples","options_d":"None","correct_answer":"option_a"},
  {"question":"Renaming operation:","options_a":"Renames relation or attributes","options_b":"Deletes relation","options_c":"Inserts tuples","options_d":"None","correct_answer":"option_a"},
  {"question":"Relational algebra is:","options_a":"Procedural","options_b":"Declarative","options_c":"Imperative","options_d":"Object-oriented","correct_answer":"option_a"},
  {"question":"Natural join:","options_a":"Joins on common attributes","options_b":"Joins on any attribute","options_c":"Joins on no attribute","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC303 - DBMS | Semester III | Module IV: SQL
-- ============================================================
(md5(random()::text),
 'SQL',
 'Module IV of Database Management System: SQL basics, DDL, DML, DCL, TCL, SQL queries, joins, subqueries, aggregate functions, views, triggers, procedures and cursors.',
 'Database Management System','ITC303 - DBMS','Semester III','IT',
 '[
  {"question":"SQL stands for:","options_a":"Structured Query Language","options_b":"Simple Query Language","options_c":"Standard Query Language","options_d":"System Query Language","correct_answer":"option_a"},
  {"question":"DDL stands for:","options_a":"Data Definition Language","options_b":"Data Dump Language","options_c":"Data Delete Language","options_d":"Data Design Language","correct_answer":"option_a"},
  {"question":"DML stands for:","options_a":"Data Manipulation Language","options_b":"Data Mapping Language","options_c":"Data Merge Language","options_d":"Data Model Language","correct_answer":"option_a"},
  {"question":"DCL stands for:","options_a":"Data Control Language","options_b":"Data Copy Language","options_c":"Data Create Language","options_d":"Data Check Language","correct_answer":"option_a"},
  {"question":"TCL stands for:","options_a":"Transaction Control Language","options_b":"Table Control Language","options_c":"Tuple Control Language","options_d":"Time Control Language","correct_answer":"option_a"},
  {"question":"CREATE belongs to:","options_a":"DDL","options_b":"DML","options_c":"DCL","options_d":"TCL","correct_answer":"option_a"},
  {"question":"INSERT belongs to:","options_a":"DML","options_b":"DDL","options_c":"DCL","options_d":"TCL","correct_answer":"option_a"},
  {"question":"GRANT belongs to:","options_a":"DCL","options_b":"DDL","options_c":"DML","options_d":"TCL","correct_answer":"option_a"},
  {"question":"COMMIT belongs to:","options_a":"TCL","options_b":"DDL","options_c":"DML","options_d":"DCL","correct_answer":"option_a"},
  {"question":"SELECT is:","options_a":"DQL (Data Query Language)","options_b":"DDL","options_c":"DML","options_d":"DCL","correct_answer":"option_a"},
  {"question":"WHERE clause filters:","options_a":"Rows","options_b":"Columns","options_c":"Tables","options_d":"Databases","correct_answer":"option_a"},
  {"question":"GROUP BY is used to:","options_a":"Group rows for aggregation","options_b":"Sort rows","options_c":"Filter rows","options_d":"Join tables","correct_answer":"option_a"},
  {"question":"ORDER BY is used to:","options_a":"Sort rows","options_b":"Group rows","options_c":"Filter rows","options_d":"Join tables","correct_answer":"option_a"},
  {"question":"HAVING clause filters:","options_a":"Groups","options_b":"Rows","options_c":"Columns","options_d":"Tables","correct_answer":"option_a"},
  {"question":"INNER JOIN returns:","options_a":"Matching rows","options_b":"All rows","options_c":"Only left","options_d":"Only right","correct_answer":"option_a"},
  {"question":"LEFT JOIN returns:","options_a":"All left rows with matching right","options_b":"Only matching","options_c":"All right rows","options_d":"Cartesian","correct_answer":"option_a"},
  {"question":"RIGHT JOIN returns:","options_a":"All right rows with matching left","options_b":"Only matching","options_c":"All left rows","options_d":"Cartesian","correct_answer":"option_a"},
  {"question":"Aggregate function COUNT:","options_a":"Counts rows","options_b":"Sums values","options_c":"Averages values","options_d":"Max value","correct_answer":"option_a"},
  {"question":"View is:","options_a":"Virtual table","options_b":"Physical table","options_c":"Index","options_d":"Cursor","correct_answer":"option_a"},
  {"question":"Trigger is:","options_a":"Automatically executed on event","options_b":"Manually executed","options_c":"Only DDL","options_d":"Only DCL","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC303 - DBMS | Semester III | Module V: Normalization
-- ============================================================
(md5(random()::text),
 'Normalization',
 'Module V of Database Management System: design guidelines, functional dependencies, normalization process, 1NF, 2NF, 3NF, BCNF, lossless join and dependency preservation.',
 'Database Management System','ITC303 - DBMS','Semester III','IT',
 '[
  {"question":"Normalization is:","options_a":"Process of organizing data to reduce redundancy","options_b":"Process of duplicating data","options_c":"Process of deleting data","options_d":"Process of querying data","correct_answer":"option_a"},
  {"question":"Functional dependency X -> Y means:","options_a":"X determines Y","options_b":"Y determines X","options_c":"X and Y independent","options_d":"X equals Y","correct_answer":"option_a"},
  {"question":"Trivial FD:","options_a":"Y is subset of X","options_b":"X is subset of Y","options_c":"X and Y disjoint","options_d":"X = Y","correct_answer":"option_a"},
  {"question":"1NF requires:","options_a":"Atomic attribute values","options_b":"No atomic values","options_c":"Composite attributes","options_d":"Multivalued attributes","correct_answer":"option_a"},
  {"question":"2NF requires:","options_a":"1NF + no partial dependency","options_b":"1NF only","options_c":"3NF only","options_d":"BCNF only","correct_answer":"option_a"},
  {"question":"3NF requires:","options_a":"2NF + no transitive dependency","options_b":"2NF only","options_c":"1NF only","options_d":"BCNF only","correct_answer":"option_a"},
  {"question":"BCNF requires:","options_a":"Every determinant is a candidate key","options_b":"Every key is a determinant","options_c":"Every attribute is a key","options_d":"No keys","correct_answer":"option_a"},
  {"question":"Partial dependency:","options_a":"Non-prime attribute depends on part of candidate key","options_b":"Depends on full key","options_c":"No dependency","options_d":"On non-key","correct_answer":"option_a"},
  {"question":"Transitive dependency:","options_a":"Non-prime attribute depends on another non-prime attribute","options_b":"Depends on prime attribute","options_c":"Depends on key","options_d":"No dependency","correct_answer":"option_a"},
  {"question":"Normalization reduces:","options_a":"Redundancy and anomalies","options_b":"Integrity","options_c":"Consistency","options_d":"Keys","correct_answer":"option_a"},
  {"question":"Insertion anomaly:","options_a":"Cannot insert without unrelated data","options_b":"Cannot delete","options_c":"Cannot update","options_d":"Cannot query","correct_answer":"option_a"},
  {"question":"Deletion anomaly:","options_a":"Deleting one fact deletes another","options_b":"Deleting row","options_c":"Deleting column","options_d":"Deleting table","correct_answer":"option_a"},
  {"question":"Update anomaly:","options_a":"Multiple updates needed for one change","options_b":"One update","options_c":"No update","options_d":"Random","correct_answer":"option_a"},
  {"question":"Lossless join decomposition:","options_a":"Join of parts returns original","options_b":"Join loses tuples","options_c":"Join adds tuples","options_d":"No join","correct_answer":"option_a"},
  {"question":"Dependency preserving:","options_a":"All FDs preserved in decomposition","options_b":"FDs lost","options_c":"FDs added","options_d":"FDs ignored","correct_answer":"option_a"},
  {"question":"Denormalization:","options_a":"Reintroducing redundancy for performance","options_b":"Removing redundancy","options_c":"No change","options_d":"Sorting","correct_answer":"option_a"},
  {"question":"A relation in 3NF is:","options_a":"Also in 2NF","options_b":"Also in BCNF","options_c":"Also in 4NF","options_d":"Not in 2NF","correct_answer":"option_a"},
  {"question":"A relation in BCNF is:","options_a":"Also in 3NF","options_b":"Not in 3NF","options_c":"Also in 4NF","options_d":"Not in 2NF","correct_answer":"option_a"},
  {"question":"Armstrong axioms include:","options_a":"Reflexivity, augmentation, transitivity","options_b":"Sum, product","options_c":"Union, difference","options_d":"Sort, search","correct_answer":"option_a"},
  {"question":"Canonical cover:","options_a":"Minimal set of FDs","options_b":"Maximal set of FDs","options_c":"Single FD","options_d":"No FD","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC303 - DBMS | Semester III | Module VI: Transactions and Concurrency
-- ============================================================
(md5(random()::text),
 'Transactions Management and Concurrency',
 'Module VI of Database Management System: transaction concept, ACID properties, states, serializability, concurrency control (locking, timestamps), and recovery (log-based, checkpoints).',
 'Database Management System','ITC303 - DBMS','Semester III','IT',
 '[
  {"question":"Transaction is:","options_a":"Logical unit of work","options_b":"Physical file","options_c":"Attribute","options_d":"Relation","correct_answer":"option_a"},
  {"question":"ACID stands for:","options_a":"Atomicity, Consistency, Isolation, Durability","options_b":"All, Check, Insert, Delete","options_c":"Atomic, Copy, Insert, Drop","options_d":"Add, Create, Update, Delete","correct_answer":"option_a"},
  {"question":"Atomicity means:","options_a":"All or nothing","options_b":"Partial execution","options_c":"Random execution","options_d":"None","correct_answer":"option_a"},
  {"question":"Consistency means:","options_a":"Database moves from one valid state to another","options_b":"Data is lost","options_c":"Data duplicated","options_d":"Data removed","correct_answer":"option_a"},
  {"question":"Isolation means:","options_a":"Transactions do not interfere","options_b":"Transactions interfere","options_c":"Serial only","options_d":"Random","correct_answer":"option_a"},
  {"question":"Durability means:","options_a":"Committed changes persist","options_b":"Changes vanish","options_c":"Rollback always","options_d":"None","correct_answer":"option_a"},
  {"question":"Transaction states include:","options_a":"Active, partially committed, committed, failed, aborted","options_b":"Only active","options_c":"Only committed","options_d":"Only failed","correct_answer":"option_a"},
  {"question":"Schedule is:","options_a":"Order of operations from transactions","options_b":"Order of files","options_c":"Order of attributes","options_d":"Order of tables","correct_answer":"option_a"},
  {"question":"Serial schedule:","options_a":"Transactions execute one after another","options_b":"Interleaved","options_c":"Random","options_d":"Parallel","correct_answer":"option_a"},
  {"question":"Serializable schedule:","options_a":"Equivalent to some serial schedule","options_b":"Not equivalent","options_c":"Parallel only","options_d":"None","correct_answer":"option_a"},
  {"question":"Conflict serializability checks:","options_a":"Conflicting operations order","options_b":"Any order","options_c":"No order","options_d":"Random","correct_answer":"option_a"},
  {"question":"Precedence graph is used for:","options_a":"Conflict serializability","options_b":"View serializability","options_c":"Concurrency detection","options_d":"Deadlock detection","correct_answer":"option_a"},
  {"question":"Lock-based protocol uses:","options_a":"Shared and exclusive locks","options_b":"Only shared","options_c":"Only exclusive","options_d":"No locks","correct_answer":"option_a"},
  {"question":"Two-phase locking:","options_a":"Growing and shrinking phase","options_b":"Only growing","options_c":"Only shrinking","options_d":"No phases","correct_answer":"option_a"},
  {"question":"Deadlock:","options_a":"Transactions wait for each other","options_b":"Transactions finish quickly","options_c":"No waiting","options_d":"Random","correct_answer":"option_a"},
  {"question":"Timestamp-based protocol uses:","options_a":"Timestamps for ordering","options_b":"Locks","options_c":"Queues","options_d":"Stacks","correct_answer":"option_a"},
  {"question":"Log-based recovery uses:","options_a":"Log records for redo/undo","options_b":"Only checkpoints","options_c":"Only shadow paging","options_d":"None","correct_answer":"option_a"},
  {"question":"Checkpoint:","options_a":"Point where log is flushed","options_b":"Point where log is deleted","options_c":"Point where data is deleted","options_d":"Random","correct_answer":"option_a"},
  {"question":"Rollback:","options_a":"Undo transaction changes","options_b":"Redo changes","options_c":"Commit changes","options_d":"None","correct_answer":"option_a"},
  {"question":"Commit:","options_a":"Make transaction changes permanent","options_b":"Undo changes","options_c":"Rollback","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC304 - PC | Semester III | Module I: Communication Systems
-- ============================================================
(md5(random()::text),
 'Communication Systems',
 'Module I of Principle of Communication: analog and digital communication systems, block diagrams of transmitter and receiver, need for modulation, bandwidth and channel capacity.',
 'Principle of Communication','ITC304 - PC','Semester III','IT',
 '[
  {"question":"Communication system includes:","options_a":"Transmitter, channel, receiver","options_b":"Only transmitter","options_c":"Only receiver","options_d":"Only channel","correct_answer":"option_a"},
  {"question":"Transmitter converts:","options_a":"Message to signal","options_b":"Signal to message","options_c":"Channel to signal","options_d":"Signal to channel","correct_answer":"option_a"},
  {"question":"Receiver converts:","options_a":"Signal to message","options_b":"Message to signal","options_c":"Channel to signal","options_d":"Signal to channel","correct_answer":"option_a"},
  {"question":"Channel is:","options_a":"Medium between Tx and Rx","options_b":"Message source","options_c":"Output device","options_d":"Input device","correct_answer":"option_a"},
  {"question":"Modulation:","options_a":"Varies carrier with message","options_b":"Varies message with carrier","options_c":"Varies channel","options_d":"Varies receiver","correct_answer":"option_a"},
  {"question":"Need for modulation:","options_a":"Antenna size, multiplexing, noise","options_b":"Only size","options_c":"Only multiplexing","options_d":"Only noise","correct_answer":"option_a"},
  {"question":"Analog communication uses:","options_a":"Continuous signals","options_b":"Discrete signals","options_c":"Digital only","options_d":"Binary only","correct_answer":"option_a"},
  {"question":"Digital communication uses:","options_a":"Discrete signals","options_b":"Continuous","options_c":"Analog only","options_d":"Random","correct_answer":"option_a"},
  {"question":"Bandwidth is:","options_a":"Range of frequencies","options_b":"Amplitude range","options_c":"Phase range","options_d":"Power range","correct_answer":"option_a"},
  {"question":"Channel capacity depends on:","options_a":"Bandwidth and SNR","options_b":"Bandwidth only","options_c":"SNR only","options_d":"Amplitude only","correct_answer":"option_a"},
  {"question":"Shannon capacity formula:","options_a":"C = B log2(1+SNR)","options_b":"C = B*SNR","options_c":"C = B + SNR","options_d":"C = B/SNR","correct_answer":"option_a"},
  {"question":"Baseband signal:","options_a":"Original signal without carrier","options_b":"With carrier","options_c":"Modulated","options_d":"Filtered","correct_answer":"option_a"},
  {"question":"Passband signal:","options_a":"Modulated signal around carrier","options_b":"Original","options_c":"Baseband","options_d":"Filtered","correct_answer":"option_a"},
  {"question":"Noise:","options_a":"Unwanted signal","options_b":"Message signal","options_c":"Carrier","options_d":"Filter","correct_answer":"option_a"},
  {"question":"SNR:","options_a":"Signal-to-Noise Ratio","options_b":"Signal-Noise Ratio","options_c":"Signal Noise Range","options_d":"Sine-Noise Ratio","correct_answer":"option_a"},
  {"question":"Higher SNR means:","options_a":"Better quality","options_b":"Worse quality","options_c":"No effect","options_d":"Random","correct_answer":"option_a"},
  {"question":"Analog communication examples:","options_a":"AM, FM","options_b":"PCM, QAM","options_c":"PSK","options_d":"QPSK","correct_answer":"option_a"},
  {"question":"Digital communication examples:","options_a":"PCM, QPSK","options_b":"AM","options_c":"FM","options_d":"PM","correct_answer":"option_a"},
  {"question":"Receiver functions include:","options_a":"Amplification, demodulation","options_b":"Only amplification","options_c":"Only demodulation","options_d":"None","correct_answer":"option_a"},
  {"question":"Bandwidth requirement of digital is often:","options_a":"Higher than analog","options_b":"Lower than analog","options_c":"Same","options_d":"Zero","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC304 - PC | Semester III | Module II: Noise and Fourier
-- ============================================================
(md5(random()::text),
 'Noise and Fourier Transform',
 'Module II of Principle of Communication: types of noise, thermal, shot and flicker noise, noise figure, Fourier series and Fourier transform, time and frequency domain analysis and power spectral density.',
 'Principle of Communication','ITC304 - PC','Semester III','IT',
 '[
  {"question":"Noise is:","options_a":"Unwanted signal","options_b":"Desired signal","options_c":"Carrier","options_d":"Filter","correct_answer":"option_a"},
  {"question":"Thermal noise is due to:","options_a":"Random motion of electrons","options_b":"Shot effect","options_c":"Flicker effect","options_d":"Interference","correct_answer":"option_a"},
  {"question":"Shot noise is due to:","options_a":"Discrete nature of current","options_b":"Heat","options_c":"Flicker","options_d":"Interference","correct_answer":"option_a"},
  {"question":"Flicker noise also called:","options_a":"1/f noise","options_b":"White noise","options_c":"Shot noise","options_d":"Thermal noise","correct_answer":"option_a"},
  {"question":"White noise has:","options_a":"Flat PSD","options_b":"Rising PSD","options_c":"Falling PSD","options_d":"Zero PSD","correct_answer":"option_a"},
  {"question":"Noise figure is:","options_a":"Degradation of SNR","options_b":"Improvement of SNR","options_c":"Zero SNR","options_d":"Infinite SNR","correct_answer":"option_a"},
  {"question":"Fourier series represents:","options_a":"Periodic signals","options_b":"Aperiodic","options_c":"Noise","options_d":"Random","correct_answer":"option_a"},
  {"question":"Fourier transform represents:","options_a":"Aperiodic signals","options_b":"Periodic only","options_c":"Noise","options_d":"Random","correct_answer":"option_a"},
  {"question":"Time-domain and frequency-domain are:","options_a":"Dual representations","options_b":"Independent","options_c":"Identical","options_d":"Random","correct_answer":"option_a"},
  {"question":"Bandwidth of signal in frequency domain:","options_a":"Range of frequencies present","options_b":"Amplitude range","options_c":"Phase range","options_d":"Time range","correct_answer":"option_a"},
  {"question":"Fourier transform of a constant:","options_a":"Delta function","options_b":"Constant","options_c":"Sine","options_d":"Cosine","correct_answer":"option_a"},
  {"question":"Fourier transform of cosine:","options_a":"Two delta functions","options_b":"Constant","options_c":"Sine","options_d":"None","correct_answer":"option_a"},
  {"question":"Power spectral density relates to:","options_a":"Power distribution over frequency","options_b":"Amplitude","options_c":"Phase","options_d":"Time","correct_answer":"option_a"},
  {"question":"Parseval theorem relates:","options_a":"Energy in time and frequency","options_b":"Amplitude","options_c":"Phase","options_d":"None","correct_answer":"option_a"},
  {"question":"Narrowband noise:","options_a":"Bandwidth small compared to center frequency","options_b":"Bandwidth large","options_c":"Zero bandwidth","options_d":"Infinite bandwidth","correct_answer":"option_a"},
  {"question":"Wideband noise:","options_a":"Bandwidth comparable to center frequency","options_b":"Narrowband","options_c":"Zero bandwidth","options_d":"Infinite","correct_answer":"option_a"},
  {"question":"SNR is often expressed in:","options_a":"Decibels","options_b":"Volts","options_c":"Amperes","options_d":"Hertz","correct_answer":"option_a"},
  {"question":"dB formula for power ratio:","options_a":"10 log10(P1/P2)","options_b":"20 log10(P1/P2)","options_c":"log10(P1/P2)","options_d":"P1/P2","correct_answer":"option_a"},
  {"question":"dB formula for voltage ratio:","options_a":"20 log10(V1/V2)","options_b":"10 log10(V1/V2)","options_c":"log10(V1/V2)","options_d":"V1/V2","correct_answer":"option_a"},
  {"question":"Fourier transform is:","options_a":"Linear","options_b":"Nonlinear","options_c":"Random","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC304 - PC | Semester III | Module III: AM/FM Modulation
-- ============================================================
(md5(random()::text),
 'Modulation Techniques',
 'Module III of Principle of Communication: AM, DSB-SC, SSB, FM, PM, modulation index, bandwidth, transmitter and receiver block diagrams, and superheterodyne receiver.',
 'Principle of Communication','ITC304 - PC','Semester III','IT',
 '[
  {"question":"AM stands for:","options_a":"Amplitude Modulation","options_b":"Angle Modulation","options_c":"Analog Modulation","options_d":"Amplitude Multiplexing","correct_answer":"option_a"},
  {"question":"FM stands for:","options_a":"Frequency Modulation","options_b":"Fast Modulation","options_c":"Frequency Multiplexing","options_d":"Fixed Modulation","correct_answer":"option_a"},
  {"question":"PM stands for:","options_a":"Phase Modulation","options_b":"Pulse Modulation","options_c":"Phase Multiplexing","options_d":"Pulse Multiplexing","correct_answer":"option_a"},
  {"question":"Modulation index of AM:","options_a":"m = Am/Ac","options_b":"m = Ac/Am","options_c":"m = Am*Ac","options_d":"m = Am+Ac","correct_answer":"option_a"},
  {"question":"AM bandwidth:","options_a":"2 fm","options_b":"fm","options_c":"fm/2","options_d":"4 fm","correct_answer":"option_a"},
  {"question":"DSB-SC stands for:","options_a":"Double Sideband Suppressed Carrier","options_b":"Double Sideband Single Carrier","options_c":"Dual Sideband Suppressed Carrier","options_d":"Dual Sideband Single Carrier","correct_answer":"option_a"},
  {"question":"SSB stands for:","options_a":"Single Sideband","options_b":"Single Signal Band","options_c":"Standard Sideband","options_d":"Simple Sideband","correct_answer":"option_a"},
  {"question":"SSB bandwidth:","options_a":"fm","options_b":"2 fm","options_c":"4 fm","options_d":"fm/2","correct_answer":"option_a"},
  {"question":"FM modulation index:","options_a":"β = Δf / fm","options_b":"β = fm / Δf","options_c":"β = Δf * fm","options_d":"β = Δf + fm","correct_answer":"option_a"},
  {"question":"Carson rule for FM bandwidth:","options_a":"2 (Δf + fm)","options_b":"2 Δf","options_c":"2 fm","options_d":"Δf + fm","correct_answer":"option_a"},
  {"question":"FM is:","options_a":"Angle modulation","options_b":"Amplitude modulation","options_c":"Pulse modulation","options_d":"None","correct_answer":"option_a"},
  {"question":"PM is:","options_a":"Angle modulation","options_b":"Amplitude modulation","options_c":"Pulse modulation","options_d":"None","correct_answer":"option_a"},
  {"question":"Advantage of FM over AM:","options_a":"Better noise immunity","options_b":"Smaller bandwidth","options_c":"Simpler circuits","options_d":"None","correct_answer":"option_a"},
  {"question":"Superheterodyne receiver uses:","options_a":"Mixer and local oscillator","options_b":"Only mixer","options_c":"Only oscillator","options_d":"None","correct_answer":"option_a"},
  {"question":"IF in receiver stands for:","options_a":"Intermediate Frequency","options_b":"Internal Frequency","options_c":"Initial Frequency","options_d":"Infinite Frequency","correct_answer":"option_a"},
  {"question":"Envelope detector is used for:","options_a":"AM demodulation","options_b":"FM demodulation","options_c":"PM demodulation","options_d":"None","correct_answer":"option_a"},
  {"question":"FM demodulation uses:","options_a":"Discriminator","options_b":"Envelope detector","options_c":"Product detector","options_d":"None","correct_answer":"option_a"},
  {"question":"Balanced modulator is used for:","options_a":"DSB-SC generation","options_b":"AM generation","options_c":"FM generation","options_d":"PM generation","correct_answer":"option_a"},
  {"question":"Overmodulation in AM causes:","options_a":"Distortion","options_b":"Higher SNR","options_c":"No effect","options_d":"None","correct_answer":"option_a"},
  {"question":"Sideband frequencies in AM:","options_a":"fc ± fm","options_b":"fc only","options_c":"fm only","options_d":"fc ± 2fm","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC304 - PC | Semester III | Module IV: Sampling and Pulse Modulation
-- ============================================================
(md5(random()::text),
 'Sampling and Pulse Modulation',
 'Module IV of Principle of Communication: sampling theorem, aliasing, PAM, PWM, PPM, PCM, quantization, quantization error, companding, and delta modulation.',
 'Principle of Communication','ITC304 - PC','Semester III','IT',
 '[
  {"question":"Sampling theorem:","options_a":"fs >= 2 fm","options_b":"fs < fm","options_c":"fs = fm","options_d":"fs = 0","correct_answer":"option_a"},
  {"question":"Nyquist rate is:","options_a":"2 fm","options_b":"fm","options_c":"fm/2","options_d":"4 fm","correct_answer":"option_a"},
  {"question":"Aliasing occurs when:","options_a":"fs < 2 fm","options_b":"fs >= 2 fm","options_c":"fs = 2 fm","options_d":"Never","correct_answer":"option_a"},
  {"question":"Anti-aliasing filter is:","options_a":"Low-pass","options_b":"High-pass","options_c":"Band-pass","options_d":"Band-stop","correct_answer":"option_a"},
  {"question":"PAM stands for:","options_a":"Pulse Amplitude Modulation","options_b":"Phase Amplitude Modulation","options_c":"Pulse Angle Modulation","options_d":"Phase Angle Modulation","correct_answer":"option_a"},
  {"question":"PWM stands for:","options_a":"Pulse Width Modulation","options_b":"Phase Width Modulation","options_c":"Pulse Wave Modulation","options_d":"Phase Wave Modulation","correct_answer":"option_a"},
  {"question":"PPM stands for:","options_a":"Pulse Position Modulation","options_b":"Phase Position Modulation","options_c":"Pulse Phase Modulation","options_d":"Phase Pulse Modulation","correct_answer":"option_a"},
  {"question":"PCM stands for:","options_a":"Pulse Code Modulation","options_b":"Phase Code Modulation","options_c":"Pulse Cipher Modulation","options_d":"Phase Cipher Modulation","correct_answer":"option_a"},
  {"question":"PCM involves:","options_a":"Sampling, quantization, encoding","options_b":"Only sampling","options_c":"Only quantization","options_d":"Only encoding","correct_answer":"option_a"},
  {"question":"Quantization introduces:","options_a":"Error (noise)","options_b":"Noise-free","options_c":"No effect","options_d":"None","correct_answer":"option_a"},
  {"question":"More quantization levels:","options_a":"Less quantization error","options_b":"More error","options_c":"No effect","options_d":"None","correct_answer":"option_a"},
  {"question":"Companding is:","options_a":"Compressing and expanding","options_b":"Only compressing","options_c":"Only expanding","options_d":"None","correct_answer":"option_a"},
  {"question":"Companding is used to:","options_a":"Reduce quantization error for small signals","options_b":"Increase error","options_c":"No effect","options_d":"None","correct_answer":"option_a"},
  {"question":"Delta modulation transmits:","options_a":"Difference between samples","options_b":"Absolute samples","options_c":"Only sign","options_d":"None","correct_answer":"option_a"},
  {"question":"Slope overload in DM occurs when:","options_a":"Signal slope exceeds step size","options_b":"Signal is constant","options_c":"Signal is small","options_d":"None","correct_answer":"option_a"},
  {"question":"Granular noise in DM occurs when:","options_a":"Signal is small and flat","options_b":"Signal changes fast","options_c":"Signal is large","options_d":"None","correct_answer":"option_a"},
  {"question":"PCM bandwidth is:","options_a":"Higher than analog","options_b":"Lower than analog","options_c":"Same","options_d":"Zero","correct_answer":"option_a"},
  {"question":"A-law and µ-law are:","options_a":"Companding standards","options_b":"Modulation types","options_c":"Filter types","options_d":"Amplifier types","correct_answer":"option_a"},
  {"question":"Bit rate of PCM = n fs where n is:","options_a":"Bits per sample","options_b":"Samples per second","options_c":"Levels","options_d":"None","correct_answer":"option_a"},
  {"question":"Quantization error is:","options_a":"Half of step size (max)","options_b":"Equal to step size","options_c":"Twice step size","options_d":"Zero","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC304 - PC | Semester III | Module V: Multiplexing and Digital Bandpass
-- ============================================================
(md5(random()::text),
 'Multiplexing and Digital Band Pass Modulation',
 'Module V of Principle of Communication: TDM, FDM, OFDM, ASK, FSK, PSK, QPSK, their generation and detection, and applications of OFDM.',
 'Principle of Communication','ITC304 - PC','Semester III','IT',
 '[
  {"question":"Multiplexing is:","options_a":"Combining multiple signals on one channel","options_b":"Splitting one signal","options_c":"Amplifying","options_d":"Filtering","correct_answer":"option_a"},
  {"question":"FDM uses:","options_a":"Different frequencies","options_b":"Different times","options_c":"Different codes","options_d":"Different antennas","correct_answer":"option_a"},
  {"question":"TDM uses:","options_a":"Different time slots","options_b":"Different frequencies","options_c":"Different codes","options_d":"Different antennas","correct_answer":"option_a"},
  {"question":"OFDM uses:","options_a":"Orthogonal subcarriers","options_b":"Single carrier","options_c":"No carrier","options_d":"Random","correct_answer":"option_a"},
  {"question":"OFDM is used in:","options_a":"WiFi, LTE, DVB","options_b":"AM radio only","options_c":"FM only","options_d":"None","correct_answer":"option_a"},
  {"question":"ASK stands for:","options_a":"Amplitude Shift Keying","options_b":"Angle Shift Keying","options_c":"Analog Shift Keying","options_d":"Amplitude Signal Keying","correct_answer":"option_a"},
  {"question":"FSK stands for:","options_a":"Frequency Shift Keying","options_b":"Fast Shift Keying","options_c":"Fixed Shift Keying","options_d":"Frequency Signal Keying","correct_answer":"option_a"},
  {"question":"PSK stands for:","options_a":"Phase Shift Keying","options_b":"Pulse Shift Keying","options_c":"Phase Signal Keying","options_d":"Pulse Signal Keying","correct_answer":"option_a"},
  {"question":"QPSK stands for:","options_a":"Quadrature Phase Shift Keying","options_b":"Quick PSK","options_c":"Quarter PSK","options_d":"Quality PSK","correct_answer":"option_a"},
  {"question":"ASK is susceptible to:","options_a":"Amplitude noise","options_b":"Phase noise","options_c":"Frequency noise","options_d":"None","correct_answer":"option_a"},
  {"question":"FSK is more robust against:","options_a":"Amplitude noise","options_b":"Phase noise","options_c":"Frequency noise","options_d":"None","correct_answer":"option_a"},
  {"question":"PSK has:","options_a":"Constant amplitude","options_b":"Constant frequency","options_c":"Constant phase","options_d":"None","correct_answer":"option_a"},
  {"question":"QPSK transmits:","options_a":"2 bits per symbol","options_b":"1 bit per symbol","options_c":"3 bits per symbol","options_d":"4 bits per symbol","correct_answer":"option_a"},
  {"question":"8-PSK transmits:","options_a":"3 bits per symbol","options_b":"2 bits","options_c":"4 bits","options_d":"1 bit","correct_answer":"option_a"},
  {"question":"Constellation diagram shows:","options_a":"Signal points","options_b":"Time waveform","options_c":"Spectrum","options_d":"None","correct_answer":"option_a"},
  {"question":"BPSK transmits:","options_a":"1 bit per symbol","options_b":"2 bits","options_c":"3 bits","options_d":"4 bits","correct_answer":"option_a"},
  {"question":"FDM requires:","options_a":"Guard bands","options_b":"Guard times","options_c":"Guard codes","options_d":"None","correct_answer":"option_a"},
  {"question":"TDM requires:","options_a":"Synchronization","options_b":"Guard bands","options_c":"Guard codes","options_d":"None","correct_answer":"option_a"},
  {"question":"OFDM advantage:","options_a":"Robust against multipath","options_b":"Simple","options_c":"Low PAPR","options_d":"None","correct_answer":"option_a"},
  {"question":"OFDM disadvantage:","options_a":"High PAPR","options_b":"Low bandwidth","options_c":"No ISI","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC304 - PC | Semester III | Module VI: Radiation and Propagation
-- ============================================================
(md5(random()::text),
 'Radiation and Propagation of Waves',
 'Module VI of Principle of Communication: electromagnetic radiation fundamentals, types of propagation (ground, sky, space wave), tropospheric scatter, fading and applications.',
 'Principle of Communication','ITC304 - PC','Semester III','IT',
 '[
  {"question":"Electromagnetic wave consists of:","options_a":"E and H fields","options_b":"Only E field","options_c":"Only H field","options_d":"Only current","correct_answer":"option_a"},
  {"question":"E and H fields are:","options_a":"Perpendicular to each other","options_b":"Parallel","options_c":"Opposite","options_d":"None","correct_answer":"option_a"},
  {"question":"Wave propagates:","options_a":"Perpendicular to both E and H","options_b":"Along E","options_c":"Along H","options_d":"None","correct_answer":"option_a"},
  {"question":"Ground wave:","options_a":"Follows Earth''s surface","options_b":"Reflects off ionosphere","options_c":"Line of sight","options_d":"Scattered","correct_answer":"option_a"},
  {"question":"Sky wave:","options_a":"Reflects off ionosphere","options_b":"Follows Earth","options_c":"Line of sight","options_d":"Scattered","correct_answer":"option_a"},
  {"question":"Space wave:","options_a":"Line of sight","options_b":"Follows Earth","options_c":"Reflects ionosphere","options_d":"Scattered","correct_answer":"option_a"},
  {"question":"Ground wave used for:","options_a":"LF, MF","options_b":"HF","options_c":"VHF","options_d":"SHF","correct_answer":"option_a"},
  {"question":"Sky wave used for:","options_a":"HF","options_b":"LF","options_c":"VHF","options_d":"SHF","correct_answer":"option_a"},
  {"question":"Space wave used for:","options_a":"VHF, UHF, microwave","options_b":"LF, MF","options_c":"HF","options_d":"None","correct_answer":"option_a"},
  {"question":"Ionosphere reflects:","options_a":"HF waves","options_b":"VHF waves","options_c":"UHF waves","options_d":"Microwaves","correct_answer":"option_a"},
  {"question":"Tropospheric scatter:","options_a":"Scattering in troposphere","options_b":"Reflection in ionosphere","options_c":"Ground wave","options_d":"None","correct_answer":"option_a"},
  {"question":"Fading is:","options_a":"Variation in received signal","options_b":"Constant signal","options_c":"Zero signal","options_d":"None","correct_answer":"option_a"},
  {"question":"Multipath fading caused by:","options_a":"Multiple paths","options_b":"Single path","options_c":"No path","options_d":"None","correct_answer":"option_a"},
  {"question":"Diversity technique reduces:","options_a":"Fading","options_b":"Bandwidth","options_c":"Power","options_d":"None","correct_answer":"option_a"},
  {"question":"Duct propagation:","options_a":"Trapping in atmosphere","options_b":"Reflection","options_c":"Scattering","options_d":"None","correct_answer":"option_a"},
  {"question":"Skip distance:","options_a":"Distance between Tx and first sky wave return","options_b":"Distance from Earth","options_c":"Distance from ionosphere","options_d":"None","correct_answer":"option_a"},
  {"question":"Critical frequency:","options_a":"Max frequency reflected by ionosphere","options_b":"Min frequency","options_c":"Zero frequency","options_d":"None","correct_answer":"option_a"},
  {"question":"MUF stands for:","options_a":"Maximum Usable Frequency","options_b":"Minimum Usable Frequency","options_c":"Max Useful Frequency","options_d":"Min Useful Frequency","correct_answer":"option_a"},
  {"question":"Free-space path loss:","options_a":"Increases with distance and frequency","options_b":"Decreases with distance","options_c":"Constant","options_d":"None","correct_answer":"option_a"},
  {"question":"Antenna gain measured in:","options_a":"dBi","options_b":"dBm","options_c":"Hz","options_d":"Volts","correct_answer":"option_a"},
  {"question":"Radio horizon depends on:","options_a":"Antenna height","options_b":"Frequency only","options_c":"Power","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC305 - PCPF | Semester III | Module I: Programming Paradigms
-- ============================================================
(md5(random()::text),
 'Introduction to Programming Paradigms',
 'Module I of Paradigms and Computer Programming Fundamentals: imperative, object-oriented, functional, logic, concurrent paradigms and comparison of languages.',
 'Paradigms and Computer Programming Fundamentals','ITC305 - PCPF','Semester III','IT',
 '[
  {"question":"Programming paradigm is:","options_a":"Style of programming","options_b":"Language","options_c":"Compiler","options_d":"IDE","correct_answer":"option_a"},
  {"question":"Imperative paradigm focuses on:","options_a":"How to do (statements)","options_b":"What to do","options_c":"Objects only","options_d":"Logic only","correct_answer":"option_a"},
  {"question":"Object-oriented paradigm focuses on:","options_a":"Objects and classes","options_b":"Functions","options_c":"Logic","options_d":"Statements","correct_answer":"option_a"},
  {"question":"Functional paradigm focuses on:","options_a":"Functions and immutability","options_b":"Objects","options_c":"Statements","options_d":"Logic","correct_answer":"option_a"},
  {"question":"Logic paradigm focuses on:","options_a":"Declarative facts and rules","options_b":"Objects","options_c":"Statements","options_d":"Functions","correct_answer":"option_a"},
  {"question":"Concurrent paradigm focuses on:","options_a":"Parallel execution","options_b":"Single thread","options_c":"Objects","options_d":"Logic","correct_answer":"option_a"},
  {"question":"C is:","options_a":"Imperative and procedural","options_b":"Functional","options_c":"Logic","options_d":"Pure OO","correct_answer":"option_a"},
  {"question":"Haskell is:","options_a":"Functional","options_b":"Imperative","options_c":"Logic","options_d":"Procedural","correct_answer":"option_a"},
  {"question":"Prolog is:","options_a":"Logic","options_b":"Functional","options_c":"Imperative","options_d":"OO","correct_answer":"option_a"},
  {"question":"Java is:","options_a":"Object-oriented","options_b":"Functional","options_c":"Logic","options_d":"Procedural only","correct_answer":"option_a"},
  {"question":"Which paradigm avoids side effects?","options_a":"Functional","options_b":"Imperative","options_c":"Procedural","options_d":"OO","correct_answer":"option_a"},
  {"question":"Which paradigm uses inheritance?","options_a":"OO","options_b":"Functional","options_c":"Logic","options_d":"Imperative","correct_answer":"option_a"},
  {"question":"Which paradigm uses unification?","options_a":"Logic","options_b":"OO","options_c":"Functional","options_d":"Imperative","correct_answer":"option_a"},
  {"question":"Which paradigm uses higher-order functions?","options_a":"Functional","options_b":"Imperative","options_c":"Procedural","options_d":"Logic","correct_answer":"option_a"},
  {"question":"Which is a declarative paradigm?","options_a":"Functional and logic","options_b":"Imperative","options_c":"Procedural only","options_d":"OO only","correct_answer":"option_a"},
  {"question":"Which is a common imperative feature?","options_a":"Assignment statement","options_b":"Lambda only","options_c":"Unification","options_d":"Pattern matching","correct_answer":"option_a"},
  {"question":"Which is a common functional feature?","options_a":"Recursion","options_b":"Global state","options_c":"Loops only","options_d":"Pointers","correct_answer":"option_a"},
  {"question":"Which is a common OO feature?","options_a":"Encapsulation","options_b":"Global state","options_c":"Unification","options_d":"Pointers only","correct_answer":"option_a"},
  {"question":"Which is a common logic feature?","options_a":"Backtracking","options_b":"Inheritance","options_c":"Loops","options_d":"Pointers","correct_answer":"option_a"},
  {"question":"Multi-paradigm language example:","options_a":"Python","options_b":"C only","options_c":"Prolog only","options_d":"Haskell only","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC305 - PCPF | Semester III | Module II: Data Abstraction and OO
-- ============================================================
(md5(random()::text),
 'Data Abstraction and Object Orientation',
 'Module II of Paradigms and Computer Programming Fundamentals: abstraction, encapsulation, inheritance, polymorphism, dynamic binding, initialization and finalization, and object-oriented design principles.',
 'Paradigms and Computer Programming Fundamentals','ITC305 - PCPF','Semester III','IT',
 '[
  {"question":"Abstraction means:","options_a":"Hiding details","options_b":"Showing all details","options_c":"Copying code","options_d":"None","correct_answer":"option_a"},
  {"question":"Encapsulation means:","options_a":"Bundling data and methods","options_b":"Separating data and methods","options_c":"Ignoring data","options_d":"Ignoring methods","correct_answer":"option_a"},
  {"question":"Inheritance allows:","options_a":"Reuse of class code","options_b":"Duplicate code","options_c":"Remove code","options_d":"None","correct_answer":"option_a"},
  {"question":"Polymorphism means:","options_a":"Many forms","options_b":"One form","options_c":"No form","options_d":"Random","correct_answer":"option_a"},
  {"question":"Dynamic binding:","options_a":"Resolves method call at runtime","options_b":"At compile time","options_c":"Never","options_d":"None","correct_answer":"option_a"},
  {"question":"Static binding:","options_a":"Resolves at compile time","options_b":"At runtime","options_c":"Never","options_d":"None","correct_answer":"option_a"},
  {"question":"Constructor is used for:","options_a":"Initialization","options_b":"Finalization","options_c":"Copying","options_d":"Deleting","correct_answer":"option_a"},
  {"question":"Destructor is used for:","options_a":"Finalization","options_b":"Initialization","options_c":"Copying","options_d":"Deleting","correct_answer":"option_a"},
  {"question":"Virtual function enables:","options_a":"Dynamic binding","options_b":"Static binding","options_c":"No binding","options_d":"None","correct_answer":"option_a"},
  {"question":"Abstract class:","options_a":"Cannot be instantiated","options_b":"Instantiable","options_c":"Static","options_d":"None","correct_answer":"option_a"},
  {"question":"Interface defines:","options_a":"Only method signatures","options_b":"Only data","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"Multiple inheritance:","options_a":"One class inherits from multiple","options_b":"Multiple inherit from one","options_c":"None","options_d":"Only one","correct_answer":"option_a"},
  {"question":"Method overloading is:","options_a":"Same name, different parameters","options_b":"Same name, same parameters","options_c":"Different names","options_d":"None","correct_answer":"option_a"},
  {"question":"Method overriding:","options_a":"Same name and parameters in subclass","options_b":"Different name","options_c":"Different parameters","options_d":"None","correct_answer":"option_a"},
  {"question":"Access modifier private means:","options_a":"Accessible only in class","options_b":"Accessible everywhere","options_c":"Accessible in package","options_d":"Accessible in subclass","correct_answer":"option_a"},
  {"question":"Access modifier public means:","options_a":"Accessible everywhere","options_b":"In class only","options_c":"In package only","options_d":"In subclass only","correct_answer":"option_a"},
  {"question":"Composition is:","options_a":"HAS-A relationship","options_b":"IS-A relationship","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"Inheritance is:","options_a":"IS-A relationship","options_b":"HAS-A relationship","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"Diamond problem is with:","options_a":"Multiple inheritance","options_b":"Single","options_c":"No inheritance","options_d":"None","correct_answer":"option_a"},
  {"question":"Object is:","options_a":"Instance of class","options_b":"Class itself","options_c":"Method","options_d":"Attribute","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC305 - PCPF | Semester III | Module III: Functional Programming
-- ============================================================
(md5(random()::text),
 'Functional Programming',
 'Module III of Paradigms and Computer Programming Fundamentals: pure functions, immutability, higher-order functions, recursion, lambda expressions, map/filter/reduce and lazy evaluation.',
 'Paradigms and Computer Programming Fundamentals','ITC305 - PCPF','Semester III','IT',
 '[
  {"question":"Pure function:","options_a":"Same output for same input, no side effects","options_b":"Has side effects","options_c":"Random output","options_d":"None","correct_answer":"option_a"},
  {"question":"Immutability means:","options_a":"Data cannot change after creation","options_b":"Data can change","options_c":"Only reads allowed","options_d":"Only writes","correct_answer":"option_a"},
  {"question":"Higher-order function:","options_a":"Takes or returns a function","options_b":"Only takes numbers","options_c":"Only returns numbers","options_d":"None","correct_answer":"option_a"},
  {"question":"Lambda expression:","options_a":"Anonymous function","options_b":"Named function","options_c":"Class","options_d":"Module","correct_answer":"option_a"},
  {"question":"Recursion is preferred in:","options_a":"Functional programming","options_b":"Imperative only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Map applies function to:","options_a":"Each element","options_b":"First element","options_c":"Last element","options_d":"None","correct_answer":"option_a"},
  {"question":"Filter selects elements based on:","options_a":"Predicate","options_b":"Size","options_c":"Index","options_d":"None","correct_answer":"option_a"},
  {"question":"Reduce combines elements via:","options_a":"Binary operation","options_b":"Unary","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Lazy evaluation:","options_a":"Evaluates only when needed","options_b":"Evaluates eagerly","options_c":"Never evaluates","options_d":"None","correct_answer":"option_a"},
  {"question":"Eager evaluation:","options_a":"Evaluates immediately","options_b":"Lazily","options_c":"Never","options_d":"None","correct_answer":"option_a"},
  {"question":"Currying is:","options_a":"Transforming multi-arg to single-arg chain","options_b":"Multi-return","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Function composition:","options_a":"Combining functions","options_b":"Splitting functions","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Tail recursion optimization:","options_a":"Reuses stack frame","options_b":"Adds stack frame","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Haskell is:","options_a":"Pure functional","options_b":"Imperative","options_c":"Logic","options_d":"None","correct_answer":"option_a"},
  {"question":"Monad in Haskell:","options_a":"Abstracts side effects","options_b":"Data type only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Pattern matching is used in:","options_a":"Functional languages","options_b":"Only imperative","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Type inference:","options_a":"Compiler deduces types","options_b":"Programmer specifies","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Referential transparency:","options_a":"Expression can be replaced by value","options_b":"Cannot be replaced","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Side effect in functional:","options_a":"Avoided","options_b":"Encouraged","options_c":"Ignored","options_d":"None","correct_answer":"option_a"},
  {"question":"Closure is:","options_a":"Function with captured environment","options_b":"Loop","options_c":"Class","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC305 - PCPF | Semester III | Module IV: Logic Programming
-- ============================================================
(md5(random()::text),
 'Logic Programming',
 'Module IV of Paradigms and Computer Programming Fundamentals: logic programming basics, facts, rules, unification, backtracking, resolution, and Prolog applications.',
 'Paradigms and Computer Programming Fundamentals','ITC305 - PCPF','Semester III','IT',
 '[
  {"question":"Logic programming is based on:","options_a":"First-order logic","options_b":"Set theory","options_c":"Graph theory","options_d":"Number theory","correct_answer":"option_a"},
  {"question":"Prolog stands for:","options_a":"Programming in Logic","options_b":"Program Logic","options_c":"Procedural Logic","options_d":"Programming Long","correct_answer":"option_a"},
  {"question":"Fact in Prolog:","options_a":"True statement","options_b":"Rule","options_c":"Query","options_d":"Variable","correct_answer":"option_a"},
  {"question":"Rule in Prolog:","options_a":"Head :- Body","options_b":"Head and Body","options_c":"Only Body","options_d":"Only Head","correct_answer":"option_a"},
  {"question":"Unification:","options_a":"Matching terms","options_b":"Sorting","options_c":"Filtering","options_d":"None","correct_answer":"option_a"},
  {"question":"Backtracking:","options_a":"Reverting on failure","options_b":"Never revert","options_c":"Always succeed","options_d":"None","correct_answer":"option_a"},
  {"question":"Resolution:","options_a":"Inference rule","options_b":"Sorting rule","options_c":"Filtering","options_d":"None","correct_answer":"option_a"},
  {"question":"Atom in Prolog:","options_a":"Basic term","options_b":"Complex term","options_c":"Variable","options_d":"None","correct_answer":"option_a"},
  {"question":"Variable in Prolog starts with:","options_a":"Uppercase","options_b":"Lowercase","options_c":"Digit","options_d":"Symbol","correct_answer":"option_a"},
  {"question":"Constant in Prolog starts with:","options_a":"Lowercase","options_b":"Uppercase","options_c":"Digit","options_d":"Symbol","correct_answer":"option_a"},
  {"question":"List in Prolog is:","options_a":"Head and tail","options_b":"Array","options_c":"Matrix","options_d":"None","correct_answer":"option_a"},
  {"question":"Cut operator ! is used to:","options_a":"Prevent backtracking","options_b":"Enable backtracking","options_c":"None","options_d":"Sort","correct_answer":"option_a"},
  {"question":"Recursion in Prolog:","options_a":"Common","options_b":"Not allowed","options_c":"Only loops","options_d":"None","correct_answer":"option_a"},
  {"question":"Query in Prolog:","options_a":"Goal","options_b":"Fact","options_c":"Rule","options_d":"None","correct_answer":"option_a"},
  {"question":"Prolog execution order:","options_a":"Depth-first","options_b":"Breadth-first","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Arithmetic in Prolog uses:","options_a":"is/2","options_b":"sum","options_c":"add","options_d":"None","correct_answer":"option_a"},
  {"question":"Negation as failure:","options_a":"not/1","options_b":"neg/1","options_c":"fail/1","options_d":"None","correct_answer":"option_a"},
  {"question":"Prolog is used in:","options_a":"AI and NLP","options_b":"Numeric computing","options_c":"Web design","options_d":"None","correct_answer":"option_a"},
  {"question":"Assert/retract in Prolog:","options_a":"Modify database","options_b":"Query","options_c":"Print","options_d":"None","correct_answer":"option_a"},
  {"question":"Prolog clauses are:","options_a":"Horn clauses","options_b":"Functional","options_c":"Objects","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC305 - PCPF | Semester III | Module V: Concurrency
-- ============================================================
(md5(random()::text),
 'Concurrency',
 'Module V of Paradigms and Computer Programming Fundamentals: concurrent vs parallel, threads, race conditions, synchronization primitives, message passing, and concurrency models.',
 'Paradigms and Computer Programming Fundamentals','ITC305 - PCPF','Semester III','IT',
 '[
  {"question":"Concurrency is:","options_a":"Multiple tasks progressing","options_b":"Single task","options_c":"No task","options_d":"Random","correct_answer":"option_a"},
  {"question":"Parallelism is:","options_a":"Simultaneous execution","options_b":"Sequential","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Thread is:","options_a":"Lightweight process","options_b":"Heavy process","options_c":"File","options_d":"None","correct_answer":"option_a"},
  {"question":"Race condition:","options_a":"Uncontrolled access to shared data","options_b":"Controlled access","options_c":"No access","options_d":"None","correct_answer":"option_a"},
  {"question":"Mutex is:","options_a":"Mutual exclusion primitive","options_b":"Random access","options_c":"Sorting","options_d":"None","correct_answer":"option_a"},
  {"question":"Semaphore is:","options_a":"Synchronization primitive","options_b":"Random","options_c":"Sorting","options_d":"None","correct_answer":"option_a"},
  {"question":"Monitor is:","options_a":"High-level synchronization","options_b":"Low-level","options_c":"Hardware","options_d":"None","correct_answer":"option_a"},
  {"question":"Message passing:","options_a":"Processes communicate by messages","options_b":"Shared memory only","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Shared memory:","options_a":"Processes share memory","options_b":"Messages only","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Deadlock is:","options_a":"Processes wait for each other","options_b":"Processes finish","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Starvation:","options_a":"Process never gets resource","options_b":"Process gets resource","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Atomic operation:","options_a":"Indivisible","options_b":"Divisible","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Context switch:","options_a":"Switch between threads","options_b":"Switch between files","options_c":"Switch between disks","options_d":"None","correct_answer":"option_a"},
  {"question":"Critical section:","options_a":"Access to shared resource","options_b":"Private section","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Producer-consumer:","options_a":"Classic concurrency problem","options_b":"Sorting problem","options_c":"Searching","options_d":"None","correct_answer":"option_a"},
  {"question":"Dining philosophers:","options_a":"Classic concurrency problem","options_b":"Sorting","options_c":"Searching","options_d":"None","correct_answer":"option_a"},
  {"question":"Readers-writers:","options_a":"Classic concurrency problem","options_b":"Sorting","options_c":"Searching","options_d":"None","correct_answer":"option_a"},
  {"question":"Wait-free:","options_a":"All threads progress","options_b":"Some block","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Lock-free:","options_a":"At least one thread progresses","options_b":"None progress","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Concurrency models:","options_a":"Actor, CSP, threads","options_b":"Only threads","options_c":"Only actors","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC305 - PCPF | Semester III | Module VI: Scripting Languages
-- ============================================================
(md5(random()::text),
 'Scripting Languages',
 'Module VI of Paradigms and Computer Programming Fundamentals: characteristics of scripting languages, dynamic typing, use in shell, web, automation and comparison with compiled languages.',
 'Paradigms and Computer Programming Fundamentals','ITC305 - PCPF','Semester III','IT',
 '[
  {"question":"Scripting language is:","options_a":"Interpreted","options_b":"Compiled only","options_c":"Assembly","options_d":"None","correct_answer":"option_a"},
  {"question":"Common scripting languages:","options_a":"Python, Perl, JavaScript","options_b":"C, C++","options_c":"Java only","options_d":"None","correct_answer":"option_a"},
  {"question":"Dynamic typing:","options_a":"Type at runtime","options_b":"Type at compile","options_c":"Never","options_d":"None","correct_answer":"option_a"},
  {"question":"Scripting is used for:","options_a":"Automation","options_b":"Only embedded","options_c":"Only OS","options_d":"None","correct_answer":"option_a"},
  {"question":"Shell script runs in:","options_a":"Shell","options_b":"Kernel","options_c":"Compiler","options_d":"None","correct_answer":"option_a"},
  {"question":"Bash is:","options_a":"Shell","options_b":"Language","options_c":"Compiler","options_d":"None","correct_answer":"option_a"},
  {"question":"JavaScript is:","options_a":"Web scripting","options_b":"Compiled language","options_c":"OS","options_d":"None","correct_answer":"option_a"},
  {"question":"Python is:","options_a":"General-purpose scripting","options_b":"Only shell","options_c":"Only web","options_d":"None","correct_answer":"option_a"},
  {"question":"Perl is used for:","options_a":"Text processing","options_b":"Graphics","options_c":"OS","options_d":"None","correct_answer":"option_a"},
  {"question":"Scripting languages are often:","options_a":"Faster to develop with","options_b":"Slower to develop with","options_c":"Same","options_d":"None","correct_answer":"option_a"},
  {"question":"Compiled languages are often:","options_a":"Faster at runtime","options_b":"Slower at runtime","options_c":"Same","options_d":"None","correct_answer":"option_a"},
  {"question":"REPL stands for:","options_a":"Read Eval Print Loop","options_b":"Real Eval Print Loop","options_c":"Read Execute Print Loop","options_d":"None","correct_answer":"option_a"},
  {"question":"Regular expressions are used in:","options_a":"Scripting","options_b":"Compiled only","options_c":"Assembly","options_d":"None","correct_answer":"option_a"},
  {"question":"Shebang #! is used in:","options_a":"Shell scripts","options_b":"C programs","options_c":"Java","options_d":"None","correct_answer":"option_a"},
  {"question":"Scripting is used in:","options_a":"DevOps","options_b":"Only embedded","options_c":"Only OS","options_d":"None","correct_answer":"option_a"},
  {"question":"CGI is:","options_a":"Common Gateway Interface","options_b":"Computer Graphics","options_c":"Compiler","options_d":"None","correct_answer":"option_a"},
  {"question":"PHP is:","options_a":"Server-side scripting","options_b":"Client-side","options_c":"Compiler","options_d":"None","correct_answer":"option_a"},
  {"question":"Node.js allows:","options_a":"JavaScript on server","options_b":"Only client","options_c":"Only OS","options_d":"None","correct_answer":"option_a"},
  {"question":"Awk is used for:","options_a":"Text processing","options_b":"Graphics","options_c":"OS","options_d":"None","correct_answer":"option_a"},
  {"question":"Sed is used for:","options_a":"Stream editing","options_b":"Compiling","options_c":"Linking","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC401 - EM4 | Semester IV | Module I: Linear Algebra
-- ============================================================
(md5(random()::text),
 'Linear Algebra',
 'Module I of Engineering Mathematics-IV: eigenvalues and eigenvectors, characteristic equation, Cayley-Hamilton theorem, similarity of matrices, diagonalization, and quadratic forms.',
 'Engineering Mathematics-IV','ITC401 - EM4','Semester IV','IT',
 '[
  {"question":"Characteristic equation of a matrix A:","options_a":"|A - λI| = 0","options_b":"|A| = 0","options_c":"A = 0","options_d":"I = 0","correct_answer":"option_a"},
  {"question":"Eigenvalue λ satisfies:","options_a":"Av = λv","options_b":"Av = 0","options_c":"A = λ","options_d":"v = 0","correct_answer":"option_a"},
  {"question":"Eigenvector v satisfies:","options_a":"(A - λI) v = 0","options_b":"Av = 0","options_c":"v = 0","options_d":"A = 0","correct_answer":"option_a"},
  {"question":"Sum of eigenvalues equals:","options_a":"Trace of matrix","options_b":"Determinant","options_c":"Rank","options_d":"None","correct_answer":"option_a"},
  {"question":"Product of eigenvalues equals:","options_a":"Determinant","options_b":"Trace","options_c":"Rank","options_d":"None","correct_answer":"option_a"},
  {"question":"Cayley-Hamilton theorem:","options_a":"Matrix satisfies its characteristic equation","options_b":"Matrix is 0","options_c":"Matrix is I","options_d":"None","correct_answer":"option_a"},
  {"question":"Similar matrices have:","options_a":"Same eigenvalues","options_b":"Different eigenvalues","options_c":"Same trace only","options_d":"None","correct_answer":"option_a"},
  {"question":"Diagonalizable matrix:","options_a":"Similar to diagonal matrix","options_b":"Not similar","options_c":"Only symmetric","options_d":"None","correct_answer":"option_a"},
  {"question":"Symmetric matrix has:","options_a":"Real eigenvalues","options_b":"Complex only","options_c":"Imaginary","options_d":"None","correct_answer":"option_a"},
  {"question":"Orthogonal matrix:","options_a":"A^T A = I","options_b":"A^T = A","options_c":"A = I","options_d":"None","correct_answer":"option_a"},
  {"question":"Quadratic form:","options_a":"x^T A x","options_b":"x + A","options_c":"x * A","options_d":"None","correct_answer":"option_a"},
  {"question":"Positive definite:","options_a":"All eigenvalues positive","options_b":"All negative","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Negative definite:","options_a":"All eigenvalues negative","options_b":"All positive","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Indefinite:","options_a":"Mixed sign eigenvalues","options_b":"All positive","options_c":"All negative","options_d":"Zero","correct_answer":"option_a"},
  {"question":"Rank of matrix:","options_a":"Number of independent rows/columns","options_b":"Determinant","options_c":"Trace","options_d":"None","correct_answer":"option_a"},
  {"question":"Nullity = :","options_a":"n - rank","options_b":"n + rank","options_c":"n * rank","options_d":"rank","correct_answer":"option_a"},
  {"question":"Eigenvalues of triangular matrix:","options_a":"Diagonal entries","options_b":"Off-diagonal","options_c":"Sum","options_d":"None","correct_answer":"option_a"},
  {"question":"Eigenvalues of I:","options_a":"All 1","options_b":"All 0","options_c":"Mixed","options_d":"None","correct_answer":"option_a"},
  {"question":"Eigenvalues of zero matrix:","options_a":"All 0","options_b":"All 1","options_c":"Mixed","options_d":"None","correct_answer":"option_a"},
  {"question":"Similarity transformation:","options_a":"P^{-1} A P","options_b":"P A P^{-1}","options_c":"A + P","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC401 - EM4 | Semester IV | Module II: Complex Integration
-- ============================================================
(md5(random()::text),
 'Complex Integration',
 'Module II of Engineering Mathematics-IV: line integrals, Cauchy integral theorem, Cauchy integral formula, Taylor and Laurent series, singularities, poles, residues and Cauchy residue theorem.',
 'Engineering Mathematics-IV','ITC401 - EM4','Semester IV','IT',
 '[
  {"question":"Line integral in complex plane:","options_a":"Integral along a curve","options_b":"Integral over an area","options_c":"Integral over a volume","options_d":"None","correct_answer":"option_a"},
  {"question":"Cauchy integral theorem:","options_a":"Integral of analytic function on closed curve is zero","options_b":"Integral is infinity","options_c":"Integral is 1","options_d":"None","correct_answer":"option_a"},
  {"question":"Cauchy integral formula:","options_a":"f(a) = (1/2πi) ∮ f(z)/(z-a) dz","options_b":"∮ f(z) dz = 0","options_c":"f(a) = 0","options_d":"None","correct_answer":"option_a"},
  {"question":"Taylor series is valid:","options_a":"Inside analytic region","options_b":"Outside","options_c":"On boundary","options_d":"None","correct_answer":"option_a"},
  {"question":"Laurent series includes:","options_a":"Negative powers","options_b":"Only positive powers","options_c":"Only constant","options_d":"None","correct_answer":"option_a"},
  {"question":"Singularity:","options_a":"Point where f not analytic","options_b":"Point where f analytic","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Pole is:","options_a":"Specific type of singularity","options_b":"Zero","options_c":"Regular point","options_d":"None","correct_answer":"option_a"},
  {"question":"Residue is:","options_a":"Coefficient of 1/(z-a)","options_b":"Coefficient of (z-a)","options_c":"Constant term","options_d":"None","correct_answer":"option_a"},
  {"question":"Cauchy residue theorem:","options_a":"∮ f dz = 2πi (sum of residues)","options_b":"∮ f dz = 0","options_c":"∮ f dz = 1","options_d":"None","correct_answer":"option_a"},
  {"question":"Zero of order n:","options_a":"f(z) = (z-a)^n g(z), g(a) ≠ 0","options_b":"f(a)=0 only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Pole of order n:","options_a":"f(z) = g(z)/(z-a)^n, g(a) ≠ 0","options_b":"f(a)=0","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Removable singularity:","options_a":"Can be removed by redefinition","options_b":"Cannot be removed","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Essential singularity:","options_a":"Neither removable nor pole","options_b":"Removable","options_c":"Pole","options_d":"None","correct_answer":"option_a"},
  {"question":"Residue at simple pole:","options_a":"lim (z-a) f(z)","options_b":"lim f(z)","options_c":"lim f''(z)","options_d":"None","correct_answer":"option_a"},
  {"question":"Residue at infinity:","options_a":"Negative of sum of finite residues","options_b":"Sum of finite residues","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Analytic function has:","options_a":"Taylor series","options_b":"Laurent only","options_c":"Fourier only","options_d":"None","correct_answer":"option_a"},
  {"question":"Meromorphic function:","options_a":"Analytic except poles","options_b":"Analytic everywhere","options_c":"Nowhere analytic","options_d":"None","correct_answer":"option_a"},
  {"question":"Entire function:","options_a":"Analytic everywhere","options_b":"Poles","options_c":"Singularities","options_d":"None","correct_answer":"option_a"},
  {"question":"Liouville theorem:","options_a":"Bounded entire function is constant","options_b":"Unbounded","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Maximum modulus principle:","options_a":"Max on boundary","options_b":"Max inside","options_c":"No max","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC401 - EM4 | Semester IV | Module III: Z Transform
-- ============================================================
(md5(random()::text),
 'Z Transform',
 'Module III of Engineering Mathematics-IV: definition, ROC, Z transform of standard sequences, properties, inverse Z transform and convolution.',
 'Engineering Mathematics-IV','ITC401 - EM4','Semester IV','IT',
 '[
  {"question":"Z transform of x[n] is:","options_a":"Sum x[n] z^(-n)","options_b":"Sum x[n] z^n","options_c":"Sum x[n]","options_d":"None","correct_answer":"option_a"},
  {"question":"ROC stands for:","options_a":"Region of Convergence","options_b":"Range of Continuity","options_c":"Rate of Change","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of δ[n] is:","options_a":"1","options_b":"z","options_c":"1/z","options_d":"0","correct_answer":"option_a"},
  {"question":"Z transform of u[n] is:","options_a":"z/(z-1)","options_b":"1/(z-1)","options_c":"z","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of a^n u[n]:","options_a":"z/(z-a)","options_b":"1/(z-a)","options_c":"z-a","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of n a^n u[n]:","options_a":"az/(z-a)^2","options_b":"z/(z-a)","options_c":"1/(z-a)^2","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of sin(ωn)u[n]:","options_a":"z sin ω/(z^2 - 2z cos ω + 1)","options_b":"z/(z^2+1)","options_c":"1/(z^2+1)","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of cos(ωn)u[n]:","options_a":"z(z - cos ω)/(z^2 - 2z cos ω + 1)","options_b":"z/(z^2+1)","options_c":"1/(z^2+1)","options_d":"None","correct_answer":"option_a"},
  {"question":"Shifting property:","options_a":"x[n-k] ↔ z^(-k) X(z)","options_b":"z^(k) X(z)","options_c":"X(z)","options_d":"None","correct_answer":"option_a"},
  {"question":"Convolution theorem:","options_a":"x[n]*y[n] ↔ X(z)Y(z)","options_b":"X(z)/Y(z)","options_c":"X+Y","options_d":"None","correct_answer":"option_a"},
  {"question":"Inverse Z transform by:","options_a":"Partial fractions","options_b":"Taylor","options_c":"Fourier","options_d":"None","correct_answer":"option_a"},
  {"question":"Initial value theorem:","options_a":"x[0] = lim X(z) as z→∞","options_b":"lim X(z) as z→0","options_c":"X(1)","options_d":"None","correct_answer":"option_a"},
  {"question":"Final value theorem:","options_a":"x[∞] = lim (z-1)X(z) as z→1","options_b":"lim X(z) as z→0","options_c":"X(∞)","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of x[-n]:","options_a":"X(1/z)","options_b":"X(z)","options_c":"X(-z)","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform of n x[n]:","options_a":"-z dX/dz","options_b":"z dX/dz","options_c":"X(z)/z","options_d":"None","correct_answer":"option_a"},
  {"question":"Multiplication by a^n:","options_a":"X(z/a)","options_b":"X(az)","options_c":"X(z)","options_d":"None","correct_answer":"option_a"},
  {"question":"Time reversal:","options_a":"X(1/z)","options_b":"X(z)","options_c":"-X(z)","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform is:","options_a":"Linear","options_b":"Nonlinear","options_c":"Neither","options_d":"None","correct_answer":"option_a"},
  {"question":"Z transform used for:","options_a":"Discrete-time systems","options_b":"Continuous systems","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"DTFT is Z transform evaluated at:","options_a":"z = e^(jω)","options_b":"z = 1","options_c":"z = 0","options_d":"z = ∞","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC401 - EM4 | Semester IV | Module IV: Probability Distribution and Sampling
-- ============================================================
(md5(random()::text),
 'Probability Distribution and Sampling',
 'Module IV of Engineering Mathematics-IV: Poisson and normal distributions, sampling distributions, hypothesis testing, t-test, chi-square test, goodness of fit and independence of attributes.',
 'Engineering Mathematics-IV','ITC401 - EM4','Semester IV','IT',
 '[
  {"question":"Poisson distribution mean equals:","options_a":"λ","options_b":"λ^2","options_c":"1/λ","options_d":"sqrt(λ)","correct_answer":"option_a"},
  {"question":"Poisson variance equals:","options_a":"λ","options_b":"λ^2","options_c":"1/λ","options_d":"sqrt(λ)","correct_answer":"option_a"},
  {"question":"Normal distribution is:","options_a":"Symmetric bell-shaped","options_b":"Skewed","options_c":"Uniform","options_d":"None","correct_answer":"option_a"},
  {"question":"Standard normal mean:","options_a":"0","options_b":"1","options_c":"-1","options_d":"2","correct_answer":"option_a"},
  {"question":"Standard normal variance:","options_a":"1","options_b":"0","options_c":"2","options_d":"4","correct_answer":"option_a"},
  {"question":"Z score:","options_a":"(x - μ) / σ","options_b":"x + μ","options_c":"x - μ","options_d":"x / μ","correct_answer":"option_a"},
  {"question":"Sampling distribution of mean has:","options_a":"Mean μ, SD σ/√n","options_b":"Mean 0","options_c":"SD σ","options_d":"None","correct_answer":"option_a"},
  {"question":"Level of significance is:","options_a":"α","options_b":"β","options_c":"γ","options_d":"δ","correct_answer":"option_a"},
  {"question":"Critical region is:","options_a":"Region of rejection","options_b":"Region of acceptance","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"One-tailed test:","options_a":"Rejection on one side","options_b":"Both sides","options_c":"Neither","options_d":"None","correct_answer":"option_a"},
  {"question":"Two-tailed test:","options_a":"Rejection on both sides","options_b":"One side","options_c":"Neither","options_d":"None","correct_answer":"option_a"},
  {"question":"Degrees of freedom:","options_a":"n - 1","options_b":"n","options_c":"n + 1","options_d":"None","correct_answer":"option_a"},
  {"question":"t-test is for:","options_a":"Small samples","options_b":"Large samples","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Chi-square test is for:","options_a":"Goodness of fit","options_b":"Mean","options_c":"Variance","options_d":"None","correct_answer":"option_a"},
  {"question":"Chi-square is also used for:","options_a":"Independence of attributes","options_b":"Mean","options_c":"Median","options_d":"Mode","correct_answer":"option_a"},
  {"question":"Contingency table is for:","options_a":"Chi-square test","options_b":"t-test","options_c":"Z-test","options_d":"F-test","correct_answer":"option_a"},
  {"question":"Null hypothesis H0:","options_a":"No significant difference","options_b":"Significant difference","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Alternative hypothesis H1:","options_a":"Significant difference","options_b":"No difference","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Type I error:","options_a":"Reject true H0","options_b":"Accept false H0","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Type II error:","options_a":"Accept false H0","options_b":"Reject true H0","options_c":"None","options_d":"Random","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC401 - EM4 | Semester IV | Module V: Linear Programming
-- ============================================================
(md5(random()::text),
 'Linear Programming Problems',
 'Module V of Engineering Mathematics-IV: LPP formulation, graphical method, simplex method, Big-M method, two-phase method, duality, dual simplex method, and sensitivity analysis.',
 'Engineering Mathematics-IV','ITC401 - EM4','Semester IV','IT',
 '[
  {"question":"LPP stands for:","options_a":"Linear Programming Problem","options_b":"Linear Process Problem","options_c":"Linear Product Problem","options_d":"None","correct_answer":"option_a"},
  {"question":"Objective function in LPP is:","options_a":"Linear","options_b":"Quadratic","options_c":"Cubic","options_d":"None","correct_answer":"option_a"},
  {"question":"Constraints in LPP are:","options_a":"Linear inequalities/equalities","options_b":"Nonlinear","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Graphical method is for:","options_a":"Two variables","options_b":"Three variables","options_c":"Any","options_d":"None","correct_answer":"option_a"},
  {"question":"Feasible region:","options_a":"Set of all feasible points","options_b":"Optimal","options_c":"Infeasible","options_d":"None","correct_answer":"option_a"},
  {"question":"Optimal solution is:","options_a":"Best feasible","options_b":"Worst feasible","options_c":"Infeasible","options_d":"None","correct_answer":"option_a"},
  {"question":"Slack variables are added to:","options_a":"≤ constraints","options_b":"≥ constraints","options_c":"= constraints","options_d":"None","correct_answer":"option_a"},
  {"question":"Surplus variables are added to:","options_a":"≥ constraints","options_b":"≤ constraints","options_c":"= constraints","options_d":"None","correct_answer":"option_a"},
  {"question":"Artificial variables are used in:","options_a":"Big-M method","options_b":"Graphical","options_c":"Simplex only","options_d":"None","correct_answer":"option_a"},
  {"question":"Simplex method works on:","options_a":"Basic feasible solution","options_b":"Any feasible","options_c":"Infeasible","options_d":"None","correct_answer":"option_a"},
  {"question":"Dual of LPP has:","options_a":"Same optimal value","options_b":"Different optimal","options_c":"No relation","options_d":"None","correct_answer":"option_a"},
  {"question":"Dual Simplex method handles:","options_a":"Negative RHS","options_b":"Positive RHS","options_c":"Zero RHS","options_d":"None","correct_answer":"option_a"},
  {"question":"Sensitivity analysis studies:","options_a":"Effect of changes in parameters","options_b":"Optimal solution only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Unbounded solution means:","options_a":"Objective can be arbitrarily improved","options_b":"No solution","options_c":"Infeasible","options_d":"None","correct_answer":"option_a"},
  {"question":"Infeasible solution means:","options_a":"No feasible point","options_b":"Optimal exists","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Degeneracy in LPP:","options_a":"Basic variable zero","options_b":"Basic variable nonzero","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Pivot element in simplex:","options_a":"Key element","options_b":"Any element","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Reduced cost in simplex:","options_a":"Coefficient of nonbasic","options_b":"Coefficient of basic","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Shadow price is:","options_a":"Change in objective per unit RHS","options_b":"Objective","options_c":"Constraint","options_d":"None","correct_answer":"option_a"},
  {"question":"Dual simplex starts with:","options_a":"Infeasible optimal","options_b":"Feasible","options_c":"None","options_d":"Random","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC401 - EM4 | Semester IV | Module VI: Nonlinear Programming
-- ============================================================
(md5(random()::text),
 'Nonlinear Programming Problems',
 'Module VI of Engineering Mathematics-IV: NLPP with equality and inequality constraints, Lagrange multipliers, Kuhn-Tucker conditions, and unconstrained optimization methods.',
 'Engineering Mathematics-IV','ITC401 - EM4','Semester IV','IT',
 '[
  {"question":"NLPP stands for:","options_a":"Nonlinear Programming Problem","options_b":"Nonlinear Process Problem","options_c":"Natural LPP","options_d":"None","correct_answer":"option_a"},
  {"question":"Lagrange multipliers are used for:","options_a":"Equality constraints","options_b":"Inequality","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Kuhn-Tucker conditions are for:","options_a":"Inequality constraints","options_b":"Equality","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"K-T conditions are:","options_a":"Necessary","options_b":"Sufficient","options_c":"Both","options_d":"None","correct_answer":"option_c"},
  {"question":"Unconstrained optimization finds:","options_a":"Stationary points","options_b":"Boundary","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Golden search method is for:","options_a":"One-dimensional search","options_b":"Two-dimensional","options_c":"Multi","options_d":"None","correct_answer":"option_a"},
  {"question":"Newton method uses:","options_a":"Derivative","options_b":"Only value","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Gradient search uses:","options_a":"Gradient","options_b":"Only value","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Local minimum is:","options_a":"Neighborhood minimum","options_b":"Global","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Global minimum is:","options_a":"Overall minimum","options_b":"Local","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Hessian matrix is:","options_a":"Second derivatives","options_b":"First derivatives","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Positive definite Hessian:","options_a":"Local minimum","options_b":"Local maximum","options_c":"Saddle","options_d":"None","correct_answer":"option_a"},
  {"question":"Negative definite Hessian:","options_a":"Local maximum","options_b":"Local minimum","options_c":"Saddle","options_d":"None","correct_answer":"option_a"},
  {"question":"Indefinite Hessian:","options_a":"Saddle point","options_b":"Minimum","options_c":"Maximum","options_d":"None","correct_answer":"option_a"},
  {"question":"Active constraint:","options_a":"Satisfied as equality","options_b":"Not active","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Inactive constraint:","options_a":"Satisfied as strict inequality","options_b":"Active","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Complementary slackness:","options_a":"λ_i g_i = 0","options_b":"λ_i + g_i = 0","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"NLPP is generally:","options_a":"Harder than LPP","options_b":"Easier than LPP","options_c":"Same","options_d":"None","correct_answer":"option_a"},
  {"question":"Convex function:","options_a":"Local min is global","options_b":"No min","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Concave function:","options_a":"Local max is global","options_b":"No max","options_c":"None","options_d":"Random","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC402 - CNND | Semester IV | Module I: Introduction to Networks
-- ============================================================
(md5(random()::text),
 'Introduction to Computer Networks',
 'Module I of Computer Network and Network Design: uses of networks, network hardware, software, protocol layering, OSI and TCP/IP models, comparison and network devices.',
 'Computer Network and Network Design','ITC402 - CNND','Semester IV','IT',
 '[
  {"question":"Network is:","options_a":"Interconnected devices","options_b":"Single device","options_c":"File","options_d":"None","correct_answer":"option_a"},
  {"question":"LAN stands for:","options_a":"Local Area Network","options_b":"Long Area Network","options_c":"Large Area Network","options_d":"None","correct_answer":"option_a"},
  {"question":"WAN stands for:","options_a":"Wide Area Network","options_b":"Wireless Area Network","options_c":"Wired Area Network","options_d":"None","correct_answer":"option_a"},
  {"question":"MAN stands for:","options_a":"Metropolitan Area Network","options_b":"Main Area Network","options_c":"Metro Access Network","options_d":"None","correct_answer":"option_a"},
  {"question":"OSI stands for:","options_a":"Open Systems Interconnection","options_b":"Open Source Interface","options_c":"Online Systems Interface","options_d":"None","correct_answer":"option_a"},
  {"question":"OSI has:","options_a":"7 layers","options_b":"5 layers","options_c":"4 layers","options_d":"3 layers","correct_answer":"option_a"},
  {"question":"TCP/IP has:","options_a":"4 layers","options_b":"7 layers","options_c":"5 layers","options_d":"3 layers","correct_answer":"option_a"},
  {"question":"Physical layer deals with:","options_a":"Bits","options_b":"Frames","options_c":"Packets","options_d":"Segments","correct_answer":"option_a"},
  {"question":"Data link layer deals with:","options_a":"Frames","options_b":"Bits","options_c":"Packets","options_d":"Segments","correct_answer":"option_a"},
  {"question":"Network layer deals with:","options_a":"Packets","options_b":"Bits","options_c":"Frames","options_d":"Segments","correct_answer":"option_a"},
  {"question":"Transport layer deals with:","options_a":"Segments","options_b":"Bits","options_c":"Frames","options_d":"Packets","correct_answer":"option_a"},
  {"question":"Application layer deals with:","options_a":"User services","options_b":"Bits","options_c":"Frames","options_d":"Packets","correct_answer":"option_a"},
  {"question":"Hub is:","options_a":"Layer 1 device","options_b":"Layer 2","options_c":"Layer 3","options_d":"Layer 4","correct_answer":"option_a"},
  {"question":"Switch is:","options_a":"Layer 2 device","options_b":"Layer 1","options_c":"Layer 3","options_d":"Layer 4","correct_answer":"option_a"},
  {"question":"Router is:","options_a":"Layer 3 device","options_b":"Layer 1","options_c":"Layer 2","options_d":"Layer 4","correct_answer":"option_a"},
  {"question":"Protocol is:","options_a":"Set of rules","options_b":"Device","options_c":"Cable","options_d":"None","correct_answer":"option_a"},
  {"question":"Topology is:","options_a":"Arrangement of nodes","options_b":"Protocol","options_c":"Cable","options_d":"None","correct_answer":"option_a"},
  {"question":"Star topology uses:","options_a":"Central hub","options_b":"Ring","options_c":"Bus","options_d":"Mesh","correct_answer":"option_a"},
  {"question":"Mesh topology has:","options_a":"Many links","options_b":"One link","options_c":"Ring","options_d":"None","correct_answer":"option_a"},
  {"question":"Bus topology uses:","options_a":"Single backbone","options_b":"Ring","options_c":"Star","options_d":"Mesh","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC402 - CNND | Semester IV | Module II: Physical and Data Link Layer
-- ============================================================
(md5(random()::text),
 'Physical and Data Link Layer',
 'Module II of Computer Network and Network Design: guided and unguided media, switching, DLL design issues, error detection and correction, flow control, MAC protocols, and Ethernet.',
 'Computer Network and Network Design','ITC402 - CNND','Semester IV','IT',
 '[
  {"question":"Guided media includes:","options_a":"Twisted pair, coax, fiber","options_b":"Radio","options_c":"Microwave","options_d":"Infrared","correct_answer":"option_a"},
  {"question":"Unguided media includes:","options_a":"Radio, microwave","options_b":"Twisted pair","options_c":"Coax","options_d":"Fiber","correct_answer":"option_a"},
  {"question":"Circuit switching:","options_a":"Dedicated path","options_b":"Shared path","options_c":"Packet path","options_d":"None","correct_answer":"option_a"},
  {"question":"Packet switching:","options_a":"Shared path with packets","options_b":"Dedicated","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Error detection uses:","options_a":"Parity, CRC, checksum","options_b":"Amplifier","options_c":"Filter","options_d":"None","correct_answer":"option_a"},
  {"question":"CRC stands for:","options_a":"Cyclic Redundancy Check","options_b":"Cyclic Random Check","options_c":"Code Redundancy Check","options_d":"None","correct_answer":"option_a"},
  {"question":"Hamming code:","options_a":"Error correction","options_b":"Error detection","options_c":"Flow control","options_d":"None","correct_answer":"option_a"},
  {"question":"Stop-and-wait:","options_a":"Flow control","options_b":"Error correction","options_c":"Routing","options_d":"None","correct_answer":"option_a"},
  {"question":"Sliding window is:","options_a":"Flow control","options_b":"Error detection","options_c":"Routing","options_d":"None","correct_answer":"option_a"},
  {"question":"Go-Back-N uses:","options_a":"Sliding window","options_b":"Stop-and-wait","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Selective Repeat uses:","options_a":"Sliding window","options_b":"Stop-and-wait","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Piggybacking:","options_a":"ACK with data","options_b":"Separate ACK","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"HDLC is:","options_a":"Data link protocol","options_b":"Network","options_c":"Transport","options_d":"None","correct_answer":"option_a"},
  {"question":"MAC stands for:","options_a":"Medium Access Control","options_b":"Multiple Access Control","options_c":"Medium Access Code","options_d":"None","correct_answer":"option_a"},
  {"question":"CSMA/CD is:","options_a":"Carrier Sense Multiple Access with Collision Detection","options_b":"Collision Avoidance","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"CSMA/CA is:","options_a":"Carrier Sense Multiple Access with Collision Avoidance","options_b":"Collision Detection","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Ethernet is:","options_a":"IEEE 802.3","options_b":"802.11","options_c":"802.15","options_d":"802.16","correct_answer":"option_a"},
  {"question":"WiFi is:","options_a":"IEEE 802.11","options_b":"802.3","options_c":"802.15","options_d":"802.16","correct_answer":"option_a"},
  {"question":"Gigabit Ethernet speed:","options_a":"1000 Mbps","options_b":"100 Mbps","options_c":"10 Mbps","options_d":"10000 Mbps","correct_answer":"option_a"},
  {"question":"10-Gigabit Ethernet speed:","options_a":"10000 Mbps","options_b":"1000 Mbps","options_c":"100 Mbps","options_d":"10 Mbps","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC402 - CNND | Semester IV | Module III: Network Layer
-- ============================================================
(md5(random()::text),
 'Network Layer',
 'Module III of Computer Network and Network Design: services, IPv4 addressing, subnetting, NAT, routing algorithms (distance vector, link state, path vector), protocols RIP, OSPF, BGP, and IPv6.',
 'Computer Network and Network Design','ITC402 - CNND','Semester IV','IT',
 '[
  {"question":"Network layer provides:","options_a":"Host-to-host delivery","options_b":"Process-to-process","options_c":"Bit transmission","options_d":"None","correct_answer":"option_a"},
  {"question":"IPv4 address size:","options_a":"32 bits","options_b":"64 bits","options_c":"128 bits","options_d":"16 bits","correct_answer":"option_a"},
  {"question":"IPv6 address size:","options_a":"128 bits","options_b":"32 bits","options_c":"64 bits","options_d":"16 bits","correct_answer":"option_a"},
  {"question":"Class A range:","options_a":"1-126","options_b":"128-191","options_c":"192-223","options_d":"224-239","correct_answer":"option_a"},
  {"question":"Class B range:","options_a":"128-191","options_b":"1-126","options_c":"192-223","options_d":"224-239","correct_answer":"option_a"},
  {"question":"Class C range:","options_a":"192-223","options_b":"1-126","options_c":"128-191","options_d":"224-239","correct_answer":"option_a"},
  {"question":"Subnetting divides:","options_a":"Network into subnets","options_b":"Subnet into networks","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"NAT stands for:","options_a":"Network Address Translation","options_b":"Network Access Translation","options_c":"Network Address Transfer","options_d":"None","correct_answer":"option_a"},
  {"question":"DHCP provides:","options_a":"Dynamic IP","options_b":"Static IP only","options_c":"MAC only","options_d":"None","correct_answer":"option_a"},
  {"question":"Distance vector routing uses:","options_a":"Bellman-Ford","options_b":"Dijkstra","options_c":"Prim","options_d":"Kruskal","correct_answer":"option_a"},
  {"question":"Link state routing uses:","options_a":"Dijkstra","options_b":"Bellman-Ford","options_c":"Prim","options_d":"Kruskal","correct_answer":"option_a"},
  {"question":"RIP is:","options_a":"Distance vector","options_b":"Link state","options_c":"Path vector","options_d":"None","correct_answer":"option_a"},
  {"question":"OSPF is:","options_a":"Link state","options_b":"Distance vector","options_c":"Path vector","options_d":"None","correct_answer":"option_a"},
  {"question":"BGP is:","options_a":"Path vector","options_b":"Distance vector","options_c":"Link state","options_d":"None","correct_answer":"option_a"},
  {"question":"RIP max hop count:","options_a":"15","options_b":"16","options_c":"255","options_d":"32","correct_answer":"option_a"},
  {"question":"Count-to-infinity is:","options_a":"RIP problem","options_b":"OSPF problem","options_c":"BGP problem","options_d":"None","correct_answer":"option_a"},
  {"question":"IPv6 transition uses:","options_a":"Tunneling and dual stack","options_b":"Only tunneling","options_c":"Only dual stack","options_d":"None","correct_answer":"option_a"},
  {"question":"IPv4 header min size:","options_a":"20 bytes","options_b":"40 bytes","options_c":"60 bytes","options_d":"8 bytes","correct_answer":"option_a"},
  {"question":"IPv6 header size:","options_a":"40 bytes","options_b":"20 bytes","options_c":"60 bytes","options_d":"8 bytes","correct_answer":"option_a"},
  {"question":"Fragmentation is done by:","options_a":"Routers","options_b":"Hosts only","options_c":"Switches","options_d":"Hubs","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC402 - CNND | Semester IV | Module IV: Transport and Session Layer
-- ============================================================
(md5(random()::text),
 'Transport and Session Layer',
 'Module IV of Computer Network and Network Design: transport services, UDP, TCP, connection management, flow control, congestion control, and session layer with RPC.',
 'Computer Network and Network Design','ITC402 - CNND','Semester IV','IT',
 '[
  {"question":"Transport layer provides:","options_a":"Process-to-process delivery","options_b":"Host-to-host","options_c":"Bit transmission","options_d":"None","correct_answer":"option_a"},
  {"question":"UDP is:","options_a":"Connectionless","options_b":"Connection-oriented","options_c":"Reliable","options_d":"None","correct_answer":"option_a"},
  {"question":"TCP is:","options_a":"Connection-oriented","options_b":"Connectionless","options_c":"Unreliable","options_d":"None","correct_answer":"option_a"},
  {"question":"UDP header size:","options_a":"8 bytes","options_b":"20 bytes","options_c":"40 bytes","options_d":"60 bytes","correct_answer":"option_a"},
  {"question":"TCP header min size:","options_a":"20 bytes","options_b":"8 bytes","options_c":"40 bytes","options_d":"60 bytes","correct_answer":"option_a"},
  {"question":"TCP connection setup:","options_a":"Three-way handshake","options_b":"Two-way","options_c":"Four-way","options_d":"None","correct_answer":"option_a"},
  {"question":"TCP connection teardown:","options_a":"Four-way","options_b":"Three-way","options_c":"Two-way","options_d":"None","correct_answer":"option_a"},
  {"question":"TCP flow control uses:","options_a":"Sliding window","options_b":"Stop-and-wait","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"TCP congestion control:","options_a":"Slow start, AIMD","options_b":"Static","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"TCP uses:","options_a":"Sequence numbers","options_b":"No numbering","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"UDP is used for:","options_a":"DNS, streaming","options_b":"File transfer","options_c":"Email","options_d":"None","correct_answer":"option_a"},
  {"question":"TCP is used for:","options_a":"HTTP, FTP, SMTP","options_b":"DNS","options_c":"VoIP","options_d":"None","correct_answer":"option_a"},
  {"question":"Port number size:","options_a":"16 bits","options_b":"32 bits","options_c":"8 bits","options_d":"64 bits","correct_answer":"option_a"},
  {"question":"Well-known ports range:","options_a":"0-1023","options_b":"1024-49151","options_c":"49152-65535","options_d":"None","correct_answer":"option_a"},
  {"question":"RPC stands for:","options_a":"Remote Procedure Call","options_b":"Remote Process Call","options_c":"Random Procedure Call","options_d":"None","correct_answer":"option_a"},
  {"question":"Session layer manages:","options_a":"Sessions","options_b":"Bits","options_c":"Packets","options_d":"Frames","correct_answer":"option_a"},
  {"question":"TCP retransmits:","options_a":"Lost segments","options_b":"All segments","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"UDP does not:","options_a":"Guarantee delivery","options_b":"Encapsulate","options_c":"Use ports","options_d":"None","correct_answer":"option_a"},
  {"question":"TCP timer used for:","options_a":"Retransmission","options_b":"Routing","options_c":"Filtering","options_d":"None","correct_answer":"option_a"},
  {"question":"TCP congestion window:","options_a":"cwnd","options_b":"rwnd","options_c":"swnd","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC402 - CNND | Semester IV | Module V: Presentation and Application Layer
-- ============================================================
(md5(random()::text),
 'Presentation and Application Layer',
 'Module V of Computer Network and Network Design: compression (lossy vs lossless, Huffman, LZW, RLE), image compression (GIF, JPEG), and application layer protocols (WWW, HTTP, FTP, Email, DNS, SNMP).',
 'Computer Network and Network Design','ITC402 - CNND','Semester IV','IT',
 '[
  {"question":"Lossy compression:","options_a":"Loses some data","options_b":"Loses nothing","options_c":"Infinite","options_d":"None","correct_answer":"option_a"},
  {"question":"Lossless compression:","options_a":"No data loss","options_b":"Data loss","options_c":"Infinite","options_d":"None","correct_answer":"option_a"},
  {"question":"Huffman coding is:","options_a":"Lossless","options_b":"Lossy","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"JPEG is:","options_a":"Lossy","options_b":"Lossless","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"GIF is:","options_a":"Lossless","options_b":"Lossy","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"LZW is:","options_a":"Lossless","options_b":"Lossy","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"RLE stands for:","options_a":"Run-Length Encoding","options_b":"Random Length Encoding","options_c":"Real Length Encoding","options_d":"None","correct_answer":"option_a"},
  {"question":"WWW stands for:","options_a":"World Wide Web","options_b":"Wide World Web","options_c":"Web Wide World","options_d":"None","correct_answer":"option_a"},
  {"question":"HTTP is:","options_a":"HyperText Transfer Protocol","options_b":"HyperText Transmission Protocol","options_c":"Hyper Transfer Text Protocol","options_d":"None","correct_answer":"option_a"},
  {"question":"HTTPS uses:","options_a":"SSL/TLS","options_b":"Plain TCP","options_c":"UDP","options_d":"None","correct_answer":"option_a"},
  {"question":"FTP uses ports:","options_a":"20, 21","options_b":"80","options_c":"25","options_d":"53","correct_answer":"option_a"},
  {"question":"HTTP default port:","options_a":"80","options_b":"443","options_c":"21","options_d":"25","correct_answer":"option_a"},
  {"question":"HTTPS default port:","options_a":"443","options_b":"80","options_c":"21","options_d":"25","correct_answer":"option_a"},
  {"question":"SMTP port:","options_a":"25","options_b":"80","options_c":"53","options_d":"110","correct_answer":"option_a"},
  {"question":"DNS port:","options_a":"53","options_b":"80","options_c":"25","options_d":"110","correct_answer":"option_a"},
  {"question":"DNS stands for:","options_a":"Domain Name System","options_b":"Dynamic Name System","options_c":"Domain Naming Server","options_d":"None","correct_answer":"option_a"},
  {"question":"SNMP stands for:","options_a":"Simple Network Management Protocol","options_b":"Standard Network Management Protocol","options_c":"System Network Management Protocol","options_d":"None","correct_answer":"option_a"},
  {"question":"Email protocols include:","options_a":"SMTP, POP3, IMAP","options_b":"HTTP, FTP","options_c":"SNMP, DNS","options_d":"None","correct_answer":"option_a"},
  {"question":"HTTP is:","options_a":"Stateless","options_b":"Stateful","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"Cookies are used to:","options_a":"Maintain state","options_b":"Encrypt","options_c":"Route","options_d":"None","correct_answer":"option_a"},
  {"question":"HTTP methods include:","options_a":"GET, POST","options_b":"SEND, RECV","options_c":"OPEN, CLOSE","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC402 - CNND | Semester IV | Module VI: Network Design Concepts
-- ============================================================
(md5(random()::text),
 'Network Design Concepts',
 'Module VI of Computer Network and Network Design: VLAN, VPN, IP addressing for an organization, subnetting, supernetting, routing protocols, and services like TELNET, SSH, FTP, Web, File, DHCP and DNS servers.',
 'Computer Network and Network Design','ITC402 - CNND','Semester IV','IT',
 '[
  {"question":"VLAN stands for:","options_a":"Virtual LAN","options_b":"Very Large Area Network","options_c":"Vertical LAN","options_d":"None","correct_answer":"option_a"},
  {"question":"VLAN separates:","options_a":"Broadcast domains","options_b":"Subnets only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"VPN stands for:","options_a":"Virtual Private Network","options_b":"Very Private Network","options_c":"Vertical Private Network","options_d":"None","correct_answer":"option_a"},
  {"question":"VPN uses:","options_a":"Tunneling","options_b":"Broadcast","options_c":"Multicast","options_d":"None","correct_answer":"option_a"},
  {"question":"Subnetting increases:","options_a":"Number of subnets","options_b":"Number of hosts only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Supernetting:","options_a":"Combines subnets","options_b":"Splits subnets","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"CIDR stands for:","options_a":"Classless Inter-Domain Routing","options_b":"Classful Inter-Domain Routing","options_c":"Classic Inter-Domain Routing","options_d":"None","correct_answer":"option_a"},
  {"question":"TELNET is:","options_a":"Unsecure remote login","options_b":"Secure remote login","options_c":"File transfer","options_d":"None","correct_answer":"option_a"},
  {"question":"SSH is:","options_a":"Secure remote login","options_b":"Unsecure","options_c":"File transfer","options_d":"None","correct_answer":"option_a"},
  {"question":"SSH port:","options_a":"22","options_b":"23","options_c":"80","options_d":"443","correct_answer":"option_a"},
  {"question":"TELNET port:","options_a":"23","options_b":"22","options_c":"80","options_d":"443","correct_answer":"option_a"},
  {"question":"FTP server uses:","options_a":"Ports 20, 21","options_b":"Ports 80, 443","options_c":"Ports 22, 23","options_d":"None","correct_answer":"option_a"},
  {"question":"Web server uses:","options_a":"Port 80","options_b":"Port 22","options_c":"Port 25","options_d":"None","correct_answer":"option_a"},
  {"question":"File server provides:","options_a":"File sharing","options_b":"Email","options_c":"DNS","options_d":"None","correct_answer":"option_a"},
  {"question":"DHCP server provides:","options_a":"Dynamic IP","options_b":"Static IP","options_c":"MAC","options_d":"None","correct_answer":"option_a"},
  {"question":"DNS server provides:","options_a":"Name resolution","options_b":"IP allocation","options_c":"Routing","options_d":"None","correct_answer":"option_a"},
  {"question":"Gateway connects:","options_a":"Different networks","options_b":"Same network","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Firewall filters:","options_a":"Traffic","options_b":"Files","options_c":"Users","options_d":"None","correct_answer":"option_a"},
  {"question":"DMZ is:","options_a":"Demilitarized zone","options_b":"Data zone","options_c":"Dynamic zone","options_d":"None","correct_answer":"option_a"},
  {"question":"Redundancy in network design:","options_a":"Backup paths","options_b":"Single path","options_c":"None","options_d":"Random","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC404 - AT | Semester IV | Module I: Introduction and Languages
-- ============================================================
(md5(random()::text),
 'Introduction and Languages',
 'Module I of Automata Theory: alphabets and strings, languages, regular expressions, regular grammars, RL and LL grammars, closure properties of regular languages.',
 'Automata Theory','ITC404 - AT','Semester IV','IT',
 '[
  {"question":"Alphabet is:","options_a":"Finite set of symbols","options_b":"String","options_c":"Language","options_d":"None","correct_answer":"option_a"},
  {"question":"String is:","options_a":"Finite sequence of symbols","options_b":"Alphabet","options_c":"Language","options_d":"None","correct_answer":"option_a"},
  {"question":"Language is:","options_a":"Set of strings","options_b":"Set of alphabets","options_c":"Set of symbols","options_d":"None","correct_answer":"option_a"},
  {"question":"Empty string is denoted by:","options_a":"ε","options_b":"∅","options_c":"0","options_d":"1","correct_answer":"option_a"},
  {"question":"Empty language is denoted by:","options_a":"∅","options_b":"ε","options_c":"0","options_d":"1","correct_answer":"option_a"},
  {"question":"Regular expressions denote:","options_a":"Regular languages","options_b":"CFL","options_c":"CSL","options_d":"None","correct_answer":"option_a"},
  {"question":"Union of two regular languages is:","options_a":"Regular","options_b":"CFL","options_c":"Not regular","options_d":"None","correct_answer":"option_a"},
  {"question":"Concatenation of regular languages is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Kleene star of a regular language is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Complementation of regular language is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Intersection of regular languages is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Regular grammar generates:","options_a":"Regular language","options_b":"CFL only","options_c":"CSL","options_d":"None","correct_answer":"option_a"},
  {"question":"Right-linear grammar is:","options_a":"Regular","options_b":"Context-free","options_c":"Context-sensitive","options_d":"None","correct_answer":"option_a"},
  {"question":"Left-linear grammar is:","options_a":"Regular","options_b":"Context-free","options_c":"Context-sensitive","options_d":"None","correct_answer":"option_a"},
  {"question":"Regular languages are closed under:","options_a":"Union, intersection, complement","options_b":"Only union","options_c":"Only complement","options_d":"None","correct_answer":"option_a"},
  {"question":"RL stands for:","options_a":"Regular Language","options_b":"Right Linear","options_c":"Random Language","options_d":"None","correct_answer":"option_a"},
  {"question":"LL stands for:","options_a":"Left Linear","options_b":"Left Language","options_c":"Linear Language","options_d":"None","correct_answer":"option_a"},
  {"question":"Reverse of a regular language is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Homomorphism of regular is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Substitution of regular is:","options_a":"Regular","options_b":"Not regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC404 - AT | Semester IV | Module II: Finite Automata
-- ============================================================
(md5(random()::text),
 'Finite Automata',
 'Module II of Automata Theory: DFA, NFA, epsilon-NFA, NFA to DFA conversion, minimization, FA to RE, Moore and Mealy machines, and limitations of FA.',
 'Automata Theory','ITC404 - AT','Semester IV','IT',
 '[
  {"question":"DFA stands for:","options_a":"Deterministic Finite Automaton","options_b":"Dynamic FA","options_c":"Direct FA","options_d":"None","correct_answer":"option_a"},
  {"question":"NFA stands for:","options_a":"Nondeterministic Finite Automaton","options_b":"Natural FA","options_c":"Nested FA","options_d":"None","correct_answer":"option_a"},
  {"question":"DFA has:","options_a":"Exactly one transition per symbol","options_b":"Many transitions","options_c":"No transitions","options_d":"None","correct_answer":"option_a"},
  {"question":"NFA can have:","options_a":"Multiple transitions","options_b":"One transition","options_c":"No transitions","options_d":"None","correct_answer":"option_a"},
  {"question":"ε-NFA allows:","options_a":"Transition without input","options_b":"Only with input","options_c":"No transitions","options_d":"None","correct_answer":"option_a"},
  {"question":"NFA to DFA conversion uses:","options_a":"Subset construction","options_b":"BFS only","options_c":"DFS only","options_d":"None","correct_answer":"option_a"},
  {"question":"DFA and NFA accept:","options_a":"Same class of languages","options_b":"Different classes","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Minimization reduces:","options_a":"States","options_b":"Alphabet","options_c":"Language","options_d":"None","correct_answer":"option_a"},
  {"question":"FA to RE conversion uses:","options_a":"Arden''s theorem","options_b":"Bellman-Ford","options_c":"Dijkstra","options_d":"None","correct_answer":"option_a"},
  {"question":"Moore machine output depends on:","options_a":"Current state","options_b":"Current state and input","options_c":"Input only","options_d":"None","correct_answer":"option_a"},
  {"question":"Mealy machine output depends on:","options_a":"Current state and input","options_b":"State only","options_c":"Input only","options_d":"None","correct_answer":"option_a"},
  {"question":"Moore to Mealy conversion:","options_a":"Possible","options_b":"Not possible","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Mealy to Moore conversion:","options_a":"Possible with more states","options_b":"Not possible","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Language of DFA:","options_a":"Regular","options_b":"CFL","options_c":"CSL","options_d":"None","correct_answer":"option_a"},
  {"question":"DFA has:","options_a":"Finite states","options_b":"Infinite states","options_c":"Variable states","options_d":"None","correct_answer":"option_a"},
  {"question":"Transition function of DFA:","options_a":"Q × Σ → Q","options_b":"Q × Σ → 2^Q","options_c":"Q → Σ","options_d":"None","correct_answer":"option_a"},
  {"question":"Transition function of NFA:","options_a":"Q × Σ → 2^Q","options_b":"Q × Σ → Q","options_c":"Q → Σ","options_d":"None","correct_answer":"option_a"},
  {"question":"Accepting state also called:","options_a":"Final state","options_b":"Initial state","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Start state is:","options_a":"One","options_b":"Many","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"FA limitation:","options_a":"Cannot count","options_b":"Cannot read","options_c":"Cannot stop","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC404 - AT | Semester IV | Module III: Context-Free Grammars
-- ============================================================
(md5(random()::text),
 'Context-Free Grammars',
 'Module III of Automata Theory: CFG basics, derivations (leftmost, rightmost), ambiguity, simplification, Chomsky Normal Form, Greibach Normal Form, and Chomsky hierarchy.',
 'Automata Theory','ITC404 - AT','Semester IV','IT',
 '[
  {"question":"CFG stands for:","options_a":"Context-Free Grammar","options_b":"Context-Fixed Grammar","options_c":"Central Free Grammar","options_d":"None","correct_answer":"option_a"},
  {"question":"CFG has:","options_a":"Nonterminals, terminals, productions, start symbol","options_b":"Only terminals","options_c":"Only nonterminals","options_d":"None","correct_answer":"option_a"},
  {"question":"Leftmost derivation expands:","options_a":"Leftmost nonterminal","options_b":"Rightmost","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Rightmost derivation expands:","options_a":"Rightmost nonterminal","options_b":"Leftmost","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Ambiguous grammar:","options_a":"Multiple parse trees","options_b":"Single parse tree","options_c":"No parse tree","options_d":"None","correct_answer":"option_a"},
  {"question":"Simplification of CFG includes:","options_a":"Remove useless, epsilon, unit productions","options_b":"Remove terminals","options_c":"Remove nonterminals","options_d":"None","correct_answer":"option_a"},
  {"question":"CNF stands for:","options_a":"Chomsky Normal Form","options_b":"Cauchy Normal Form","options_c":"Classical Normal Form","options_d":"None","correct_answer":"option_a"},
  {"question":"CNF productions:","options_a":"A → BC or A → a","options_b":"A → aB","options_c":"A → ABC","options_d":"None","correct_answer":"option_a"},
  {"question":"GNF stands for:","options_a":"Greibach Normal Form","options_b":"Gram Normal Form","options_c":"General Normal Form","options_d":"None","correct_answer":"option_a"},
  {"question":"GNF productions:","options_a":"A → aα","options_b":"A → BC","options_c":"A → ε","options_d":"None","correct_answer":"option_a"},
  {"question":"Chomsky hierarchy has:","options_a":"4 types","options_b":"3 types","options_c":"2 types","options_d":"5 types","correct_answer":"option_a"},
  {"question":"Type 0 grammar is:","options_a":"Unrestricted","options_b":"Context-sensitive","options_c":"Context-free","options_d":"Regular","correct_answer":"option_a"},
  {"question":"Type 1 grammar is:","options_a":"Context-sensitive","options_b":"Context-free","options_c":"Regular","options_d":"Unrestricted","correct_answer":"option_a"},
  {"question":"Type 2 grammar is:","options_a":"Context-free","options_b":"Context-sensitive","options_c":"Regular","options_d":"Unrestricted","correct_answer":"option_a"},
  {"question":"Type 3 grammar is:","options_a":"Regular","options_b":"Context-free","options_c":"Context-sensitive","options_d":"Unrestricted","correct_answer":"option_a"},
  {"question":"CFG generates:","options_a":"Context-free languages","options_b":"Regular languages only","options_c":"CSL","options_d":"None","correct_answer":"option_a"},
  {"question":"Pumping lemma for CFL:","options_a":"Proves non-CFL","options_b":"Proves CFL","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Parse tree represents:","options_a":"Derivation","options_b":"Language","options_c":"Grammar","options_d":"None","correct_answer":"option_a"},
  {"question":"Yield of parse tree is:","options_a":"String","options_b":"Tree","options_c":"Grammar","options_d":"None","correct_answer":"option_a"},
  {"question":"Epsilon production:","options_a":"A → ε","options_b":"A → a","options_c":"A → BC","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC404 - AT | Semester IV | Module IV: Push Down Automata
-- ============================================================
(md5(random()::text),
 'Push Down Automata',
 'Module IV of Automata Theory: PDA definition, deterministic PDA, acceptance by final state and empty stack, equivalence with CFG, and limitations of PDA.',
 'Automata Theory','ITC404 - AT','Semester IV','IT',
 '[
  {"question":"PDA stands for:","options_a":"Push Down Automaton","options_b":"Push Data Automaton","options_c":"Pull Down Automaton","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA has:","options_a":"Stack","options_b":"Queue","options_c":"Tree","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA accepts:","options_a":"CFL","options_b":"Regular only","options_c":"CSL","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA stack allows:","options_a":"Push and pop","options_b":"Only push","options_c":"Only pop","options_d":"None","correct_answer":"option_a"},
  {"question":"Deterministic PDA accepts:","options_a":"DCFL","options_b":"CFL","options_c":"Regular","options_d":"None","correct_answer":"option_a"},
  {"question":"Non-deterministic PDA accepts:","options_a":"CFL","options_b":"Regular","options_c":"CSL","options_d":"None","correct_answer":"option_a"},
  {"question":"DPDA is less powerful than:","options_a":"NPDA","options_b":"NPDA is less powerful","options_c":"Same","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA accepts by:","options_a":"Final state or empty stack","options_b":"Only final state","options_c":"Only empty stack","options_d":"None","correct_answer":"option_a"},
  {"question":"CFG to PDA conversion:","options_a":"Possible","options_b":"Not possible","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"PDA to CFG conversion:","options_a":"Possible","options_b":"Not possible","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"PDA transition:","options_a":"Depends on state, input, stack top","options_b":"Only state","options_c":"Only input","options_d":"None","correct_answer":"option_a"},
  {"question":"Stack alphabet in PDA:","options_a":"Γ","options_b":"Σ","options_c":"Q","options_d":"None","correct_answer":"option_a"},
  {"question":"Initial stack symbol:","options_a":"Z0","options_b":"Z1","options_c":"X","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA limitation:","options_a":"Only one stack","options_b":"No stack","options_c":"Infinite stacks","options_d":"None","correct_answer":"option_a"},
  {"question":"Language {a^n b^n} is:","options_a":"CFL","options_b":"Regular","options_c":"Not CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Language {a^n b^n c^n} is:","options_a":"Not CFL","options_b":"CFL","options_c":"Regular","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA is:","options_a":"Nondeterministic in general","options_b":"Always deterministic","options_c":"Always random","options_d":"None","correct_answer":"option_a"},
  {"question":"Empty stack acceptance:","options_a":"Stack empty at end","options_b":"Only final state","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"Final state acceptance:","options_a":"Ends in accepting state","options_b":"Stack empty only","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA is more powerful than:","options_a":"FA","options_b":"TM","options_c":"LBA","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC404 - AT | Semester IV | Module V: Turing Machines
-- ============================================================
(md5(random()::text),
 'Turing Machines',
 'Module V of Automata Theory: deterministic TM, variants of TM, halting problem, universality, and power of TM.',
 'Automata Theory','ITC404 - AT','Semester IV','IT',
 '[
  {"question":"TM stands for:","options_a":"Turing Machine","options_b":"Turing Model","options_c":"Test Machine","options_d":"None","correct_answer":"option_a"},
  {"question":"TM has:","options_a":"Infinite tape","options_b":"Finite tape","options_c":"Stack","options_d":"None","correct_answer":"option_a"},
  {"question":"TM head can:","options_a":"Move left and right","options_b":"Only right","options_c":"Only left","options_d":"None","correct_answer":"option_a"},
  {"question":"TM accepts:","options_a":"Recursively enumerable languages","options_b":"Regular","options_c":"CFL","options_d":"None","correct_answer":"option_a"},
  {"question":"Halting problem is:","options_a":"Undecidable","options_b":"Decidable","options_c":"Semi-decidable only","options_d":"None","correct_answer":"option_a"},
  {"question":"Universal TM can:","options_a":"Simulate other TMs","options_b":"Only one TM","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Variants of TM include:","options_a":"Multi-tape, nondeterministic","options_b":"Only single-tape","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Multi-tape TM is:","options_a":"Equivalent to single-tape","options_b":"More powerful","options_c":"Less powerful","options_d":"None","correct_answer":"option_a"},
  {"question":"NDTM is:","options_a":"Equivalent to DTM","options_b":"More powerful","options_c":"Less powerful","options_d":"None","correct_answer":"option_a"},
  {"question":"Church-Turing thesis:","options_a":"TM captures computation","options_b":"TM is weak","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Recursive language is:","options_a":"Decided by TM","options_b":"Recursively enumerable only","options_c":"Not TM","options_d":"None","correct_answer":"option_a"},
  {"question":"Recursively enumerable language:","options_a":"Accepted by TM","options_b":"Decided by TM","options_c":"Not TM","options_d":"None","correct_answer":"option_a"},
  {"question":"Diagonalization proves:","options_a":"Undecidability","options_b":"Decidability","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Reduction is:","options_a":"Mapping one problem to another","options_b":"Copying","options_c":"Deleting","options_d":"None","correct_answer":"option_a"},
  {"question":"Halting problem proved by:","options_a":"Turing","options_b":"Church","options_c":"Kleene","options_d":"None","correct_answer":"option_a"},
  {"question":"TM with two-way infinite tape:","options_a":"Equivalent","options_b":"More powerful","options_c":"Less powerful","options_d":"None","correct_answer":"option_a"},
  {"question":"TM transition:","options_a":"Depends on state and tape symbol","options_b":"Only state","options_c":"Only tape","options_d":"None","correct_answer":"option_a"},
  {"question":"TM can compute:","options_a":"Any computable function","options_b":"Only arithmetic","options_c":"Only text","options_d":"None","correct_answer":"option_a"},
  {"question":"Linear bounded automaton is:","options_a":"Restricted TM","options_b":"Full TM","options_c":"FA","options_d":"None","correct_answer":"option_a"},
  {"question":"Context-sensitive language is accepted by:","options_a":"LBA","options_b":"FA","options_c":"PDA","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC404 - AT | Semester IV | Module VI: Applications of Automata
-- ============================================================
(md5(random()::text),
 'Applications of Automata',
 'Module VI of Automata Theory: applications of FA, CFG, PDA and TM; introduction to compilers; phases of compiler (lexical, syntactic, semantic, code generation).',
 'Automata Theory','ITC404 - AT','Semester IV','IT',
 '[
  {"question":"FA is used in:","options_a":"Lexical analysis","options_b":"Parsing","options_c":"Code generation","options_d":"None","correct_answer":"option_a"},
  {"question":"CFG is used in:","options_a":"Parsing","options_b":"Lexical analysis","options_c":"Code generation","options_d":"None","correct_answer":"option_a"},
  {"question":"PDA is used in:","options_a":"Parsing","options_b":"Lexing","options_c":"Linking","options_d":"None","correct_answer":"option_a"},
  {"question":"TM is used in:","options_a":"Theoretical computation","options_b":"Lexing","options_c":"Parsing only","options_d":"None","correct_answer":"option_a"},
  {"question":"Compiler phases include:","options_a":"Lexical, syntax, semantic","options_b":"Only lexical","options_c":"Only syntax","options_d":"None","correct_answer":"option_a"},
  {"question":"Lexical analysis produces:","options_a":"Tokens","options_b":"Parse tree","options_c":"Assembly","options_d":"None","correct_answer":"option_a"},
  {"question":"Syntax analysis produces:","options_a":"Parse tree","options_b":"Tokens","options_c":"Assembly","options_d":"None","correct_answer":"option_a"},
  {"question":"Semantic analysis checks:","options_a":"Meaning","options_b":"Syntax","options_c":"Lexing","options_d":"None","correct_answer":"option_a"},
  {"question":"Intermediate code:","options_a":"Between source and target","options_b":"Final code","options_c":"Source only","options_d":"None","correct_answer":"option_a"},
  {"question":"Code optimization:","options_a":"Improves performance","options_b":"Worsens","options_c":"No effect","options_d":"None","correct_answer":"option_a"},
  {"question":"Code generation produces:","options_a":"Target code","options_b":"Tokens","options_c":"Parse tree","options_d":"None","correct_answer":"option_a"},
  {"question":"Lex tool is:","options_a":"Lexical analyzer generator","options_b":"Parser generator","options_c":"Compiler","options_d":"None","correct_answer":"option_a"},
  {"question":"Yacc tool is:","options_a":"Parser generator","options_b":"Lexical analyzer","options_c":"Compiler","options_d":"None","correct_answer":"option_a"},
  {"question":"Regular expressions are used for:","options_a":"Lexical patterns","options_b":"Parsing","options_c":"Code gen","options_d":"None","correct_answer":"option_a"},
  {"question":"BNF is:","options_a":"Grammar notation","options_b":"Language","options_c":"Tool","options_d":"None","correct_answer":"option_a"},
  {"question":"LR parser is:","options_a":"Bottom-up","options_b":"Top-down","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"LL parser is:","options_a":"Top-down","options_b":"Bottom-up","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"First and Follow are used in:","options_a":"LL parsing","options_b":"LR only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Shift-reduce is:","options_a":"Parsing action","options_b":"Code gen","options_c":"Lexing","options_d":"None","correct_answer":"option_a"},
  {"question":"Compiler front end:","options_a":"Lexical, syntax, semantic","options_b":"Code gen only","options_c":"Optimization only","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC405 - COA | Semester IV | Module I: Digital Logic Design
-- ============================================================
(md5(random()::text),
 'Digital Logic Design',
 'Module I of Computer Organization and Architecture: logic gates, Boolean algebra, combinational circuits, flip-flops, sequential circuits, and basic components of a digital computer.',
 'Computer Organization and Architecture','ITC405 - COA','Semester IV','IT',
 '[
  {"question":"Basic logic gates:","options_a":"AND, OR, NOT","options_b":"Only AND","options_c":"Only OR","options_d":"Only NOT","correct_answer":"option_a"},
  {"question":"Universal gates:","options_a":"NAND, NOR","options_b":"AND, OR","options_c":"NOT","options_d":"XOR","correct_answer":"option_a"},
  {"question":"Boolean algebra is used for:","options_a":"Simplifying logic","options_b":"Sorting","options_c":"Filtering","options_d":"None","correct_answer":"option_a"},
  {"question":"Number of rows in truth table for n inputs:","options_a":"2^n","options_b":"n","options_c":"n^2","options_d":"2n","correct_answer":"option_a"},
  {"question":"Half adder has:","options_a":"Two inputs, two outputs","options_b":"Two inputs, one output","options_c":"One input, two outputs","options_d":"One input, one output","correct_answer":"option_a"},
  {"question":"Full adder has:","options_a":"Three inputs, two outputs","options_b":"Two inputs, two outputs","options_c":"Three inputs, one output","options_d":"Four inputs, two outputs","correct_answer":"option_a"},
  {"question":"MUX stands for:","options_a":"Multiplexer","options_b":"Multiplier","options_c":"Multiplexer only","options_d":"None","correct_answer":"option_a"},
  {"question":"DEMUX is:","options_a":"Demultiplexer","options_b":"Multiplier","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Flip-flop stores:","options_a":"1 bit","options_b":"1 byte","options_c":"1 word","options_d":"1 nibble","correct_answer":"option_a"},
  {"question":"SR flip-flop:","options_a":"Set-Reset","options_b":"Serial Register","options_c":"Shift Register","options_d":"None","correct_answer":"option_a"},
  {"question":"JK flip-flop solves:","options_a":"Invalid state of SR","options_b":"Race of SR","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"D flip-flop is used for:","options_a":"Data storage","options_b":"Toggle","options_c":"Set only","options_d":"None","correct_answer":"option_a"},
  {"question":"T flip-flop is used for:","options_a":"Toggle","options_b":"Store","options_c":"Set only","options_d":"None","correct_answer":"option_a"},
  {"question":"Synchronous circuits use:","options_a":"Clock","options_b":"No clock","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Asynchronous circuits:","options_a":"No global clock","options_b":"Global clock","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Registers are:","options_a":"Group of flip-flops","options_b":"Group of gates","options_c":"Group of memories","options_d":"None","correct_answer":"option_a"},
  {"question":"Counters count:","options_a":"Clock pulses","options_b":"Data","options_c":"Address","options_d":"None","correct_answer":"option_a"},
  {"question":"K-map is used for:","options_a":"Boolean simplification","options_b":"Sorting","options_c":"Filtering","options_d":"None","correct_answer":"option_a"},
  {"question":"ALU stands for:","options_a":"Arithmetic Logic Unit","options_b":"Arithmetic Logic Utility","options_c":"Array Logic Unit","options_d":"None","correct_answer":"option_a"},
  {"question":"CPU consists of:","options_a":"ALU, control unit, registers","options_b":"Only ALU","options_c":"Only control unit","options_d":"Only registers","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC405 - COA | Semester IV | Module II: 8086 Architecture
-- ============================================================
(md5(random()::text),
 '8086 Microprocessor Architecture',
 'Module II of Computer Organization and Architecture: 8086 architecture, registers, addressing modes, instruction set, assembly programming, and interrupts.',
 'Computer Organization and Architecture','ITC405 - COA','Semester IV','IT',
 '[
  {"question":"8086 is:","options_a":"16-bit microprocessor","options_b":"8-bit","options_c":"32-bit","options_d":"64-bit","correct_answer":"option_a"},
  {"question":"8086 address bus:","options_a":"20 bits","options_b":"16 bits","options_c":"32 bits","options_d":"8 bits","correct_answer":"option_a"},
  {"question":"8086 data bus:","options_a":"16 bits","options_b":"8 bits","options_c":"20 bits","options_d":"32 bits","correct_answer":"option_a"},
  {"question":"8086 max memory:","options_a":"1 MB","options_b":"64 KB","options_c":"16 MB","options_d":"4 GB","correct_answer":"option_a"},
  {"question":"Registers in 8086 include:","options_a":"AX, BX, CX, DX","options_b":"Only AX","options_c":"Only BX","options_d":"Only CX","correct_answer":"option_a"},
  {"question":"Segment registers:","options_a":"CS, DS, ES, SS","options_b":"AX, BX","options_c":"CX, DX","options_d":"None","correct_answer":"option_a"},
  {"question":"IP stands for:","options_a":"Instruction Pointer","options_b":"Index Pointer","options_c":"Input Pointer","options_d":"None","correct_answer":"option_a"},
  {"question":"SP stands for:","options_a":"Stack Pointer","options_b":"Segment Pointer","options_c":"Source Pointer","options_d":"None","correct_answer":"option_a"},
  {"question":"BP stands for:","options_a":"Base Pointer","options_b":"Byte Pointer","options_c":"Buffer Pointer","options_d":"None","correct_answer":"option_a"},
  {"question":"SI and DI are:","options_a":"Index registers","options_b":"Data registers","options_c":"Segment registers","options_d":"None","correct_answer":"option_a"},
  {"question":"Addressing modes:","options_a":"Immediate, direct, indirect","options_b":"Only immediate","options_c":"Only direct","options_d":"None","correct_answer":"option_a"},
  {"question":"MOV is:","options_a":"Data transfer","options_b":"Arithmetic","options_c":"Logic","options_d":"None","correct_answer":"option_a"},
  {"question":"ADD is:","options_a":"Arithmetic","options_b":"Data transfer","options_c":"Logic","options_d":"None","correct_answer":"option_a"},
  {"question":"AND, OR, XOR are:","options_a":"Logic instructions","options_b":"Arithmetic","options_c":"Data transfer","options_d":"None","correct_answer":"option_a"},
  {"question":"INT instruction is:","options_a":"Interrupt","options_b":"Data transfer","options_c":"Arithmetic","options_d":"None","correct_answer":"option_a"},
  {"question":"CALL is:","options_a":"Subroutine call","options_b":"Jump","options_c":"Return","options_d":"None","correct_answer":"option_a"},
  {"question":"RET is:","options_a":"Return from subroutine","options_b":"Call","options_c":"Jump","options_d":"None","correct_answer":"option_a"},
  {"question":"JMP is:","options_a":"Unconditional jump","options_b":"Call","options_c":"Return","options_d":"None","correct_answer":"option_a"},
  {"question":"Flags register:","options_a":"Stores status","options_b":"Stores data","options_c":"Stores address","options_d":"None","correct_answer":"option_a"},
  {"question":"Interrupt vector table has:","options_a":"256 entries","options_b":"64","options_c":"128","options_d":"512","correct_answer":"option_a"},
  {"question":"NMI stands for:","options_a":"Non-Maskable Interrupt","options_b":"New Memory Interface","options_c":"Next Machine Instruction","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC405 - COA | Semester IV | Module III: Processor Organization
-- ============================================================
(md5(random()::text),
 'Processor Organization',
 'Module III of Computer Organization and Architecture: control unit, instruction cycle, pipelining, instruction-level parallelism, superscalar, and RISC vs CISC.',
 'Computer Organization and Architecture','ITC405 - COA','Semester IV','IT',
 '[
  {"question":"Control unit generates:","options_a":"Control signals","options_b":"Data","options_c":"Address","options_d":"None","correct_answer":"option_a"},
  {"question":"Hardwired control:","options_a":"Fixed circuits","options_b":"Microprogram","options_c":"Software","options_d":"None","correct_answer":"option_a"},
  {"question":"Microprogrammed control:","options_a":"Microinstructions","options_b":"Fixed circuits","options_c":"Software","options_d":"None","correct_answer":"option_a"},
  {"question":"Instruction cycle:","options_a":"Fetch, decode, execute","options_b":"Only fetch","options_c":"Only execute","options_d":"None","correct_answer":"option_a"},
  {"question":"Pipelining improves:","options_a":"Throughput","options_b":"Latency only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Pipeline hazards:","options_a":"Structural, data, control","options_b":"Only structural","options_c":"Only data","options_d":"None","correct_answer":"option_a"},
  {"question":"Data hazard:","options_a":"Data dependency","options_b":"Resource conflict","options_c":"Branch","options_d":"None","correct_answer":"option_a"},
  {"question":"Control hazard:","options_a":"Branch","options_b":"Data dependency","options_c":"Resource","options_d":"None","correct_answer":"option_a"},
  {"question":"Structural hazard:","options_a":"Resource conflict","options_b":"Data","options_c":"Branch","options_d":"None","correct_answer":"option_a"},
  {"question":"Forwarding solves:","options_a":"Data hazard","options_b":"Control hazard","options_c":"Structural","options_d":"None","correct_answer":"option_a"},
  {"question":"Branch prediction solves:","options_a":"Control hazard","options_b":"Data hazard","options_c":"Structural","options_d":"None","correct_answer":"option_a"},
  {"question":"ILP stands for:","options_a":"Instruction-Level Parallelism","options_b":"Internal Logic Path","options_c":"Inter Link Protocol","options_d":"None","correct_answer":"option_a"},
  {"question":"Superscalar processors issue:","options_a":"Multiple instructions per cycle","options_b":"One instruction","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"VLIW stands for:","options_a":"Very Long Instruction Word","options_b":"Very Large Instruction Word","options_c":"Variable Length Instruction Word","options_d":"None","correct_answer":"option_a"},
  {"question":"RISC:","options_a":"Reduced Instruction Set Computer","options_b":"Rich Instruction Set Computer","options_c":"Random Instruction Set","options_d":"None","correct_answer":"option_a"},
  {"question":"CISC:","options_a":"Complex Instruction Set Computer","options_b":"Coded Instruction Set","options_c":"Compact Instruction Set","options_d":"None","correct_answer":"option_a"},
  {"question":"RISC has:","options_a":"Fixed-length instructions","options_b":"Variable-length","options_c":"Both","options_d":"None","correct_answer":"option_a"},
  {"question":"RISC uses:","options_a":"Load-store architecture","options_b":"Memory-memory","options_c":"Register-memory only","options_d":"None","correct_answer":"option_a"},
  {"question":"CPI stands for:","options_a":"Cycles Per Instruction","options_b":"Code Per Instruction","options_c":"Cost Per Instruction","options_d":"None","correct_answer":"option_a"},
  {"question":"Speedup in pipelining limited by:","options_a":"Slowest stage","options_b":"Fastest stage","options_c":"Average","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC405 - COA | Semester IV | Module IV: Computer Arithmetic
-- ============================================================
(md5(random()::text),
 'Computer Arithmetic',
 'Module IV of Computer Organization and Architecture: integer representation, signed numbers, addition and subtraction, multiplication (Booth), division, floating-point representation (IEEE 754) and arithmetic.',
 'Computer Organization and Architecture','ITC405 - COA','Semester IV','IT',
 '[
  {"question":"Signed integers use:","options_a":"Sign-magnitude, 1''s and 2''s complement","options_b":"Only unsigned","options_c":"Only magnitude","options_d":"None","correct_answer":"option_a"},
  {"question":"2''s complement of 0101 (4-bit) is:","options_a":"1011","options_b":"1010","options_c":"1100","options_d":"1111","correct_answer":"option_a"},
  {"question":"Range of 8-bit signed 2''s complement:","options_a":"-128 to 127","options_b":"-127 to 127","options_c":"0 to 255","options_d":"-255 to 255","correct_answer":"option_a"},
  {"question":"Overflow in addition is detected by:","options_a":"Sign bit mismatch","options_b":"Carry","options_c":"Zero","options_d":"None","correct_answer":"option_a"},
  {"question":"Booth algorithm is for:","options_a":"Signed multiplication","options_b":"Unsigned division","options_c":"Addition","options_d":"None","correct_answer":"option_a"},
  {"question":"Multiplication of two n-bit numbers gives:","options_a":"2n bits","options_b":"n bits","options_c":"n+1 bits","options_d":"2n-1 bits","correct_answer":"option_a"},
  {"question":"Restoring division uses:","options_a":"Trial subtraction","options_b":"Booth","options_c":"Karatsuba","options_d":"None","correct_answer":"option_a"},
  {"question":"Non-restoring division:","options_a":"Add or subtract","options_b":"Only subtract","options_c":"Only add","options_d":"None","correct_answer":"option_a"},
  {"question":"Floating-point represents:","options_a":"Real numbers","options_b":"Only integers","options_c":"Only characters","options_d":"None","correct_answer":"option_a"},
  {"question":"IEEE 754 single precision:","options_a":"32 bits","options_b":"64 bits","options_c":"16 bits","options_d":"128 bits","correct_answer":"option_a"},
  {"question":"IEEE 754 double precision:","options_a":"64 bits","options_b":"32 bits","options_c":"128 bits","options_d":"16 bits","correct_answer":"option_a"},
  {"question":"IEEE 754 single: sign, exponent, mantissa bits:","options_a":"1, 8, 23","options_b":"1, 11, 52","options_c":"1, 16, 15","options_d":"1, 32, 31","correct_answer":"option_a"},
  {"question":"IEEE 754 double: sign, exponent, mantissa bits:","options_a":"1, 11, 52","options_b":"1, 8, 23","options_c":"1, 16, 15","options_d":"1, 32, 31","correct_answer":"option_a"},
  {"question":"Bias in single precision:","options_a":"127","options_b":"128","options_c":"1023","options_d":"1024","correct_answer":"option_a"},
  {"question":"Bias in double precision:","options_a":"1023","options_b":"127","options_c":"128","options_d":"1024","correct_answer":"option_a"},
  {"question":"Normalized floating point:","options_a":"1.xxx","options_b":"0.xxx","options_c":"xxx.0","options_d":"None","correct_answer":"option_a"},
  {"question":"Denormalized numbers:","options_a":"Exponent all zeros","options_b":"Exponent all ones","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"NaN:","options_a":"Not a Number","options_b":"Negative Number","options_c":"Natural Number","options_d":"None","correct_answer":"option_a"},
  {"question":"Floating point addition steps:","options_a":"Align, add, normalize","options_b":"Add only","options_c":"Align only","options_d":"None","correct_answer":"option_a"},
  {"question":"Carry-lookahead adder reduces:","options_a":"Delay","options_b":"Area","options_c":"Power only","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC405 - COA | Semester IV | Module V: Memory Organization
-- ============================================================
(md5(random()::text),
 'Memory Organization',
 'Module V of Computer Organization and Architecture: memory hierarchy, cache memory, mapping techniques, replacement policies, virtual memory, and RAID.',
 'Computer Organization and Architecture','ITC405 - COA','Semester IV','IT',
 '[
  {"question":"Memory hierarchy from fastest:","options_a":"Registers, cache, RAM, disk","options_b":"Disk, RAM, cache","options_c":"RAM, cache, registers","options_d":"None","correct_answer":"option_a"},
  {"question":"Cache is:","options_a":"Small and fast","options_b":"Large and fast","options_c":"Small and slow","options_d":"Large and slow","correct_answer":"option_a"},
  {"question":"Cache hit means:","options_a":"Data found in cache","options_b":"Data not found","options_c":"Data lost","options_d":"None","correct_answer":"option_a"},
  {"question":"Cache miss means:","options_a":"Data not found","options_b":"Data found","options_c":"Data lost","options_d":"None","correct_answer":"option_a"},
  {"question":"Direct mapping:","options_a":"Each block has one cache line","options_b":"Many-to-many","options_c":"Fully flexible","options_d":"None","correct_answer":"option_a"},
  {"question":"Set-associative:","options_a":"Compromise between direct and fully","options_b":"Direct only","options_c":"Fully only","options_d":"None","correct_answer":"option_a"},
  {"question":"Fully associative:","options_a":"Any block to any line","options_b":"Fixed mapping","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"LRU stands for:","options_a":"Least Recently Used","options_b":"Last Recently Used","options_c":"Latest Recently Used","options_d":"None","correct_answer":"option_a"},
  {"question":"FIFO replacement:","options_a":"First In First Out","options_b":"Last In First Out","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Write-through:","options_a":"Write both cache and memory","options_b":"Write cache only","options_c":"Write memory only","options_d":"None","correct_answer":"option_a"},
  {"question":"Write-back:","options_a":"Write cache only, memory on eviction","options_b":"Write memory only","options_c":"Write both","options_d":"None","correct_answer":"option_a"},
  {"question":"Virtual memory allows:","options_a":"Programs larger than RAM","options_b":"Smaller programs only","options_c":"No programs","options_d":"None","correct_answer":"option_a"},
  {"question":"Page fault occurs when:","options_a":"Page not in memory","options_b":"Page in memory","options_c":"Page deleted","options_d":"None","correct_answer":"option_a"},
  {"question":"TLB is:","options_a":"Translation Lookaside Buffer","options_b":"Table Lookaside Buffer","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"TLB is:","options_a":"Small cache for page table entries","options_b":"Large memory","options_c":"Disk","options_d":"None","correct_answer":"option_a"},
  {"question":"RAID 0:","options_a":"Striping","options_b":"Mirroring","options_c":"Parity","options_d":"None","correct_answer":"option_a"},
  {"question":"RAID 1:","options_a":"Mirroring","options_b":"Striping","options_c":"Parity","options_d":"None","correct_answer":"option_a"},
  {"question":"RAID 5:","options_a":"Striping with parity","options_b":"Mirroring only","options_c":"Striping only","options_d":"None","correct_answer":"option_a"},
  {"question":"Associative memory:","options_a":"Content addressable","options_b":"Address only","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Interleaved memory improves:","options_a":"Bandwidth","options_b":"Latency","options_c":"Capacity","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW()),

-- ============================================================
-- ITC405 - COA | Semester IV | Module VI: I/O Organization
-- ============================================================
(md5(random()::text),
 'I/O Organization',
 'Module VI of Computer Organization and Architecture: I/O interfaces, programmed I/O, interrupt-driven I/O, DMA, I/O processors, and bus structures.',
 'Computer Organization and Architecture','ITC405 - COA','Semester IV','IT',
 '[
  {"question":"I/O subsystem connects:","options_a":"CPU and peripherals","options_b":"CPU and memory only","options_c":"Memory and disk only","options_d":"None","correct_answer":"option_a"},
  {"question":"Programmed I/O:","options_a":"CPU polls device","options_b":"Device interrupts CPU","options_c":"DMA","options_d":"None","correct_answer":"option_a"},
  {"question":"Interrupt-driven I/O:","options_a":"Device interrupts CPU","options_b":"CPU polls","options_c":"DMA","options_d":"None","correct_answer":"option_a"},
  {"question":"DMA stands for:","options_a":"Direct Memory Access","options_b":"Data Memory Access","options_c":"Direct Mode Access","options_d":"None","correct_answer":"option_a"},
  {"question":"DMA transfers data:","options_a":"Without CPU intervention","options_b":"With CPU","options_c":"Only with interrupts","options_d":"None","correct_answer":"option_a"},
  {"question":"DMA controller:","options_a":"Manages data transfer","options_b":"Executes programs","options_c":"Stores data","options_d":"None","correct_answer":"option_a"},
  {"question":"Cycle stealing:","options_a":"DMA takes bus cycles","options_b":"CPU takes cycles","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Burst mode DMA:","options_a":"Transfers block of data","options_b":"One byte","options_c":"Random","options_d":"None","correct_answer":"option_a"},
  {"question":"Transparent DMA:","options_a":"Uses idle cycles","options_b":"Steals cycles","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"I/O processor:","options_a":"Handles I/O independently","options_b":"Only CPU","options_c":"Only memory","options_d":"None","correct_answer":"option_a"},
  {"question":"Bus is:","options_a":"Shared communication path","options_b":"Dedicated path","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"System bus includes:","options_a":"Data, address, control","options_b":"Only data","options_c":"Only address","options_d":"None","correct_answer":"option_a"},
  {"question":"Address bus is:","options_a":"Unidirectional","options_b":"Bidirectional","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Data bus is:","options_a":"Bidirectional","options_b":"Unidirectional","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"Control bus is:","options_a":"Bidirectional","options_b":"Unidirectional","options_c":"None","options_d":"Random","correct_answer":"option_a"},
  {"question":"PCI is:","options_a":"Peripheral Component Interconnect","options_b":"Program Control Interface","options_c":"Parallel Channel Interface","options_d":"None","correct_answer":"option_a"},
  {"question":"USB is:","options_a":"Universal Serial Bus","options_b":"Uniform Serial Bus","options_c":"Universal System Bus","options_d":"None","correct_answer":"option_a"},
  {"question":"Firewire is:","options_a":"IEEE 1394","options_b":"1395","options_c":"1396","options_d":"None","correct_answer":"option_a"},
  {"question":"Interrupt vector:","options_a":"Address of ISR","options_b":"Data","options_c":"Instruction","options_d":"None","correct_answer":"option_a"},
  {"question":"ISR stands for:","options_a":"Interrupt Service Routine","options_b":"Internal Service Routine","options_c":"Instruction Service Routine","options_d":"None","correct_answer":"option_a"}
 ]'::jsonb,'20',NOW());