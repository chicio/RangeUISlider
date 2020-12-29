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
        let leftKnob = tablesQuery/*@START_MENU_TOKEN@*/.otherElements["LeftKnob"]/*[[".cells",".otherElements[\"RangeUISliderInsideTableView\"]",".otherElements[\"Bar\"].otherElements[\"LeftKnob\"]",".otherElements[\"LeftKnob\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element
        let rightKnob = tablesQuery/*@START_MENU_TOKEN@*/.otherElements["RightKnob"]/*[[".cells",".otherElements[\"RangeUISliderInsideTableView\"]",".otherElements[\"Bar\"].otherElements[\"RightKnob\"]",".otherElements[\"RightKnob\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element
        let middleMarker = app.tables/*@START_MENU_TOKEN@*/.otherElements["middleMarker"]/*[[".cells.otherElements[\"middleMarker\"]",".otherElements[\"middleMarker\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                
        leftKnob.press(forDuration: 0.1, thenDragTo: middleMarker)
        rightKnob.press(forDuration: 0.1, thenDragTo: middleMarker)

        expectation(
            for: NSPredicate(format: "self > 0.4 AND self < 0.6"),
            evaluatedWith: (tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["minValueSelected"]/*[[".cells",".staticTexts[\"0.995\"]",".staticTexts[\"minValueSelected\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 0.4 AND self < 0.6"),
            evaluatedWith: (tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["maxValueSelected"]/*[[".cells",".staticTexts[\"0.0\"]",".staticTexts[\"maxValueSelected\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.label as NSString).floatValue
        )
        waitForExpectations(timeout: 5)
    }
}
