//
//  GestureData.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 03/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

struct GestureData {
    unowned let gestureRecognizer: UIPanGestureRecognizer
    let scale: Scale
    let stepIncrement: CGFloat
    let semanticContentAttribute: UISemanticContentAttribute
}
