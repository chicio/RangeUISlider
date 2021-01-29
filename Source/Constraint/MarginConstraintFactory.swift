//
//  MarginConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 28/01/21.
//  2021 Fabrizio Duroni. All rights reserved.
//

import Foundation
import UIKit

class MarginConstraintFactory {
    static func leadingConstraint(target: Any, parent: Any?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            target: target,
            parent: parent,
            margin: .leading,
            value: value
        )
    }

    static func trailingConstraint(target: Any, parent: Any?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            target: target,
            parent: parent,
            margin: .trailing,
            value: value
        )
    }

    static func topConstraint(target: Any, parent: Any?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            target: target,
            parent: parent,
            margin: .top,
            value: value
        )
    }

    static func bottomConstraint(target: Any, parent: Any?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            target: target,
            parent: parent,
            margin: .bottom,
            value: value
        )
    }

    private static func make(
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
