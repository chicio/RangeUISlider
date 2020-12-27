//
//  RangeSelectedCalculator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 03/04/19.
//  2019 Fabrizio Duroni.
//

import Foundation
import UIKit

typealias RangeSelected = (minValue: CGFloat, maxValue: CGFloat)

class RangeSelectedCalculator {
    private let scale: CGFloat
    private let scaleMinValue: CGFloat
    private let rightToLeft: Bool
    
    init(scale: CGFloat, scaleMinValue: CGFloat, rightToLeft: Bool) {
        self.scale = scale
        self.scaleMinValue = scaleMinValue
        self.rightToLeft = rightToLeft
    }
    
    func calculateRangeSelected(leftKnobPosition: CGFloat, rightKnobPosition: CGFloat, barWidth: CGFloat) -> RangeSelected {
        var minValue: CGFloat
        var maxValue: CGFloat
        
        if rightToLeft {
            minValue = -rightKnobPosition / barWidth
            maxValue = 1.0 - leftKnobPosition / barWidth
        } else {
            minValue = leftKnobPosition / barWidth
            maxValue = 1.0 + rightKnobPosition / barWidth
        }
        
        let scaledMinValue = linearMapping(value: minValue)
        let scaledMaxValue = linearMapping(value: maxValue)
        return (minValue: scaledMinValue, maxValue: scaledMaxValue)
    }
    
    private func linearMapping(value: CGFloat) -> CGFloat {
        return value * scale + scaleMinValue
    }
}
