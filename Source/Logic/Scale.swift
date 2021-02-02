//
//  Scale.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 02/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

struct Scale {
    let scaleMinValue: CGFloat
    let scaleMaxValue: CGFloat
    let scale: CGFloat

    init(scaleMinValue: CGFloat, scaleMaxValue: CGFloat) {
        self.scaleMinValue = scaleMinValue
        self.scaleMaxValue = scaleMaxValue
        self.scale = scaleMaxValue - scaleMinValue
    }
}
