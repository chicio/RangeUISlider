//
//  RangeSlider.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 06.01.21.
//  2021 Fabrizio Duroni.
//

import SwiftUI

@available(iOS 14.0, *)
public struct RangeSlider: UIViewRepresentable {
    @Binding public var minValueSelected: CGFloat
    @Binding public var maxValueSelected: CGFloat
    private let settings = RangeSliderSettings()
    
    public init(minValueSelected: Binding<CGFloat>, maxValueSelected: Binding<CGFloat>) {
        self._minValueSelected = minValueSelected
        self._maxValueSelected = maxValueSelected
    }
    
    public func makeUIView(context: Context) -> RangeUISlider {
        let rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 20)))
        rangeSlider.delegate = context.coordinator
        rangeSlider.stepIncrement = settings.stepIncrement
        rangeSlider.defaultValueLeftKnob = settings.defaultValueLeftKnob
        rangeSlider.defaultValueRightKnob = settings.defaultValueRightKnob
        rangeSlider.scaleMinValue = settings.scaleMinValue
        rangeSlider.scaleMaxValue = settings.scaleMaxValue
        rangeSlider.rangeSelectedColor = UIColor(settings.rangeSelectedColor)
        
        if let rangeSelectedBackgroundImageName = settings.rangeSelectedBackgroundImageName {
            rangeSlider.rangeSelectedBackgroundImage = UIImage(named: rangeSelectedBackgroundImageName)
        }
        
        rangeSlider.rangeSelectedBackgroundEdgeInsetTop = settings.rangeSelectedBackgroundEdgeInsetTop
        rangeSlider.rangeSelectedBackgroundEdgeInsetLeft = settings.rangeSelectedBackgroundEdgeInsetLeft
        rangeSlider.rangeSelectedBackgroundEdgeInsetBottom = settings.rangeSelectedBackgroundEdgeInsetBottom
        rangeSlider.rangeSelectedBackgroundEdgeInsetRight = settings.rangeSelectedBackgroundEdgeInsetRight
        
        if let rangeSelectedGradientColor1 = settings.rangeSelectedGradientColor1 {
            rangeSlider.rangeSelectedGradientColor1 = UIColor(rangeSelectedGradientColor1)
        }
        
        if let rangeSelectedGradientColor2 = settings.rangeSelectedGradientColor2 {
            rangeSlider.rangeSelectedGradientColor2 = UIColor(rangeSelectedGradientColor2)
        }
        
        rangeSlider.rangeSelectedGradientStartPoint = settings.rangeSelectedGradientStartPoint
        rangeSlider.rangeSelectedGradientEndPoint = settings.rangeSelectedGradientEndPoint
        rangeSlider.rangeNotSelectedColor = UIColor(settings.rangeNotSelectedColor)
        
        if let rangeNotSelectedBackgroundImageName = settings.rangeNotSelectedBackgroundImageName {
            rangeSlider.rangeNotSelectedBackgroundImage = UIImage(named: rangeNotSelectedBackgroundImageName)
        }
        
        rangeSlider.rangeNotSelectedBackgroundEdgeInsetTop = settings.rangeNotSelectedBackgroundEdgeInsetTop
        rangeSlider.rangeNotSelectedBackgroundEdgeInsetLeft = settings.rangeNotSelectedBackgroundEdgeInsetLeft
        rangeSlider.rangeNotSelectedBackgroundEdgeInsetBottom = settings.rangeNotSelectedBackgroundEdgeInsetBottom
        rangeSlider.rangeNotSelectedBackgroundEdgeInsetRight = settings.rangeNotSelectedBackgroundEdgeInsetRight
        
        if let rangeNotSelectedGradientColor1 = settings.rangeNotSelectedGradientColor1 {
            rangeSlider.rangeNotSelectedGradientColor1 = UIColor(rangeNotSelectedGradientColor1)
        }
        
        if let rangeNotSelectedGradientColor2 = settings.rangeNotSelectedGradientColor2 {
            rangeSlider.rangeNotSelectedGradientColor2 = UIColor(rangeNotSelectedGradientColor2)
        }
        
        rangeSlider.rangeNotSelectedGradientStartPoint = settings.rangeNotSelectedGradientStartPoint
        rangeSlider.rangeNotSelectedGradientEndPoint = settings.rangeNotSelectedGradientEndPoint
        
        rangeSlider.leftKnobWidth = settings.leftKnobWidth
        rangeSlider.leftKnobHeight = settings.leftKnobHeight
        rangeSlider.leftKnobCorners = settings.leftKnobCorners
        
        if let leftKnobImageName = settings.leftKnobImageName {
            rangeSlider.leftKnobImage = UIImage(named: leftKnobImageName)
        }
        
        rangeSlider.leftKnobColor = UIColor(settings.leftKnobColor)
        
        if let leftShadowOpacity = settings.leftShadowOpacity {
            rangeSlider.leftShadowOpacity = leftShadowOpacity
        }
    
        if let leftShadowColor = settings.leftShadowColor {
            rangeSlider.leftShadowColor = UIColor(leftShadowColor)
        }
        
        if let leftShadowOffset = settings.leftShadowOffset {
            rangeSlider.leftShadowOffset = leftShadowOffset
        }
        
        if let leftShadowRadius = settings.leftShadowRadius {
            rangeSlider.leftShadowRadius = leftShadowRadius
        }
        
        if let leftKnobGradientColor1 = settings.leftKnobGradientColor1 {
            rangeSlider.leftKnobGradientColor1 = UIColor(leftKnobGradientColor1)
        }
        
        if let leftKnobGradientColor2 = settings.leftKnobGradientColor2 {
            rangeSlider.leftKnobGradientColor2 = UIColor(leftKnobGradientColor2)
        }
        
        if let leftKnobGradientStartPoint = settings.leftKnobGradientStartPoint {
            rangeSlider.leftKnobGradientStartPoint = leftKnobGradientStartPoint
        }
        
        if let leftKnobGradientEndPoint = settings.leftKnobGradientEndPoint {
            rangeSlider.leftKnobGradientEndPoint = leftKnobGradientEndPoint
        }
        
        if let leftKnobBorderWidth = settings.leftKnobBorderWidth {
            rangeSlider.leftKnobBorderWidth = leftKnobBorderWidth
        }

        if let leftKnobBorderColor = settings.leftKnobBorderColor {
            rangeSlider.leftKnobBorderColor = UIColor(leftKnobBorderColor)
        }
        
        rangeSlider.rightKnobWidth = settings.rightKnobWidth
        rangeSlider.rightKnobHeight = settings.rightKnobHeight
        rangeSlider.rightKnobCorners = settings.rightKnobCorners
        
        if let rightKnobImageName = settings.leftKnobImageName {
            rangeSlider.rightKnobImage = UIImage(named: rightKnobImageName)
        }

        rangeSlider.rightKnobColor = UIColor(settings.rightKnobColor)
        
        if let rightShadowOpacity = settings.rightShadowOpacity {
            rangeSlider.rightShadowOpacity = rightShadowOpacity
        }
    
        if let rightShadowColor = settings.rightShadowColor {
            rangeSlider.rightShadowColor = UIColor(rightShadowColor)
        }
        
        if let rightShadowOffset = settings.rightShadowOffset {
            rangeSlider.rightShadowOffset = rightShadowOffset
        }
        
        if let rightShadowRadius = settings.rightShadowRadius {
            rangeSlider.rightShadowRadius = rightShadowRadius
        }
        
        if let rightKnobGradientColor1 = settings.rightKnobGradientColor1 {
            rangeSlider.rightKnobGradientColor1 = UIColor(rightKnobGradientColor1)
        }

        if let rightKnobGradientColor2 = settings.rightKnobGradientColor2 {
            rangeSlider.rightKnobGradientColor2 = UIColor(rightKnobGradientColor2)
        }

        rangeSlider.barHeight = settings.barHeight
        rangeSlider.barLeading = settings.barLeading
        rangeSlider.barTrailing = settings.barTrailing
        rangeSlider.barCorners = settings.barCorners
        rangeSlider.barShadowOpacity = settings.barShadowOpacity
        rangeSlider.barShadowColor = UIColor(settings.barShadowColor)
        rangeSlider.barShadowOffset = settings.barShadowOffset
        rangeSlider.barShadowRadius = settings.barShadowRadius
        rangeSlider.barBorderWidth = settings.barBorderWidth
        rangeSlider.barBorderColor = UIColor(settings.barBorderColor)
        rangeSlider.containerCorners = settings.containerCorners
        
        return rangeSlider
    }

    public func updateUIView(_ uiView: RangeUISlider, context: Context) {
        
    }
    
    public func makeCoordinator() -> RangeSliderCoordinator {
        return Coordinator(rangeSlider: self)
    }
    
    //MARK: modifiers
    
    public func stepIncrement(_ value: CGFloat) -> RangeSlider {
        settings.stepIncrement = value
        return self
    }
    
    public func defaultValueLeftKnob(_ value: CGFloat) -> RangeSlider {
        settings.defaultValueLeftKnob = value
        return self
    }
    
    public func defaultValueRightKnob(_ value: CGFloat) -> RangeSlider {
        settings.defaultValueRightKnob = value
        return self
    }
    
    public func scaleMinValue(_ value: CGFloat) -> RangeSlider {
        settings.scaleMinValue = value
        return self
    }
    
    public func scaleMaxValue(_ value: CGFloat) -> RangeSlider {
        settings.scaleMaxValue = value
        return self
    }
    
    public func rangeSelectedColor(_ value: Color) -> RangeSlider {
        settings.rangeSelectedColor = value
        return self
    }

    public func rangeSelectedBackgroundImageName(_ value: String) -> RangeSlider {
        settings.rangeSelectedBackgroundImageName = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetTop(_ value: CGFloat) -> RangeSlider {
        settings.rangeSelectedBackgroundEdgeInsetTop = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetLeft(_ value: CGFloat) -> RangeSlider {
        settings.rangeSelectedBackgroundEdgeInsetLeft = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetBottom(_ value: CGFloat) -> RangeSlider {
        settings.rangeSelectedBackgroundEdgeInsetBottom = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetRight(_ value: CGFloat) -> RangeSlider {
        settings.rangeSelectedBackgroundEdgeInsetRight = value
        return self
    }
    
    public func rangeSelectedGradientColor1(_ value: Color) -> RangeSlider {
        settings.rangeSelectedGradientColor1 = value
        return self
    }
    
    public func rangeSelectedGradientColor2(_ value: Color) -> RangeSlider {
        settings.rangeSelectedGradientColor2 = value
        return self
    }

    public func rangeSelectedGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.rangeSelectedGradientStartPoint = value
        return self
    }

    public func rangeSelectedGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.rangeSelectedGradientEndPoint = value
        return self
    }

    public func rangeNotSelectedColor(_ value: Color) -> RangeSlider {
        settings.rangeNotSelectedColor = value
        return self
    }

    public func rangeNotSelectedBackgroundImageName(_ value: String) -> RangeSlider {
        settings.rangeNotSelectedBackgroundImageName = value
        return self
    }

    public func rangeNotSelectedBackgroundEdgeInsetTop(_ value: CGFloat) -> RangeSlider {
        settings.rangeNotSelectedBackgroundEdgeInsetTop = value
        return self
    }

    public func rangeNotSelectedBackgroundEdgeInsetLeft(_ value: CGFloat) -> RangeSlider {
        settings.rangeNotSelectedBackgroundEdgeInsetLeft = value
        return self
    }
    
    public func rangeNotSelectedBackgroundEdgeInsetBottom(_ value: CGFloat) -> RangeSlider {
        settings.rangeNotSelectedBackgroundEdgeInsetBottom = value
        return self
    }
    
    public func rangeNotSelectedBackgroundEdgeInsetRight(_ value: CGFloat) -> RangeSlider {
        settings.rangeNotSelectedBackgroundEdgeInsetRight = value
        return self
    }
    
    public func rangeNotSelectedGradientColor1(_ value: Color) -> RangeSlider {
        settings.rangeNotSelectedGradientColor1 = value
        return self
    }

    public func rangeNotSelectedGradientColor2(_ value: Color) -> RangeSlider {
        settings.rangeNotSelectedGradientColor2 = value
        return self
    }

    public func rangeNotSelectedGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.rangeNotSelectedGradientStartPoint = value
        return self
    }

    public func rangeNotSelectedGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.rangeNotSelectedGradientEndPoint = value
        return self
    }

    public func leftKnobWidth(_ value: CGFloat) -> RangeSlider {
        settings.leftKnobWidth = value
        return self
    }

    public func leftKnobHeight(_ value: CGFloat) -> RangeSlider {
        settings.leftKnobHeight = value
        return self
    }
    
    public func leftKnobCorners(_ value: CGFloat) -> RangeSlider {
        settings.leftKnobCorners = value
        return self
    }

    public func leftKnobImageName(_ value: String) -> RangeSlider {
        settings.leftKnobImageName = value
        return self
    }
    
    public func leftKnobColor(_ value: Color) -> RangeSlider {
        settings.leftKnobColor = value
        return self
    }

    public func leftShadowOpacity(_ value: Float) -> RangeSlider {
        settings.leftShadowOpacity = value
        return self
    }

    public func leftShadowColor(_ value: Color) -> RangeSlider {
        settings.leftShadowColor = value
        return self
    }

    public func leftShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.leftShadowOffset = value
        return self
    }

    public func leftShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.leftShadowRadius = value
        return self
    }

    public func leftKnobGradientColor1(_ value: Color) -> RangeSlider {
        settings.leftKnobGradientColor1 = value
        return self
    }

    public func leftKnobGradientColor2(_ value: Color) -> RangeSlider {
        settings.leftKnobGradientColor2 = value
        return self
    }

    public func leftKnobGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.leftKnobGradientStartPoint = value
        return self
    }

    public func leftKnobGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.leftKnobGradientEndPoint = value
        return self
    }
    
    public func leftKnobBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.leftKnobBorderWidth = value
        return self
    }
    
    public func leftKnobBorderColor(_ value: Color) -> RangeSlider {
        settings.leftKnobBorderColor = value
        return self
    }

    public func rightKnobWidth(_ value: CGFloat) -> RangeSlider {
        settings.rightKnobWidth = value
        return self
    }

    public func rightKnobHeight(_ value: CGFloat) -> RangeSlider {
        settings.rightKnobHeight = value
        return self
    }

    public func rightKnobCorners(_ value: CGFloat) -> RangeSlider {
        settings.rightKnobCorners = value
        return self
    }
    
    public func rightKnobImageName(_ value: String) -> RangeSlider {
        settings.rightKnobImageName = value
        return self
    }
    
    public func rightKnobColor(_ value: Color) -> RangeSlider {
        settings.rightKnobColor = value
        return self
    }

    public func rightShadowOpacity(_ value: Float) -> RangeSlider {
        settings.rightShadowOpacity = value
        return self
    }

    public func rightShadowColor(_ value: Color) -> RangeSlider {
        settings.rightShadowColor = value
        return self
    }

    public func rightShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.rightShadowOffset = value
        return self
    }

    public func rightShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.rightShadowRadius = value
        return self
    }

    public func rightKnobGradientColor1(_ value: Color) -> RangeSlider {
        settings.rightKnobGradientColor1 = value
        return self
    }

    public func rightKnobGradientColor2(_ value: Color) -> RangeSlider {
        settings.rightKnobGradientColor2 = value
        return self
    }

    public func rightKnobGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.rightKnobGradientStartPoint = value
        return self
    }

    public func rightKnobGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.rightKnobGradientEndPoint = value
        return self
    }
    
    public func rightKnobBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.rightKnobBorderWidth = value
        return self
    }
    
    public func rightKnobBorderColor(_ value: Color) -> RangeSlider {
        settings.rightKnobBorderColor = value
        return self
    }

    public func barHeight(_ value: CGFloat) -> RangeSlider {
        settings.barHeight = value
        return self
    }
    
    public func barLeading(_ value: CGFloat) -> RangeSlider {
        settings.barLeading = value
        return self
    }
    
    public func barTrailing(_ value: CGFloat) -> RangeSlider {
        settings.barTrailing = value
        return self
    }

    public func barCorners(_ value: CGFloat) -> RangeSlider {
        settings.barCorners = value
        return self
    }

    public func barShadowOpacity(_ value: Float) -> RangeSlider {
        settings.barShadowOpacity = value
        return self
    }

    public func barShadowColor(_ value: Color) -> RangeSlider {
        settings.barShadowColor = value
        return self
    }
    
    public func barShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.barShadowOffset = value
        return self
    }

    public func barShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.barShadowRadius = value
        return self
    }
    
    public func barBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.barBorderWidth = value
        return self
    }

    public func barBorderColor(_ value: Color) -> RangeSlider {
        settings.barBorderColor = value
        return self
    }

    public func containerCorners(_ value: CGFloat) -> RangeSlider {
        settings.containerCorners = value
        return self
    }
}
