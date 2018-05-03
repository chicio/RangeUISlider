//
//  RangeUISliderDelegate.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation

/**
 Protocol used delegate the read of the RangeUISlider data. Multiple RangeUISlider instance could use the same delegate.
 The current slider (on which the user is tapping) is returned in all the methods (so that could be identified on the
 delegate class).
 */
@objc public protocol RangeUISliderDelegate {
    /**
     Calls the delegate when the user is changing the range by moving the knobs.
     
     - parameter minValueSelected: the minimum value selected.
     - parameter maxValueSelected: the maximum value selected.
     - parameter slider: the slider on which the range has been modified.
     */
    @objc optional func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider)
    
    /**
     Calls the delegate when the user has finished the change of the range.
     
     - parameter minValueSelected: the minimum value selected.
     - parameter maxValueSelected: the maximum value selected.
     - parameter slider: the slider on which the range has been modified.
     */
    @objc func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider)
}
