//
//  Fractioning.h
//  Fractioning
//
//  Created by Martin Kiss on 26.3.15.
//  Copyright (c) 2015 Triceratops. All rights reserved.
//


typedef long Nominator;
typedef unsigned long Denominator;
typedef double Decimal;
typedef double Accuracy;



typedef struct {
    Nominator nominator;
    Denominator denominator;
} Fraction;



extern Fraction FractionMake(Nominator n, Denominator d);
extern Decimal FractionDecimal(Fraction f);
extern Fraction FractionInvert(Fraction f);
extern Accuracy FractionAccuracy(Fraction f, Decimal d);
extern Accuracy FractionInvertedAccuracy(Fraction f, Decimal d);
extern Fraction FractionWithDenominator(Fraction f, Denominator d);
extern Fraction FractionFromDecimal(Decimal d, Accuracy min, Denominator max);


