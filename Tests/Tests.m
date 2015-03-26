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
        for (NSUInteger index = 0; index < 10000; index++) {
            Fraction f = FractionFromDecimal(x, 0.0000001, 10000);
            XCTAssertEqual(f.nominator, 1532);
            XCTAssertEqual(f.denominator, 3311U);
        }
    }];
}


- (void)test_3_14159265358979323846 {
    double x = 3.14159265358979323846;
    {
        Fraction f = FractionFromDecimal(x, 0.02, 100);
        XCTAssertEqual(f.nominator, 3);
        XCTAssertEqual(f.denominator, 1U);
    }{
        Fraction f = FractionFromDecimal(x, 0.01, 100);
        XCTAssertEqual(f.nominator, 16);
        XCTAssertEqual(f.denominator, 5U);
    }{
        Fraction f = FractionFromDecimal(x, 0.001, 100);
        XCTAssertEqual(f.nominator, 22);
        XCTAssertEqual(f.denominator, 7U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0001, 1000);
        XCTAssertEqual(f.nominator, 201);
        XCTAssertEqual(f.denominator, 64U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0000001, 1000);
        XCTAssertEqual(f.nominator, 355);
        XCTAssertEqual(f.denominator, 113U);
    }
    
    [self measureBlock:^{
        for (NSUInteger index = 0; index < 10000; index++) {
            Fraction f = FractionFromDecimal(x, 0.0000001, 1000);
            XCTAssertEqual(f.nominator, 355);
            XCTAssertEqual(f.denominator, 113U);
        }
    }];
}


- (void)test_minus_3_14159265358979323846 {
    double x = -3.14159265358979323846;
    {
        Fraction f = FractionFromDecimal(x, 0.02, 100);
        XCTAssertEqual(f.nominator, -3);
        XCTAssertEqual(f.denominator, 1U);
    }{
        Fraction f = FractionFromDecimal(x, 0.01, 100);
        XCTAssertEqual(f.nominator, -16);
        XCTAssertEqual(f.denominator, 5U);
    }{
        Fraction f = FractionFromDecimal(x, 0.001, 100);
        XCTAssertEqual(f.nominator, -22);
        XCTAssertEqual(f.denominator, 7U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0001, 1000);
        XCTAssertEqual(f.nominator, -201);
        XCTAssertEqual(f.denominator, 64U);
    }{
        Fraction f = FractionFromDecimal(x, 0.0000001, 1000);
        XCTAssertEqual(f.nominator, -355);
        XCTAssertEqual(f.denominator, 113U);
    }
}



@end


