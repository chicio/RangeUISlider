//
//  ProgrammaticKnobChange.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 29.12.20.
//  2020 Fabrizio Duroni.
//

import XCTest

class ProgrammaticKnobChangeTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testProgrammaticKnobChange() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Grouped features"].tap()
        app
            .tables
            .staticTexts["Programmatic knob change"]
            .tap()

        _ = app.staticTexts["minValueSelected"].waitForExistence(timeout: 5)
        _ = app.staticTexts["maxValueSelected"].waitForExistence(timeout: 5)

        sleep(5)

        expectation(
            for: NSPredicate(format: "self > 43.0 AND self < 47.0"),
            evaluatedWith: (app.staticTexts["minValueSelected"].label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 88.0 AND self < 92.0"),
            evaluatedWith: (
                app
                    .staticTexts["maxValueSelected"]
                    .label as NSString
            ).floatValue
        )
        waitForExpectations(timeout: 5)
    }
}
