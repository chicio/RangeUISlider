//
//  CenterConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  2021 Fabrizio Duroni. All rights reserved.
//

import UIKit

class CenterConstraintFactory {
    static func centerX(target: Any, parent: Any?) -> NSLayoutConstraint {
        return CenterConstraintFactory.center(target: target, parent: parent, centerDirection: .centerX)
    }

    static func centerY(target: Any, parent: Any?) -> NSLayoutConstraint {
        return CenterConstraintFactory.center(target: target, parent: parent, centerDirection: .centerY)
    }

    private static func center(
        target: Any,
        parent: Any?,
        centerDirection: NSLayoutConstraint.Attribute
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: target,
                                  attribute: centerDirection,
                                  relatedBy: .equal,
                                  toItem: parent,
                                  attribute: centerDirection,
                                  multiplier: 1.0,
                                  constant: 0.0)
    }
}
