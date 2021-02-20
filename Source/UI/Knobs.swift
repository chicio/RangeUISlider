//
//  Knobs.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class Knobs {
    let leftKnob: Knob
    let rightKnob: Knob

    init(leftKnob: Knob, rightKnob: Knob) {
        self.leftKnob = leftKnob
        self.rightKnob = rightKnob
    }

    func horizontalPositions() -> KnobsHorizontalPosition {
        return KnobsHorizontalPosition(
            leftKnobPosition: leftKnob.xPositionConstraint.constant,
            rightKnobPosition: rightKnob.xPositionConstraint.constant
        )
    }

    func addCornersToLeftKnob(leftKnobCorners: CGFloat) {
        addCornersTo(knob: leftKnob, corners: leftKnobCorners)
    }

    func addCornersToRightKnob(rightKnobCorners: CGFloat) {
        addCornersTo(knob: rightKnob, corners: rightKnobCorners)
    }
    
    func showLabels(shouldShow: Bool) {
        leftKnob.showLabels(shouldShow: shouldShow)
        rightKnob.showLabels(shouldShow: shouldShow)
    }

    func updateLabels(minValueSelected: CGFloat, maxValueSelected: CGFloat) {
        leftKnob.label.text = String(format: "%.2f", minValueSelected)
        rightKnob.label.text = String(format: "%.2f", maxValueSelected)
    }

    private func addCornersTo(knob: Knob, corners: CGFloat) {
        knob.backgroundView.layer.cornerRadius = corners
    }
}
