//
//  RangeUISliderUITests.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 28.12.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest

class RangeUISliderUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let rangeuislidercustomscaleElement = XCUIApplication().otherElements["RangeUISliderCustomScale"]
        let rightKnob = rangeuislidercustomscaleElement/*@START_MENU_TOKEN@*/.otherElements["RightKnob"]/*[[".otherElements[\"Bar\"].otherElements[\"RightKnob\"]",".otherElements[\"RightKnob\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element
        let leftKnob = rangeuislidercustomscaleElement/*@START_MENU_TOKEN@*/.otherElements["LeftKnob"]/*[[".otherElements[\"Bar\"].otherElements[\"LeftKnob\"]",".otherElements[\"LeftKnob\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element

        let leftKnobStartingPoint = leftKnob.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let rightKnobStartingPoint = rightKnob.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        
        leftKnobStartingPoint.press(forDuration: 0.3, thenDragTo: rightKnobStartingPoint)

        expectation(for: NSPredicate(format: "label == 'Min value selected: 144.0 \\nMax value selected: 145.0'"), evaluatedWith: XCUIApplication().staticTexts["rangeSliderCustomScaleLabel"])
        waitForExpectations(timeout: 5)
    }
}
