//
//  ProgrammaticScaleChangeTests.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 29.12.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest

class ProgrammaticScaleChangeTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testProgrammaticScaleChange() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Grouped features"].tap()
        app.tables.staticTexts["Programmatic scale change"].tap()

        _ = app.staticTexts["minValueSelected"].waitForExistence(timeout: 10)
        _ = app.staticTexts["maxValueSelected"].waitForExistence(timeout: 10)
        
        sleep(5)
        
        expectation(
            for: NSPredicate(format: "self > 58.0 AND self < 62.0"),
            evaluatedWith: (app.staticTexts["minValueSelected"].label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 188.0 AND self < 192.0"),
            evaluatedWith: (app/*@START_MENU_TOKEN@*/.staticTexts["maxValueSelected"]/*[[".staticTexts[\"85.0\"]",".staticTexts[\"maxValueSelected\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label as NSString).floatValue
        )
        waitForExpectations(timeout: 10)
    }
}
