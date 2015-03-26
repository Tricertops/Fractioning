//
//  Fractioning.c
//
//  Copyright © 2015 Martin Kiss. All rights reserved.
//

#import "Fractioning.h"





Fraction FractionMake(Nominator n, Denominator d) {
    Fraction f;
    f.nominator = n;
    f.denominator = d;
    return f;
}


Decimal FractionDecimal(Fraction f) {
    return (Decimal)f.nominator / (Decimal)f.denominator;
}


Fraction FractionInvert(Fraction f) {
    Denominator maxNominator = (((Denominator)~0) >> 2);
    _Bool sign = (f.nominator < 0? -1 : 1);
    Fraction i;
    i.nominator = (Nominator)(f.denominator > maxNominator? maxNominator : f.denominator) * sign;
    i.denominator = (Denominator)(f.nominator * sign);
    return i;
}


Accuracy FractionAccuracy(Fraction f, Decimal B) {
    Accuracy a = FractionDecimal(f) - B;
    return (a < 0? -a : a);
}


Fraction FractionWithDenominator(Fraction f, Denominator d) {
    Decimal n = FractionDecimal(f) * d + 0.5;
    return FractionMake((Nominator)n, d);
}


Fraction FractionFromDecimal(Decimal target, Accuracy accuracy, Denominator denominator) {
    _Bool negate = (target < 0);
    target = (negate? -target : target);
    _Bool invert = (target > 1);
    target = (invert? 1/target : target);
    
    Fraction lower = FractionMake(0, 1);
    Fraction upper = FractionMake(1, 1);
    Fraction final = lower;
    Accuracy finalAccuracy = target;
    while (final.denominator < denominator && finalAccuracy >= accuracy) {
        Accuracy lowerAccuracy = FractionAccuracy(lower, target);
        Accuracy upperAccuracy = FractionAccuracy(upper, target);
        _Bool lowerIsBetter = (lowerAccuracy <= upperAccuracy);
        final = (lowerIsBetter? lower : upper);
        finalAccuracy = (lowerIsBetter? lowerAccuracy : upperAccuracy);
        lower = FractionMake(final.nominator, final.denominator + 1);
        upper = FractionMake(final.nominator + 1, final.denominator + 1);
    }
    final = (invert? FractionInvert(final) : final);
    final.nominator = (negate? -final.nominator : final.nominator);
    return final;
}


