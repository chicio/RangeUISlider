//
//  RangeSelectedCalculatorTest.swift
//  RangeSelectedCalculatorTest
//
//  Created by Fabrizio Duroni on 29.12.20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import RangeUISlider

class RangeSelectedCalculatorTest: XCTestCase {
    func testDefaultScale() throws {
        let rangeSelectedCalculator = RangeSelectedCalculator(scale: 1, scaleMinValue: 0)
        
        let rangeSelected = rangeSelectedCalculator.calculateRangeSelected(leftKnobPosition: 20, rightKnobPosition: -30, barWidth: 100)
        
        XCTAssertEqual(rangeSelected.minValue, 0.2)
        XCTAssertEqual(rangeSelected.maxValue, 0.7)
    }
    
    func testCustomScale() throws {
        let rangeSelectedCalculator = RangeSelectedCalculator(scale: 20, scaleMinValue: 5)
        
        let rangeSelected = rangeSelectedCalculator.calculateRangeSelected(leftKnobPosition: 20, rightKnobPosition: -30, barWidth: 100)
        
        XCTAssertEqual(rangeSelected.minValue, 9.0)
        XCTAssertEqual(rangeSelected.maxValue, 19.0)
    }
}
