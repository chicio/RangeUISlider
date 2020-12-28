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

    func testCustomScale() throws {
        let app = XCUIApplication()
        app.launch()

        let rangeUISliderCustomScaleElement = app.otherElements["RangeUISliderCustomScale"]
        let minValueSelectedLabel = app.staticTexts["minValueSelectedLabel"]
        let maxValueSelectedLabel = app.staticTexts["maxValueSelectedLabel"]
        let middleMarker = XCUIApplication().otherElements["middleMarker"]
        let endMarker = XCUIApplication().otherElements["endMarker"]
        let rightKnob = rangeUISliderCustomScaleElement/*@START_MENU_TOKEN@*/.otherElements["RightKnob"]/*[[".otherElements[\"Bar\"].otherElements[\"RightKnob\"]",".otherElements[\"RightKnob\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element
        let leftKnob = rangeUISliderCustomScaleElement/*@START_MENU_TOKEN@*/.otherElements["LeftKnob"]/*[[".otherElements[\"Bar\"].otherElements[\"LeftKnob\"]",".otherElements[\"LeftKnob\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element
        
        leftKnob.press(forDuration: 0.1, thenDragTo: middleMarker)
        rightKnob.press(forDuration: 0.1, thenDragTo: endMarker)

        expectation(
            for: NSPredicate(format: "self > 143.0 AND self < 146.0"),
            evaluatedWith: (minValueSelectedLabel.label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 193.0 AND self < 196.0"),
            evaluatedWith: (maxValueSelectedLabel.label as NSString).floatValue
        )
        waitForExpectations(timeout: 5)
    }
    
//    func testRightToLeft() {
//        let app = XCUIApplication()
//        app.launchArguments += ["-AppleTextDirection", "YES"]
//        app.launchArguments += ["-NSForceRightToLeftWritingDirection", "YES"]
//        app.launch()
//
//        /// TODO: to make a right to left test used the launch code above
//    }
}
