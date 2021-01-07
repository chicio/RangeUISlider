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
    
    //MARK: lifecycle
    
    private func assignValueTo(rangeSlider: RangeUISlider, property: String) {
        if let value = settings.values[property] {
            rangeSlider.setValue(value, forKey: property)
        }
    }
    
    public func makeUIView(context: Context) -> RangeUISlider {
        let rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 20)))
        rangeSlider.delegate = context.coordinator
        assignValueTo(rangeSlider: rangeSlider, property: "stepIncrement")
        assignValueTo(rangeSlider: rangeSlider, property: "defaultValueLeftKnob")
        assignValueTo(rangeSlider: rangeSlider, property: "defaultValueRightKnob")
        assignValueTo(rangeSlider: rangeSlider, property: "scaleMinValue")
        assignValueTo(rangeSlider: rangeSlider, property: "scaleMaxValue")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedColor")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedBackgroundImage")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedBackgroundEdgeInsetTop")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedBackgroundEdgeInsetLeft")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedBackgroundEdgeInsetBottom")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedBackgroundEdgeInsetRight")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedGradientColor1")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedGradientColor2")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedGradientStartPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeSelectedGradientEndPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedColor")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedBackgroundImage")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedBackgroundEdgeInsetTop")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedBackgroundEdgeInsetLeft")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedBackgroundEdgeInsetBottom")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedBackgroundEdgeInsetRight")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedGradientColor1")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedGradientColor2")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedGradientStartPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "rangeNotSelectedGradientEndPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobWidth")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobHeight")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobCorners")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobImage")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobColor")
        assignValueTo(rangeSlider: rangeSlider, property: "leftShadowOpacity")
        assignValueTo(rangeSlider: rangeSlider, property: "leftShadowColor")
        assignValueTo(rangeSlider: rangeSlider, property: "leftShadowOffset")
        assignValueTo(rangeSlider: rangeSlider, property: "leftShadowRadius")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobGradientColor1")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobGradientColor2")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobGradientStartPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobGradientEndPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobBorderWidth")
        assignValueTo(rangeSlider: rangeSlider, property: "leftKnobBorderColor")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobWidth")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobHeight")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobCorners")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobImage")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobColor")
        assignValueTo(rangeSlider: rangeSlider, property: "rightShadowOpacity")
        assignValueTo(rangeSlider: rangeSlider, property: "rightShadowColor")
        assignValueTo(rangeSlider: rangeSlider, property: "rightShadowOffset")
        assignValueTo(rangeSlider: rangeSlider, property: "rightShadowRadius")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobGradientColor1")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobGradientColor2")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobGradientStartPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobGradientEndPoint")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobBorderWidth")
        assignValueTo(rangeSlider: rangeSlider, property: "rightKnobBorderColor")
        assignValueTo(rangeSlider: rangeSlider, property: "barHeight")
        assignValueTo(rangeSlider: rangeSlider, property: "barLeading")
        assignValueTo(rangeSlider: rangeSlider, property: "barTrailing")
        assignValueTo(rangeSlider: rangeSlider, property: "barCorners")
        assignValueTo(rangeSlider: rangeSlider, property: "barShadowOpacity")
        assignValueTo(rangeSlider: rangeSlider, property: "barShadowColor")
        assignValueTo(rangeSlider: rangeSlider, property: "barShadowOffset")
        assignValueTo(rangeSlider: rangeSlider, property: "barShadowRadius")
        assignValueTo(rangeSlider: rangeSlider, property: "barBorderWidth")
        assignValueTo(rangeSlider: rangeSlider, property: "barBorderColor")
        assignValueTo(rangeSlider: rangeSlider, property: "containerCorners")
        
        return rangeSlider
    }

    public func updateUIView(_ uiView: RangeUISlider, context: Context) { }
        
    public func makeCoordinator() -> RangeSliderCoordinator {
        return RangeSliderCoordinator(rangeSlider: self)
    }
    
    //MARK: modifiers
    
    public func stepIncrement(_ value: CGFloat) -> RangeSlider {
        settings.values["stepIncrement"] = value
        return self
    }
    
    public func defaultValueLeftKnob(_ value: CGFloat) -> RangeSlider {
        settings.values["defaultValueLeftKnob"] = value
        return self
    }
    
    public func defaultValueRightKnob(_ value: CGFloat) -> RangeSlider {
        settings.values["defaultValueRightKnob"] = value
        return self
    }
    
    public func scaleMinValue(_ value: CGFloat) -> RangeSlider {
        settings.values["scaleMinValue"] = value
        return self
    }
    
    public func scaleMaxValue(_ value: CGFloat) -> RangeSlider {
        settings.values["scaleMaxValue"] = value
        return self
    }
    
    public func rangeSelectedColor(_ value: Color) -> RangeSlider {
        settings.values["rangeSelectedColor"] = UIColor(value)
        return self
    }

    public func rangeSelectedBackgroundImage(_ value: String) -> RangeSlider {
        settings.values["rangeSelectedBackgroundImage"] = UIImage(named: value)
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetTop(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetTop"] = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetLeft(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetLeft"] = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetBottom(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetBottom"] = value
        return self
    }

    public func rangeSelectedBackgroundEdgeInsetRight(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetRight"] = value
        return self
    }
    
    public func rangeSelectedGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["rangeSelectedGradientColor1"] = UIColor(value)
        return self
    }
    
    public func rangeSelectedGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["rangeSelectedGradientColor2"] = UIColor(value)
        return self
    }

    public func rangeSelectedGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeSelectedGradientStartPoint"] = value
        return self
    }

    public func rangeSelectedGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeSelectedGradientEndPoint"] = value
        return self
    }

    public func rangeNotSelectedColor(_ value: Color) -> RangeSlider {
        settings.values["rangeNotSelectedColor"] = UIColor(value)
        return self
    }

    public func rangeNotSelectedBackgroundImage(_ value: String) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundImage"] = UIImage(named: value)
        return self
    }

    public func rangeNotSelectedBackgroundEdgeInsetTop(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetTop"] = value
        return self
    }

    public func rangeNotSelectedBackgroundEdgeInsetLeft(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetLeft"] = value
        return self
    }
    
    public func rangeNotSelectedBackgroundEdgeInsetBottom(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetBottom"] = value
        return self
    }
    
    public func rangeNotSelectedBackgroundEdgeInsetRight(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetRight"] = value
        return self
    }
    
    public func rangeNotSelectedGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["rangeNotSelectedGradientColor1"] = UIColor(value)
        return self
    }

    public func rangeNotSelectedGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["rangeNotSelectedGradientColor2"] = UIColor(value)
        return self
    }

    public func rangeNotSelectedGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeNotSelectedGradientStartPoint"] = value
        return self
    }

    public func rangeNotSelectedGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeNotSelectedGradientEndPoint"] = value
        return self
    }

    public func leftKnobWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobWidth"] = value
        return self
    }

    public func leftKnobHeight(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobHeight"] = value
        return self
    }
    
    public func leftKnobCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobCorners"] = value
        return self
    }

    public func leftKnobImage(_ value: String) -> RangeSlider {
        settings.values["leftKnobImage"] = UIImage(named: value)
        return self
    }
    
    public func leftKnobColor(_ value: Color) -> RangeSlider {
        settings.values["leftKnobColor"] = UIColor(value)
        return self
    }

    public func leftShadowOpacity(_ value: Float) -> RangeSlider {
        settings.values["leftShadowOpacity"] = value
        return self
    }

    public func leftShadowColor(_ value: Color) -> RangeSlider {
        settings.values["leftShadowColor"] = UIColor(value)
        return self
    }

    public func leftShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.values["leftShadowOffset"] = value
        return self
    }

    public func leftShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.values["leftShadowRadius"] = value
        return self
    }

    public func leftKnobGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["leftKnobGradientColor1"] = UIColor(value)
        return self
    }

    public func leftKnobGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["leftKnobGradientColor2"] = UIColor(value)
        return self
    }

    public func leftKnobGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["leftKnobGradientStartPoint"] = value
        return self
    }

    public func leftKnobGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["leftKnobGradientEndPoint"] = value
        return self
    }
    
    public func leftKnobBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobBorderWidth"] = value
        return self
    }
    
    public func leftKnobBorderColor(_ value: Color) -> RangeSlider {
        settings.values["leftKnobBorderColor"] = UIColor(value)
        return self
    }

    public func rightKnobWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobWidth"] = value
        return self
    }

    public func rightKnobHeight(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobHeight"] = value
        return self
    }
    
    public func rightKnobCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobCorners"] = value
        return self
    }

    public func rightKnobImage(_ value: String) -> RangeSlider {
        settings.values["rightKnobImage"] = UIImage(named: value)
        return self
    }
    
    public func rightKnobColor(_ value: Color) -> RangeSlider {
        settings.values["rightKnobColor"] = UIColor(value)
        return self
    }

    public func rightShadowOpacity(_ value: Float) -> RangeSlider {
        settings.values["rightShadowOpacity"] = value
        return self
    }

    public func rightShadowColor(_ value: Color) -> RangeSlider {
        settings.values["rightShadowColor"] = UIColor(value)
        return self
    }

    public func rightShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.values["rightShadowOffset"] = value
        return self
    }

    public func rightShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.values["rightShadowRadius"] = value
        return self
    }

    public func rightKnobGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["rightKnobGradientColor1"] = UIColor(value)
        return self
    }

    public func rightKnobGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["rightKnobGradientColor2"] = UIColor(value)
        return self
    }

    public func rightKnobGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rightKnobGradientStartPoint"] = value
        return self
    }

    public func rightKnobGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rightKnobGradientEndPoint"] = value
        return self
    }
    
    public func rightKnobBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobBorderWidth"] = value
        return self
    }
    
    public func rightKnobBorderColor(_ value: Color) -> RangeSlider {
        settings.values["rightKnobBorderColor"] = UIColor(value)
        return self
    }
    
    public func barHeight(_ value: CGFloat) -> RangeSlider {
        settings.values["barHeight"] = value
        return self
    }
    
    public func barLeading(_ value: CGFloat) -> RangeSlider {
        settings.values["barLeading"] = value
        return self
    }
    
    public func barTrailing(_ value: CGFloat) -> RangeSlider {
        settings.values["barTrailing"] = value
        return self
    }

    public func barCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["barCorners"] = value
        return self
    }

    public func barShadowOpacity(_ value: Float) -> RangeSlider {
        settings.values["barShadowOpacity"] = value
        return self
    }

    public func barShadowColor(_ value: Color) -> RangeSlider {
        settings.values["barShadowColor"] = value
        return self
    }
    
    public func barShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.values["barShadowOffset"] = value
        return self
    }

    public func barShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.values["barShadowRadius"] = value
        return self
    }
    
    public func barBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["barBorderWidth"] = value
        return self
    }

    public func barBorderColor(_ value: Color) -> RangeSlider {
        settings.values["barBorderColor"] = value
        return self
    }

    public func containerCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["containerCorners"] = value
        return self
    }
}
