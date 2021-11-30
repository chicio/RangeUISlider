//
//  ProgrammaticKnobChange.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 02/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class ProgrammaticKnobChange {
    private unowned let bar: Bar
    private unowned let knobs: Knobs
    private unowned let delegate: ProgrammaticKnobChangeDelegate

    init(bar: Bar, knobs: Knobs, delegate: ProgrammaticKnobChangeDelegate) {
        self.bar = bar
        self.knobs = knobs
        self.delegate = delegate
    }

    func programmaticallyChangeLeftKnob(value: CGFloat) {
        programmaticallyChangeKnob(
            value: value,
            constraintUpdate: calculateLeftKnobPositionFrom,
            isValid: isValidForLeftKnob
        )
    }

    func programmaticallyChangeRightKnob(value: CGFloat) {
        programmaticallyChangeKnob(
            value: value,
            constraintUpdate: calculateRightKnobPositionFrom,
            isValid: isValidforRightKnob
        )
    }

    private func programmaticallyChangeKnob(
        value: CGFloat,
        constraintUpdate: (CGFloat) -> Void,
        isValid: (CGFloat) -> Bool
    ) {
        if isValid(value) {
            constraintUpdate(value)
            delegate.programmaticChangeCompleted()
        }
    }

    private func calculateLeftKnobPositionFrom(value: CGFloat) {
        let valueInScale = convertToScale(value: value, scale: delegate.properties.scale)
        knobs.leftKnob.xPositionConstraint.constant = bar.frame.width * valueInScale
    }

    private func calculateRightKnobPositionFrom(value: CGFloat) {
        let valueInScale = convertToScale(value: value, scale: delegate.properties.scale)
        knobs.rightKnob.xPositionConstraint.constant = (bar.frame.width * valueInScale) - bar.frame.width
    }

    private func convertToScale(value: CGFloat, scale: Scale) -> CGFloat {
        return (value - scale.scaleMinValue) / scale.scale
    }

    private func isValidForLeftKnob(value: CGFloat) -> Bool {
        return value > delegate.properties.scale.scaleMinValue
            && value <= delegate.properties.previousRangeSelected.maxValue
    }

    private func isValidforRightKnob(value: CGFloat) -> Bool {
        return value <= delegate.properties.scale.scaleMaxValue
            && value >= delegate.properties.previousRangeSelected.minValue
    }
}
