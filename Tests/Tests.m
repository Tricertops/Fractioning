//
//  Tests.m
//  Tests
//
//  Created by Martin Kiss on 26.3.15.
//  Copyright (c) 2015 Triceratops. All rights reserved.
//

@import XCTest;
#import "Fractioning.h"

@interface Tests : XCTestCase @end

@implementation Tests



- (void)test_0_4627 {
    double x = 0.4627;
    {
        Fraction f = FractionFromDecimal(x, 0.02, 100);
        XCTAssertEqual(f.nominator, 4);
        XCTAssertEqual(f.denominator, 9U);
    }{
        Fraction f = FractionFromDecimal(x, 0.01, 100);
        XCTAssertEqual(f.nominator, 5);
        XCTAssertEqual(f.denominator, 11U);
    }{
        Fraction f = FractionFromDecimal(x, 0.001, 100);
        XCTAssertEqual(f.nominator, 19);
        XCTAssertEqual(f.denominator, 41U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0001, 100);
        XCTAssertEqual(f.nominator, 31);
        XCTAssertEqual(f.denominator, 67U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0000001, 10000);
        XCTAssertEqual(f.nominator, 1532);
        XCTAssertEqual(f.denominator, 3311U);
    }
    
    [self measureBlock:^{
        for (NSUInteger index = 0; index < 1000; index++) {
            Fraction f = FractionFromDecimal(x, 0.0000001, 10000);
            XCTAssertEqual(f.nominator, 1532);
            XCTAssertEqual(f.denominator, 3311U);
        }
    }];
}


- (void)test_3_14159265358979323846 {
    double x = 3.14159265358979323846;
    {
        Fraction f = FractionFromDecimal(x, 0.01, 100);
        XCTAssertEqual(f.nominator, 22);
        XCTAssertEqual(f.denominator, 7U);
    }{
        Fraction f = FractionFromDecimal(x, 0.001, 1000);
        XCTAssertEqual(f.nominator, 201);
        XCTAssertEqual(f.denominator, 64U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0001, 1000);
        XCTAssertEqual(f.nominator, 333);
        XCTAssertEqual(f.denominator, 106U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0000001, 100000);
        XCTAssertEqual(f.nominator, 75948);
        XCTAssertEqual(f.denominator, 24175U);
    }
    
    [self measureBlock:^{
        for (NSUInteger index = 0; index < 100; index++) {
            Fraction f = FractionFromDecimal(x, 0.0000001, 100000);
            XCTAssertEqual(f.nominator, 75948);
            XCTAssertEqual(f.denominator, 24175U);
        }
    }];
}


- (void)test_minus_3_14159265358979323846 {
    double x = -3.14159265358979323846;
    {
        Fraction f = FractionFromDecimal(x, 0.01, 100);
        XCTAssertEqual(f.nominator, -22);
        XCTAssertEqual(f.denominator, 7U);
    }{
        Fraction f = FractionFromDecimal(x, 0.001, 1000);
        XCTAssertEqual(f.nominator, -201);
        XCTAssertEqual(f.denominator, 64U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0001, 1000);
        XCTAssertEqual(f.nominator, -333);
        XCTAssertEqual(f.denominator, 106U);
    }{
        Fraction f = FractionFromDecimal(x, DBL_EPSILON, ULONG_MAX);
        XCTAssertEqual(f.nominator, -245850922);
        XCTAssertEqual(f.denominator, 78256779U);
    }
}



@end


