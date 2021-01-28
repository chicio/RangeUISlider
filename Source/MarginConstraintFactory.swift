//
//  MarginConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 28/01/21.
//  Copyright © 2021 Fabrizio Duroni. All rights reserved.
//

import Foundation
import CoreGraphics



class MarginConstraintFactory {
    static func make(
        target: Any,
        parent: Any?,
        margin: NSLayoutConstraint.Attribute,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: target,
                                  attribute: margin,
                                  relatedBy: .equal,
                                  toItem: parent,
                                  attribute: margin,
                                  multiplier: 1.0,
                                  constant: value)
    }
}
