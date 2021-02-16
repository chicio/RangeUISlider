//
//  RangeUpdater.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 16/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class RangeUpdater: KnobGestureManagerDelegate {
    unowned let delegate: RangeUpdaterDelegate
    unowned let properties: RangeUISliderProperties
    unowned let components: RangeUISliderComponents

    init(properties: RangeUISliderProperties, components: RangeUISliderComponents, delegate: RangeUpdaterDelegate) {
        self.properties = properties
        self.components = components
        self.delegate = delegate
    }

    func rangeChangeStarted() {
        delegate.rangeChangeStarted()
    }

    internal func rangeSelectionUpdate() {
        let rangeSelected = calculateSelectedRange()

        if isDifferentFromPreviousRangeSelected(rangeSelected: rangeSelected) {
            delegate.rangeIsChanging(
                minValueSelected: rangeSelected.minValue,
                maxValueSelected: rangeSelected.maxValue
            )
            properties.previousRangeSelected = rangeSelected
        }
    }

    private func isDifferentFromPreviousRangeSelected(rangeSelected: RangeSelected) -> Bool {
        return rangeSelected.minValue != properties.previousRangeSelected.minValue
            || rangeSelected.maxValue != properties.previousRangeSelected.maxValue
    }

    internal func rangeSelectionFinished() {
        let rangeSelected = calculateSelectedRange()

        if !rangeSelected.maxValue.isNaN && !rangeSelected.maxValue.isNaN {
            delegate.rangeChangeFinished(
                minValueSelected: rangeSelected.minValue,
                maxValueSelected: rangeSelected.maxValue
            )
        }
    }

    private func calculateSelectedRange() -> RangeSelected {
        return properties.calculateSelectedRange(
            knobsHorizontalPosition: components.knobs.horizontalPositions(),
            barWidth: components.bar.frame.width
        )
    }
}
