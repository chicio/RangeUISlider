//
//  StepCalculator.swift
//  RangeUISliderTests
//
//  Created by Fabrizio Duroni on 29.12.20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import RangeUISlider

class StepCalculatorTest: XCTestCase {
    func testCalculateStepWidthInvalidIncrement() throws {
        let stepWidth = StepCalculator().calculateStepWidth(
            stepIncrement: 0,
            scale: Scale(scaleMinValue: 10, scaleMaxValue: 20),
            barWidth: 100
        )

        XCTAssertEqual(stepWidth, 1)
    }

    func testCalculateStepWidth() throws {
        let stepWidth = StepCalculator().calculateStepWidth(
            stepIncrement: 5,
            scale: Scale(scaleMinValue: 0, scaleMaxValue: 100),
            barWidth: 100
        )

        XCTAssertEqual(stepWidth, 5)
    }
}
