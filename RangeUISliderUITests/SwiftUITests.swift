//
//  SwiftUITests.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 04/02/21.
//  2021 Fabrizio Duroni.
//

import Foundation

import XCTest

class SwiftUITests: XCTestCase {
    func testCustomScale() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["TabBar"].buttons["GroupedFeatures"].tap()
        app.tables.staticTexts["SwiftUI"].tap()

        let rangeuisliderstandardElement = app.otherElements["RangeUISliderStandard"]
        let minValueSelectedLabel = app.staticTexts["minValueSelectedLabel"]
        let maxValueSelectedLabel = app.staticTexts["maxValueSelectedLabel"]
        let middleMarker = app.otherElements["middleMarker"]
        let endMarker = app.otherElements["endMarker"]
        let leftKnob = rangeuisliderstandardElement
            .otherElements["LeftKnob"]
            .children(matching: .other)
            .element
        let rightKnob = rangeuisliderstandardElement
            .otherElements["RightKnob"]
            .children(matching: .other)
            .element

        leftKnob.press(forDuration: 0.1, thenDragTo: middleMarker)
        rightKnob.press(forDuration: 0.1, thenDragTo: endMarker)

        expectation(
            for: NSPredicate(format: "self > 35.0 AND self < 40.0"),
            evaluatedWith: (minValueSelectedLabel.label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 77.0 AND self < 83.0"),
            evaluatedWith: (maxValueSelectedLabel.label as NSString).floatValue
        )
        waitForExpectations(timeout: 5)
    }

    func testStepIncrement() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["TabBar"].buttons["GroupedFeatures"].tap()
        app.tables.staticTexts["SwiftUI"].tap()

        let rangeuisliderstandardElement = app.otherElements["RangeUISliderStep"]
        let minValueSelectedLabel = app.staticTexts["minValueSelectedLabel"]
        let maxValueSelectedLabel = app.staticTexts["maxValueSelectedLabel"]
        let middleMarker = app.otherElements["middleMarker"]
        let endMarker = app.otherElements["endMarker"]
        let leftKnob = rangeuisliderstandardElement
            .otherElements["LeftKnob"]
            .children(matching: .other)
            .element
        let rightKnob = rangeuisliderstandardElement
            .otherElements["RightKnob"]
            .children(matching: .other)
            .element

        leftKnob.press(forDuration: 0.1, thenDragTo: middleMarker)
        rightKnob.press(forDuration: 0.1, thenDragTo: endMarker)

        expectation(
            for: NSPredicate(format: "self > 6.0 AND self < 10.0"),
            evaluatedWith: (minValueSelectedLabel.label as NSString).floatValue
        )
        expectation(
            for: NSPredicate(format: "self > 17.0 AND self =< 20.0"),
            evaluatedWith: (maxValueSelectedLabel.label as NSString).floatValue
        )
        waitForExpectations(timeout: 5)
    }
}
