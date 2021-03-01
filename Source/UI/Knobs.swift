//
//  Knobs.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

/**
 The `Knobs` UI components of RangeUIslider. It is a container of the left and right knob.
 */
public class Knobs {
    /// The left Knob. See `Knob` class.
    public let leftKnob: Knob
    /// The right Knob. See `Knob` class.
    public let rightKnob: Knob

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

    private func addCornersTo(knob: Knob, corners: CGFloat) {
        knob.backgroundView.layer.cornerRadius = corners
        knob.backgroundView.layer.masksToBounds = corners > 0.0
    }
}
