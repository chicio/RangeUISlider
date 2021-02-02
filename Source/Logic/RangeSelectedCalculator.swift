//
//  RangeSelectedCalculator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 03/04/19.
//  2019 Fabrizio Duroni.
//

import UIKit

class RangeSelectedCalculator {
    func calculate(
        scale: Scale,
        knobPositions: KnobsHorizontalPosition,
        barWidth: CGFloat
    ) -> RangeSelected {
        let minValue: CGFloat = knobPositions.leftKnobPosition / barWidth
        let maxValue: CGFloat = 1.0 + knobPositions.rightKnobPosition / barWidth
        let scaledMinValue = linearMapping(value: minValue, scale: scale)
        let scaledMaxValue = linearMapping(value: maxValue, scale: scale)
        return RangeSelected(minValue: scaledMinValue, maxValue: scaledMaxValue)
    }

    private func linearMapping(value: CGFloat, scale: Scale) -> CGFloat {
        return value * scale.scale + scale.scaleMinValue
    }
}
