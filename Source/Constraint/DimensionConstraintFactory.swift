//
//  DimensionConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  2021 Fabrizio Duroni. All rights reserved.
//

import UIKit

class DimensionConstraintFactory {
    static func heightConstraint(target: Any, value: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: target,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1.0,
                                  constant: value)
    }

    static func equalHeightConstraint(target: Any, parent: Any?) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: target,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: parent,
                                  attribute: .height,
                                  multiplier: 1.0,
                                  constant: 0.0)
    }
}
