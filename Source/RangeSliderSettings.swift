//
//  RangeSliderSettings.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 06.01.21.
//  2021 Fabrizio Duroni.
//

import SwiftUI

@available(iOS 14.0, *)
class RangeSliderSettings {
    var values: [String: Any] = [:]
    
    var stepIncrement: CGFloat?
    var defaultValueLeftKnob: CGFloat = 0.0
    var defaultValueRightKnob: CGFloat = 1.0
    var scaleMinValue: CGFloat = 0.0
    var scaleMaxValue: CGFloat = 1.0
    var rangeSelectedColor: Color = Color.blue
    var rangeSelectedBackgroundImageName: String?
    var rangeSelectedBackgroundEdgeInsetTop: CGFloat = 0.0
    var rangeSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0
    var rangeSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0
    var rangeSelectedBackgroundEdgeInsetRight: CGFloat = 5.0
    var rangeSelectedGradientColor1: Color?
    var rangeSelectedGradientColor2: Color?
    var rangeSelectedGradientStartPoint: CGPoint = CGPoint()
    var rangeSelectedGradientEndPoint: CGPoint = CGPoint()
    var rangeNotSelectedColor: Color = Color.gray
    var rangeNotSelectedBackgroundImageName: String?
    var rangeNotSelectedBackgroundEdgeInsetTop: CGFloat = 0.0
    var rangeNotSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0
    var rangeNotSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0
    var rangeNotSelectedBackgroundEdgeInsetRight: CGFloat = 5.0
    var rangeNotSelectedGradientColor1: Color?
    var rangeNotSelectedGradientColor2: Color?
    var rangeNotSelectedGradientStartPoint: CGPoint = CGPoint()
    var rangeNotSelectedGradientEndPoint: CGPoint = CGPoint()
    var leftKnobWidth: CGFloat = 30.0
    var leftKnobHeight: CGFloat = 30.0
    var leftKnobCorners: CGFloat = 15.0
    var leftKnobImageName: String?
    var leftKnobColor: Color = Color.red
    var leftShadowOpacity: Float?
    var leftShadowColor: Color?
    var leftShadowOffset: CGSize?
    var leftShadowRadius: CGFloat?
    var leftKnobGradientColor1: Color?
    var leftKnobGradientColor2: Color?
    var leftKnobGradientStartPoint: CGPoint?
    var leftKnobGradientEndPoint: CGPoint?
    var leftKnobBorderWidth: CGFloat?
    var leftKnobBorderColor: Color?
    var rightKnobWidth: CGFloat = 30.0
    var rightKnobHeight: CGFloat = 30.0
    var rightKnobCorners: CGFloat = 15.0
    var rightKnobImageName: String?
    var rightKnobColor: Color = Color.red
    var rightShadowOpacity: Float?
    var rightShadowColor: Color?
    var rightShadowOffset: CGSize?
    var rightShadowRadius: CGFloat?
    var rightKnobGradientColor1: Color?
    var rightKnobGradientColor2: Color?
    var rightKnobGradientStartPoint: CGPoint?
    var rightKnobGradientEndPoint: CGPoint?
    var rightKnobBorderWidth: CGFloat?
    var rightKnobBorderColor: Color?
    var barHeight: CGFloat = 15.0
    var barLeading: CGFloat = 20.0
    var barTrailing: CGFloat = 20.0
    var barCorners: CGFloat = 0.0
    var barShadowOpacity: Float = 0.0
    var barShadowColor: Color = Color.clear
    var barShadowOffset: CGSize = CGSize()
    var barShadowRadius: CGFloat = 0.0
    var barBorderWidth: CGFloat = 0.0
    var barBorderColor: Color = Color.clear
    var containerCorners: CGFloat = 0.0
}
