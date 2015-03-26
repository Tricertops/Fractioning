Turn any decimal number **into a fraction** with _arbitrary precision_.

```c
double π = 3.14159265358979323846;
long limit = 1000; // Maximum nominator or denominator.

Fraction fraction = FractionFromDecimal(π, 0.01, limit);
fraction.nominator; // 22
fraction.denominator; // 7
// 22/7 = 3.14285714285714285714... (+0.00126448931)

Fraction fraction = FractionFromDecimal(π, 0.001, limit);
fraction.nominator; // 201
fraction.denominator; // 64
// 201/64 = 3.140625 (-0.0009676535898)

Fraction fraction = FractionFromDecimal(π, 0.0001, limit);
fraction.nominator; // 333
fraction.denominator; // 106
// 333/106 = 3.14150943396226415094... (-0.00008321962753)

Fraction fraction = FractionFromDecimal(π, DBL_EPSILON, ULONG_MAX);
fraction.nominator; // 245850922
fraction.denominator; // 78256779
// 245850922/78256779 = 3.14159265358979316028... (-0.00000000000000007818) 
```

> © 2015 Martin Kiss
