//
//  ProgrammaticKnobChange.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 02/02/21.
//  Copyright © 2021 Fabrizio Duroni. All rights reserved.
//

import UIKit

protocol ProgrammaticKnobChangeDelegate: class {
    func programmaticChangeCompleted()
}

class ProgrammaticKnobChange {
    private unowned let bar: Bar
    private unowned let knobs: Knobs
    private unowned let delegate: ProgrammaticKnobChangeDelegate

    init(bar: Bar, knobs: Knobs, delegate: ProgrammaticKnobChangeDelegate) {
        self.bar = bar
        self.knobs = knobs
        self.delegate = delegate
    }

    func programmaticallyChangeLeftKnob(
        value: CGFloat,
        scale: Scale,
        previousRangeSelected: RangeSelected
    ) {
        programmaticallyChangeKnob(
            value: value,
            constraintUpdate: calculateLeftKnobPositionFrom,
            isValid: isValidForLeftKnob,
            scale: scale,
            previousRangeSelected: previousRangeSelected
        )
    }

    func programmaticallyChangeRightKnob(
        value: CGFloat,
        scale: Scale,
        previousRangeSelected: RangeSelected
    ) {
        programmaticallyChangeKnob(
            value: value,
            constraintUpdate: calculateRightKnobPositionFrom,
            isValid: isValidforRightKnob,
            scale: scale,
            previousRangeSelected: previousRangeSelected
        )
    }

    private func programmaticallyChangeKnob(
        value: CGFloat,
        constraintUpdate: (CGFloat, Scale) -> Void,
        isValid: (CGFloat, Scale, RangeSelected) -> Bool,
        scale: Scale,
        previousRangeSelected: RangeSelected
    ) {
        if isValid(value, scale, previousRangeSelected) {
            constraintUpdate(value, scale)
            delegate.programmaticChangeCompleted()
        }
    }

    private func calculateLeftKnobPositionFrom(
        value: CGFloat,
        scale: Scale
    ) {
        knobs.leftKnob.xPositionConstraint.constant = bar.frame.width * convertToScale(
            value: value,
            scale: scale
        )
    }

    private func calculateRightKnobPositionFrom(
        value: CGFloat,
        scale: Scale
    ) {
        knobs.rightKnob.xPositionConstraint.constant = (bar.frame.width * convertToScale(value: value,
                                                                                         scale: scale
        )) - bar.frame.width
    }

    private func convertToScale(value: CGFloat, scale: Scale) -> CGFloat {
        return (value - scale.scaleMinValue) / scale.scale
    }

    private func isValidForLeftKnob(
        value: CGFloat,
        scale: Scale,
        previousRangeSelectedValues: RangeSelected
    ) -> Bool {
        return value > scale.scaleMinValue && value <= previousRangeSelectedValues.maxValue
    }

    private func isValidforRightKnob(
        value: CGFloat,
        scale: Scale,
        previousRangeSelectedValues: RangeSelected
    ) -> Bool {
        return value <= scale.scaleMaxValue && value >= previousRangeSelectedValues.minValue
    }
}
