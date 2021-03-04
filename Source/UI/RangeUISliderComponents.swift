//
//  RangeUISliderComponents.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 16/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

/**
 A class that contains all the UI components of `RangeUISlider`. You can access to all the UI parts:
 knos, bar and progress view. See `components` property of `RangeUISlider`.
 */
public class RangeUISliderComponents {
    /// The bar UI component. See `Bar` class.
    public let bar: Bar = Bar()
    /// The knobs UI component. See `Knobs` class.
    public let knobs: Knobs = Knobs(leftKnob: Knob(), rightKnob: Knob())
    /// The progress views UI components.
    public let progressViews: ProgressViews = ProgressViews(
        selectedProgressView: Progress(),
        leftProgressView: Progress(),
        rightProgressView: Progress()
    )
}
