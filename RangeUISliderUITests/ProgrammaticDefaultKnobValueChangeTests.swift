//
//  ProgrammaticKnobChange.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 15.02.21.
//  2021 Fabrizio Duroni.
//

import XCTest

class ProgrammaticDefaultKnobValueChangeTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testProgrammaticKnobChange() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Grouped features"].tap()
        app
            .tables
            .staticTexts["Programmatic default knob value change"]
            .tap()

        _ = app.staticTexts["minValueSelected"].waitForExistence(timeout: 5)
        _ = app.staticTexts["maxValueSelected"].waitForExistence(timeout: 5)

        sleep(5)

        expectation(
            for: NSPredicate(format: "self > 68 AND self < 72.0"),
            evaluatedWith: (app.staticTexts["minValueSelected"].label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 108.0 AND self < 112.0"),
            evaluatedWith: (
                app
                    .staticTexts["maxValueSelected"]
                    .label as NSString
            ).floatValue
        )
        waitForExpectations(timeout: 5)
    }
}
