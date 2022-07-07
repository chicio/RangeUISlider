//
//  RangeUISliderDelegateEvents.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 07/07/22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A range change event.
 */
@objc public class RangeUISliderChangeEvent: NSObject {
    /// The minimum value selected.
    public let minValueSelected: CGFloat
    /// The max value selected.
    public let maxValueSelected: CGFloat
    /// The slider that generated the event
    public let slider: RangeUISlider

    init(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        self.minValueSelected = minValueSelected
        self.maxValueSelected = maxValueSelected
        self.slider = slider
    }
}

@objc public class RangeUISliderChangeFinishedEvent: NSObject {
    /// The minimum value selected.
    public let minValueSelected: CGFloat
    /// The max value selected.
    public let maxValueSelected: CGFloat
    /// The slider that generated the event.
    public let slider: RangeUISlider
    /// A boolean indicating if there was a user interaction.
    public let userInteraction: Bool

    init(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider, userInteraction: Bool) {
        self.minValueSelected = minValueSelected
        self.maxValueSelected = maxValueSelected
        self.slider = slider
        self.userInteraction = userInteraction
    }
}
