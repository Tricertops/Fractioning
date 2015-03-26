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


Accuracy FractionAccuracy(Fraction f, Decimal d) {
    Accuracy a = FractionDecimal(f) - d;
    return (a < 0? -a : a);
}


Accuracy FractionInvertedAccuracy(Fraction f, Decimal d) {
    Accuracy a = 1/FractionDecimal(f) - 1/d;
    return (a < 0? -a : a);
}


Fraction FractionWithDenominator(Fraction f, Denominator d) {
    Decimal n = FractionDecimal(f) * d + 0.5;
    return FractionMake((Nominator)n, d);
}


Fraction FractionFromDecimal(Decimal target, Accuracy desiredAccuracy, Denominator maxDenominator) {
    _Bool negate = (target < 0);
    target = (negate? -target : target);
    _Bool invert = (target > 1);
    target = (invert? 1/target : target);
    
    Fraction fraction = FractionMake(0, 1);
    Accuracy accuracy = target;
    while (fraction.denominator < maxDenominator) {
        accuracy = (invert? FractionInvertedAccuracy(fraction, target) : FractionAccuracy(fraction, target));
        if (accuracy <= desiredAccuracy)
            break;
        fraction.denominator ++;
        fraction.nominator = (Nominator)(fraction.denominator * target + 0.5);
    }
    fraction = (invert? FractionInvert(fraction) : fraction);
    fraction.nominator = (negate? -fraction.nominator : fraction.nominator);
    return fraction;
}


