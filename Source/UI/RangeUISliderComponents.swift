//
//  RangeUISliderComponents.swift
//  RangeUISliderUITests
//
//  Created by Fabrizio Duroni on 16/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class RangeUISliderComponents {
    let bar: Bar = Bar()
    let knobs: Knobs = Knobs(leftKnob: Knob(), rightKnob: Knob())
    let progressViews: ProgressViews = ProgressViews(
        selectedProgressView: Progress(),
        leftProgressView: Progress(),
        rightProgressView: Progress()
    )
}
