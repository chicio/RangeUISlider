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
    let knobsLabelAnimator: KnobsLabelAnimator

    init(leftKnob: Knob, rightKnob: Knob) {
        self.leftKnob = leftKnob
        self.rightKnob = rightKnob
        self.knobsLabelAnimator = KnobsLabelAnimator(leftKnob: leftKnob, rightKnob: rightKnob)
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

    func animateLabels(shouldShow: Bool) {
        knobsLabelAnimator.animate(shouldShow: shouldShow)
    }

    func updateLabels(minValueSelected: CGFloat, maxValueSelected: CGFloat) {
        leftKnob.components.knobLabel.label.text = String(format: "%.2f", minValueSelected)
        rightKnob.components.knobLabel.label.text = String(format: "%.2f", maxValueSelected)
    }

    private func addCornersTo(knob: Knob, corners: CGFloat) {
        knob.components.backgroundView.layer.cornerRadius = corners
    }
}
