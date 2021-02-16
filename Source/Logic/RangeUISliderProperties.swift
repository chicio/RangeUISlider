//
//  RangeUISliderProperties.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 16/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class RangeUISliderProperties {
    var previousRangeSelected: RangeSelected
    var scale: Scale
    private let rangeSelectedCalculator: RangeSelectedCalculator = RangeSelectedCalculator()

    init(scale: Scale, previousRangeSelected: RangeSelected) {
        self.previousRangeSelected = previousRangeSelected
        self.scale = scale
    }

    func updateRangeSelectedCalculator(knobsHorizontalPosition: KnobsHorizontalPosition, barWidth: CGFloat) {
        previousRangeSelected = calculateSelectedRange(
            knobsHorizontalPosition: knobsHorizontalPosition,
            barWidth: barWidth
        )
    }

    func calculateSelectedRange(knobsHorizontalPosition: KnobsHorizontalPosition, barWidth: CGFloat) -> RangeSelected {
        return rangeSelectedCalculator.calculate(
            scale: scale,
            knobPositions: knobsHorizontalPosition,
            barWidth: barWidth
        )
    }
}
