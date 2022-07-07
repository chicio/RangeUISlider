//
//  RangeSliderCoordinator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 06.01.21.
//  2021 Fabrizio Duroni.
//

#if canImport(SwiftUI)
import Foundation
import CoreGraphics

/**
 RangeUISlider SwiftUI coordinator.
 The coordinator is the delegate of the `RangeUISlider` instance wrapped by `RangeSlider`.
 It implements the delegate method to update the mininimum and maximum value
 selected and set them on the `RangeSlider` binding values.
 */
@available(iOS 14.0, *)
public class RangeSliderCoordinator: RangeUISliderDelegate {
    private let rangeSlider: RangeSlider

    init(rangeSlider: RangeSlider) {
        self.rangeSlider = rangeSlider
    }

    /**
     Implementation of the `RangeUISliderDelegate.rangeIsChanging` delegate method
     
     - parameter minValueSelected: the minimum value selected.
     - parameter maxValueSelected: the maximum value selected.
     - parameter slider: the slider on which the range has been modified.
     */
    public func rangeIsChanging(event: RangeUISliderChangeEvent) {
        self.rangeSlider.minValueSelected = event.minValueSelected
        self.rangeSlider.maxValueSelected = event.maxValueSelected
    }

    /**
     Implementation of the `RangeUISliderDelegate.rangeChangeFinished` delegate method
     
     - parameter minValueSelected: the minimum value selected.
     - parameter maxValueSelected: the maximum value selected.
     - parameter slider: the slider on which the range has been modified.
     - parameter userInteraction: a boolean indicating if the change comes from user interaction
     */
    public func rangeChangeFinished(event: RangeUISliderChangeFinishedEvent) {
        if event.userInteraction == true {
            self.rangeSlider.minValueSelected = event.minValueSelected
            self.rangeSlider.maxValueSelected = event.maxValueSelected
        }
    }
}
#endif
