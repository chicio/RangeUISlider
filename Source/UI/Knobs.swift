//
//  Knobs.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  Copyright © 2021 Fabrizio Duroni. All rights reserved.
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

    private func addCornersTo(knob: Knob, corners: CGFloat) {
        knob.backgroundView.layer.cornerRadius = corners
        knob.backgroundView.layer.masksToBounds = corners > 0.0
    }
}
