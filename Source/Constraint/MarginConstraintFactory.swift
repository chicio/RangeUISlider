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
    static func leadingConstraint(target: UIView, parent: UIView?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: ContraintViews(target: target, parent: parent),
            margin: .leading,
            value: value
        )
    }

    static func trailingConstraint(target: UIView, parent: UIView?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: ContraintViews(target: target, parent: parent),
            margin: .trailing,
            value: value
        )
    }

    static func topConstraint(target: UIView, parent: UIView?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: ContraintViews(target: target, parent: parent),
            margin: .top,
            value: value
        )
    }

    static func bottomConstraint(target: UIView, parent: UIView?, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: ContraintViews(target: target, parent: parent),
            margin: .bottom,
            value: value
        )
    }

    private static func make(
        views: ContraintViews,
        margin: NSLayoutConstraint.Attribute,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: views.target,
                                  attribute: margin,
                                  relatedBy: .equal,
                                  toItem: views.parent,
                                  attribute: margin,
                                  multiplier: 1.0,
                                  constant: value)
    }
}
