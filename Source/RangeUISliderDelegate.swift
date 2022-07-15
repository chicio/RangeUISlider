//
//  RangeUISliderDelegate.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

/**
 Protocol used delegate the read of the RangeUISlider data. Multiple RangeUISlider instance could use the same delegate.
 The current slider (on which the user is tapping) is returned in all the methods (so that could be identified on the
 delegate class).
 */
@objc public protocol RangeUISliderDelegate {
    /**
     Calls the delegate when the user has started the change of the range.
     */
    @objc optional func rangeChangeStarted()

    /**
     Calls the delegate when the user is changing the range by moving the knobs.
     
     - parameter event: the change event data. See `RangeUISliderChangeEvent`.
     */
    @objc optional func rangeIsChanging(event: RangeUISliderChangeEvent)

    /**
     Calls the delegate when the user has finished the change of the range.
     
     - parameter event: the change finish event data. See `RangeUISliderChangeFinishedEvent`.
     */
    @objc func rangeChangeFinished(event: RangeUISliderChangeFinishedEvent)
}
