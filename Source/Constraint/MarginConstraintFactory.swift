//
//  MarginConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 28/01/21.
//  2021 Fabrizio Duroni. All rights reserved.
//

import UIKit

class MarginConstraintFactory {
    static func leadingConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            margin: .leading,
            value: value
        )
    }

    static func trailingConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            margin: .trailing,
            value: value
        )
    }

    static func topConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            margin: .top,
            value: value
        )
    }

    static func bottomConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
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
