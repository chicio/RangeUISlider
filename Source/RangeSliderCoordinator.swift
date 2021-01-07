//
//  RangeSliderCoordinator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 06.01.21.
//  2021 Fabrizio Duroni.
//

import Foundation

@available(iOS 14.0, *)
public class RangeSliderCoordinator: RangeUISliderDelegate {
    private let rangeSlider: RangeSlider
    
    init(rangeSlider: RangeSlider) {
        self.rangeSlider = rangeSlider
    }
    
    public func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        self.rangeSlider.minValueSelected = minValueSelected
        self.rangeSlider.maxValueSelected = maxValueSelected
    }
    
    public func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        self.rangeSlider.minValueSelected = minValueSelected
        self.rangeSlider.maxValueSelected = maxValueSelected
    }
}
