//
//  StepCalculator.swift
//  RangeUISliderTests
//
//  Created by Fabrizio Duroni on 29.12.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import RangeUISlider

class StepCalculatorTest: XCTestCase {
    func testCalculateNumberOfStepsInvalidIncrement() throws {
        let numberOfSteps = StepCalculator().calculateNumberOfSteps(scale: 1, stepIncrement: 0)

        XCTAssertEqual(numberOfSteps, 0)
    }

    func testCalculateNumberOfSteps() throws {
        let numberOfSteps = StepCalculator().calculateNumberOfSteps(scale: 10, stepIncrement: 2)

        XCTAssertEqual(numberOfSteps, 5)
    }

    func testCalculateStepWidthInvalidIncrement() throws {
        let stepWidth = StepCalculator().calculateStepWidth(barWidth: 100, numberOfSteps: 0)

        XCTAssertEqual(stepWidth, 1)
    }

    func testCalculateStepWidth() throws {
        let stepWidth = StepCalculator().calculateStepWidth(barWidth: 100, numberOfSteps: 20)

        XCTAssertEqual(stepWidth, 5)
    }
}
