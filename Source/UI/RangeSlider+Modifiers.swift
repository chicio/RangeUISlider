//
//  RangeSlider+Modifiers.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  2021 Fabrizio Duroni.
//

// swiftlint:disable file_length

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, *)
extension RangeSlider {
    /**
     Set step increment value. If different from 0 RangeUISlider will let the user drag by step increment.
     
     - parameter value: the value to be used as step increment.
     */
    public func stepIncrement(_ value: CGFloat) -> RangeSlider {
        settings.values["stepIncrement"] = value
        return self
    }

    /**
    Show or hide knobs labels.
     
     - parameter value: the value used to decided if labels should be show or not.
     */
    public func showKnobsLabels(_ value: Bool) -> RangeSlider {
        settings.values["showKnobsLabels"] = value
        return self
    }

    /**
    Show labels at the top or at the bottom of knobs.
     
     - parameter value: the value used to decided if labels should be show top or bottom.
     */
    public func knobsLabelTopPosition(_ value: Bool) -> RangeSlider {
        settings.values["knobsLabelTopPosition"] = value
        return self
    }

    /**
     Set default left knob starting value.
     
     - parameter value: the value to be used as default left knob start.
     */
    public func defaultValueLeftKnob(_ value: CGFloat) -> RangeSlider {
        settings.values["defaultValueLeftKnob"] = value
        return self
    }

    /**
     Set default right knob starting value.
     
     - parameter value: the value to be used as default right knob start.
     */
    public func defaultValueRightKnob(_ value: CGFloat) -> RangeSlider {
        settings.values["defaultValueRightKnob"] = value
        return self
    }

    /**
     Set scale minimum value.
     
     - parameter value: the value to be used as scale minimum value.
     */
    public func scaleMinValue(_ value: CGFloat) -> RangeSlider {
        settings.values["scaleMinValue"] = value
        return self
    }

    /**
     Set scale maximum value.
     
     - parameter value: the value to be used as scale maximum value.
     */
    public func scaleMaxValue(_ value: CGFloat) -> RangeSlider {
        settings.values["scaleMaxValue"] = value
        return self
    }

    /**
     Set selected range color.
     
     - parameter value: the value to be used as selected range color.
     */
    public func rangeSelectedColor(_ value: Color) -> RangeSlider {
        settings.values["rangeSelectedColor"] = UIColor(value)
        return self
    }

    /**
     Set background range selected strechable image.
     The string will be used to search an image with that name in the current Bundle.
     
     - parameter value: the value to be used as background range selected strechable image.
     */
    public func rangeSelectedBackgroundImage(_ value: String) -> RangeSlider {
        settings.values["rangeSelectedBackgroundImage"] = UIImage(named: value)
        return self
    }

    /**
     Set background range selected top edge insect for background image.
     
     - parameter value: the value to be used as background range selected top edge insect for background image.
     */
    public func rangeSelectedBackgroundEdgeInsetTop(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetTop"] = value
        return self
    }

    /**
     Set background range selected left edge insect for background image.
     
     - parameter value: the value to be used as background range selected left edge insect for background image.
     */
    public func rangeSelectedBackgroundEdgeInsetLeft(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetLeft"] = value
        return self
    }

    /**
     Set background range selected bottom edge insect for background image.
     
     - parameter value: the value to be used as background range selected bottom edge insect for background image.
     */
    public func rangeSelectedBackgroundEdgeInsetBottom(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetBottom"] = value
        return self
    }

    /**
     Set background range selected right edge insect for background image.
     
     - parameter value: the value to be used as background range selected right edge insect for background image.
     */
    public func rangeSelectedBackgroundEdgeInsetRight(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeSelectedBackgroundEdgeInsetRight"] = value
        return self
    }

    /**
     Set  gradient color 1 for range selected. The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as gradient color 1 for range selected.
     */
    public func rangeSelectedGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["rangeSelectedGradientColor1"] = UIColor(value)
        return self
    }

    /**
     Set  gradient color 2 for range selected. The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used asgradient color 2 for range selected.
     */
    public func rangeSelectedGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["rangeSelectedGradientColor2"] = UIColor(value)
        return self
    }

    /**
     Set gradient start point for selected range.
     
     - parameter value: the value to be used as gradient start point for selected range.
     */
    public func rangeSelectedGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeSelectedGradientStartPoint"] = value
        return self
    }

    /**
     Set gradient end point for selected range.
     
     - parameter value: the value to be used as gradient end point for selected range.
     */
    public func rangeSelectedGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeSelectedGradientEndPoint"] = value
        return self
    }

    /**
     Set not selected range color.
     
     - parameter value: the value to be used as not selected range color.
     */
    public func rangeNotSelectedColor(_ value: Color) -> RangeSlider {
        settings.values["rangeNotSelectedColor"] = UIColor(value)
        return self
    }

    /**
     Set background range not selected strechable image.
     The string will be used to search an image with that name in the current Bundle.
     
     - parameter value: the value to be used as background range not selected strechable image.
     */
    public func rangeNotSelectedBackgroundImage(_ value: String) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundImage"] = UIImage(named: value)
        return self
    }

    /**
     Set background range not selected top edge insect for background image.
     
     - parameter value: the value to be used as background range not selected top edge insect for background image.
     */
    public func rangeNotSelectedBackgroundEdgeInsetTop(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetTop"] = value
        return self
    }

    /**
     Set background range not selected left edge insect for background image.
     
     - parameter value: the value to be used as background range not selected left edge insect for background image.
     */
    public func rangeNotSelectedBackgroundEdgeInsetLeft(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetLeft"] = value
        return self
    }

    /**
     Set background range not selected bottom edge insect for background image.
     
     - parameter value: the value to be used as background range not selected bottom edge insect for background image.
     */
    public func rangeNotSelectedBackgroundEdgeInsetBottom(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetBottom"] = value
        return self
    }

    /**
     Set background range not selected right edge insect for background image.
     
     - parameter value: the value to be used as background range not selected right edge insect for background image.
     */
    public func rangeNotSelectedBackgroundEdgeInsetRight(_ value: CGFloat) -> RangeSlider {
        settings.values["rangeNotSelectedBackgroundEdgeInsetRight"] = value
        return self
    }

    /**
     Set  gradient color 1 for range not selected. The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as gradient color 1 for range not selected.
     */
    public func rangeNotSelectedGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["rangeNotSelectedGradientColor1"] = UIColor(value)
        return self
    }

    /**
     Set  gradient color 2 for range not selected. The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as gradient color 2 for range not selected.
     */

    public func rangeNotSelectedGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["rangeNotSelectedGradientColor2"] = UIColor(value)
        return self
    }

    /**
     Set gradient start point for not selected range.
     
     - parameter value: the value to be used as gradient start point for not selected range.
     */
    public func rangeNotSelectedGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeNotSelectedGradientStartPoint"] = value
        return self
    }

    /**
     Set gradient end point for not selected range.
     
     - parameter value: the value to be used as gradient end point for not selected range.
     */
    public func rangeNotSelectedGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rangeNotSelectedGradientEndPoint"] = value
        return self
    }

    /**
     Set left knob width.
     
     - parameter value: the value to be used as left knob width.
     */
    public func leftKnobWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobWidth"] = value
        return self
    }

    /**
     Set left knob height.
     
     - parameter value: the value to be used as left knob height.
     */
    public func leftKnobHeight(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobHeight"] = value
        return self
    }

    /**
     Set left knob corners.
     
     - parameter value: the value to be used as left knob corners.
     */
    public func leftKnobCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobCorners"] = value
        return self
    }

    /**
     Set left knob image. The string will be used to search an image with that name in the current Bundle.
     
     - parameter value: the value to be used as left knob image.
     */
    public func leftKnobImage(_ value: String) -> RangeSlider {
        settings.values["leftKnobImage"] = UIImage(named: value)
        return self
    }

    /**
     Set left knob color.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as left knob color.
     */
    public func leftKnobColor(_ value: Color) -> RangeSlider {
        settings.values["leftKnobColor"] = UIColor(value)
        return self
    }

    /**
     Set left shadow opacity.
     
     - parameter value: the value to be used as left shadow opacity.
     */
    public func leftShadowOpacity(_ value: Float) -> RangeSlider {
        settings.values["leftShadowOpacity"] = value
        return self
    }

    /**
     Set left shadow image.
     
     - parameter value: the value to be used as left shadow image.
     */
    public func leftShadowColor(_ value: Color) -> RangeSlider {
        settings.values["leftShadowColor"] = UIColor(value)
        return self
    }

    /**
     Set left shadow offset.
     
     - parameter value: the value to be used as left shadow offset.
     */
    public func leftShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.values["leftShadowOffset"] = value
        return self
    }

    /**
     Set left shadow radius.
     
     - parameter value: the value to be used as left shadow radius.
     */
    public func leftShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.values["leftShadowRadius"] = value
        return self
    }

    /**
     Set left knob gradient color 1.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as left knob gradient color 1.
     */
    public func leftKnobGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["leftKnobGradientColor1"] = UIColor(value)
        return self
    }

    /**
     Set left knob gradient color 2.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as left knob gradient color 2.
     */
    public func leftKnobGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["leftKnobGradientColor2"] = UIColor(value)
        return self
    }

    /**
     Set left knob gradient start point.
     
     - parameter value: the value to be used as left shadow radius.
     */
    public func leftKnobGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["leftKnobGradientStartPoint"] = value
        return self
    }

    /**
     Set left knob gradient end point.
     
     - parameter value: the value to be used as left knob gradient end point.
     */
    public func leftKnobGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["leftKnobGradientEndPoint"] = value
        return self
    }

    /**
     Set left knob border width.
     
     - parameter value: the value to be used as left knob border width.
     */
    public func leftKnobBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["leftKnobBorderWidth"] = value
        return self
    }

    /**
     Set left knob border color.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as left knob border color.
     */
    public func leftKnobBorderColor(_ value: Color) -> RangeSlider {
        settings.values["leftKnobBorderColor"] = UIColor(value)
        return self
    }

    /**
     Set right knob width.
     
     - parameter value: the value to be used as right knob width.
     */
    public func rightKnobWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobWidth"] = value
        return self
    }

    /**
     Set right knob height.
     
     - parameter value: the value to be used as right knob height.
     */
    public func rightKnobHeight(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobHeight"] = value
        return self
    }

    /**
     Set right knob corners.
     
     - parameter value: the value to be used as right knob corners.
     */
    public func rightKnobCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobCorners"] = value
        return self
    }

    /**
     Set right knob image. The string will be used to search an image with that name in the current Bundle.
     
     - parameter value: the value to be used as right knob image.
     */
    public func rightKnobImage(_ value: String) -> RangeSlider {
        settings.values["rightKnobImage"] = UIImage(named: value)
        return self
    }

    /**
     Set right knob color.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as right knob color.
     */
    public func rightKnobColor(_ value: Color) -> RangeSlider {
        settings.values["rightKnobColor"] = UIColor(value)
        return self
    }

    /**
     Set right shadow opacity.
     
     - parameter value: the value to be used as right shadow opacity.
     */
    public func rightShadowOpacity(_ value: Float) -> RangeSlider {
        settings.values["rightShadowOpacity"] = value
        return self
    }

    /**
     Set right shadow image.
     
     - parameter value: the value to be used as right shadow image.
     */
    public func rightShadowColor(_ value: Color) -> RangeSlider {
        settings.values["rightShadowColor"] = UIColor(value)
        return self
    }

    /**
     Set right shadow offset.
     
     - parameter value: the value to be used as right shadow offset.
     */
    public func rightShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.values["leftShadowOffset"] = value
        return self
    }

    /**
     Set left shadow radius.
     
     - parameter value: the value to be used as left shadow radius.
     */
    public func rightShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.values["rightShadowRadius"] = value
        return self
    }

    /**
     Set right knob gradient color 1.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as right knob gradient color 1.
     */
    public func rightKnobGradientColor1(_ value: Color) -> RangeSlider {
        settings.values["rightKnobGradientColor1"] = UIColor(value)
        return self
    }

    /**
     Set right knob gradient color 2.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as right knob gradient color 2.
     */
    public func rightKnobGradientColor2(_ value: Color) -> RangeSlider {
        settings.values["rightKnobGradientColor2"] = UIColor(value)
        return self
    }

    /**
     Set right knob gradient start point.
     
     - parameter value: the value to be used as right shadow radius.
     */
    public func rightKnobGradientStartPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rightKnobGradientStartPoint"] = value
        return self
    }

    /**
     Set right knob gradient end point.
     
     - parameter value: the value to be used as right knob gradient end point.
     */
    public func rightKnobGradientEndPoint(_ value: CGPoint) -> RangeSlider {
        settings.values["rightKnobGradientEndPoint"] = value
        return self
    }

    /**
     Set right knob border width.
     
     - parameter value: the value to be used as right knob border width.
     */
    public func rightKnobBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["rightKnobBorderWidth"] = value
        return self
    }

    /**
     Set right knob border color.  The value received is converted to a `UIColor`.
     
     - parameter value: the value to be used as right knob border color.
     */
    public func rightKnobBorderColor(_ value: Color) -> RangeSlider {
        settings.values["rightKnobBorderColor"] = UIColor(value)
        return self
    }

    /**
     Set knobs labels font size.
     
     - parameter value: the value to be used as font size for the knobs labels.
     */
    public func knobsLabelFontSize(_ value: CGFloat) -> RangeSlider {
        settings.values["knobsLabelFontSize"] = value
        return self
    }

    /**
     Set knobs labels color.
     
     - parameter value: the value to be used asknobs labels color.
     */
    public func knobsLabelFontColor(_ value: Color) -> RangeSlider {
        settings.values["knobsLabelFontColor"] = UIColor(value)
        return self
    }

    /**
     Set knobs labels number of decimal.
     
     - parameter value: the value to be used as number of decimal format for knobs labels.
     */
    public func knobsLabelNumberOfDecimal(_ value: Int) -> RangeSlider {
        settings.values["knobsLabelNumberOfDecimal"] = value
        return self
    }

    /**
     Set bar height.
     
     - parameter value: the value to be used as bar height.
     */
    public func barHeight(_ value: CGFloat) -> RangeSlider {
        settings.values["barHeight"] = value
        return self
    }

    /**
     Set bar width.
     
     - parameter value: the value to be used as bar width.
     */
    public func barLeading(_ value: CGFloat) -> RangeSlider {
        settings.values["barLeading"] = value
        return self
    }

    /**
     Set bar trailing.
     
     - parameter value: the value to be used as bar trailing.
     */
    public func barTrailing(_ value: CGFloat) -> RangeSlider {
        settings.values["barTrailing"] = value
        return self
    }

    /**
     Set bar corners.
     
     - parameter value: the value to be used as bar corners.
     */
    public func barCorners(_ value: CGFloat) -> RangeSlider {
        settings.values["barCorners"] = value
        return self
    }

    /**
     Set bar shadow opacity.
     
     - parameter value: the value to be used as bar shadow opacity.
     */
    public func barShadowOpacity(_ value: Float) -> RangeSlider {
        settings.values["barShadowOpacity"] = value
        return self
    }

    /**
     Set bar shadow color.
     
     - parameter value: the value to be used as bar shadow color.
     */
    public func barShadowColor(_ value: Color) -> RangeSlider {
        settings.values["barShadowColor"] = value
        return self
    }

    /**
     Set bar shadow offset.
     
     - parameter value: the value to be used as bar shadow offset.
     */
    public func barShadowOffset(_ value: CGSize) -> RangeSlider {
        settings.values["barShadowOffset"] = value
        return self
    }

    /**
     Set bar shadow radius.
     
     - parameter value: the value to be used as bar shadow radius.
     */
    public func barShadowRadius(_ value: CGFloat) -> RangeSlider {
        settings.values["barShadowRadius"] = value
        return self
    }

    /**
     Set bar border width.
     
     - parameter value: the value to be used as bar border width.
     */
    public func barBorderWidth(_ value: CGFloat) -> RangeSlider {
        settings.values["barBorderWidth"] = value
        return self
    }

    /**
     Set bar border color.
     
     - parameter value: the value to be used as bar border color.
     */
    public func barBorderColor(_ value: Color) -> RangeSlider {
        settings.values["barBorderColor"] = value
        return self
    }
}
#endif
