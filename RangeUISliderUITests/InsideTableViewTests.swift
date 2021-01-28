//
//  InsideTableViewTests.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 29.12.20.
//  2020 Fabrizio Duroni.
//

import Foundation

import XCTest

class InsideTableViewTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testInsideTableView() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["TabBar"].buttons["GroupedFeatures"].tap()
        app.tables.cells["InsideUITableView"].tap()
        let tablesQuery = app.tables
        let leftKnob = tablesQuery.otherElements["LeftKnob"].children(matching: .other).element
        let rightKnob = tablesQuery.otherElements["RightKnob"].children(matching: .other).element
        let middleMarker = app.tables.otherElements["middleMarker"]

        leftKnob.press(forDuration: 0.1, thenDragTo: middleMarker)
        rightKnob.press(forDuration: 0.1, thenDragTo: middleMarker)

        expectation(
            for: NSPredicate(format: "self > 0.4 AND self < 0.6"),
            evaluatedWith: (tablesQuery.staticTexts["minValueSelected"].label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 0.4 AND self < 0.6"),
            evaluatedWith: (tablesQuery.staticTexts["maxValueSelected"].label as NSString).floatValue
        )
        waitForExpectations(timeout: 5)
    }
}
