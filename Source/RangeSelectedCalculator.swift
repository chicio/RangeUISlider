//
//  RangeSelectedCalculator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 03/04/19.
//  2019 Fabrizio Duroni.
//

import Foundation

typealias RangeSelected = (minValue: CGFloat, maxValue: CGFloat)

class RangeSelectedCalculator {
    private let scale: CGFloat
    private let scaleMinValue: CGFloat
    
    init(scale: CGFloat, scaleMinValue: CGFloat) {
        self.scale = scale
        self.scaleMinValue = scaleMinValue
    }
    
    func calculateRangeSelected(leftKnobPosition: CGFloat, rightKnobPosition: CGFloat, barWidth: CGFloat) -> RangeSelected {
        let minValue = leftKnobPosition / barWidth
        let maxValue = 1.0  + rightKnobPosition / barWidth
        let scaledMinValue = linearMapping(value: minValue)
        let scaledMaxValue = linearMapping(value: maxValue)
        return (minValue: scaledMinValue, maxValue: scaledMaxValue)
    }
    
    private func linearMapping(value: CGFloat) -> CGFloat {
        return value * scale + scaleMinValue
    }
}
