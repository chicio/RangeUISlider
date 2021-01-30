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
            attributes: ContraintAttributes(target: .leading, relatedView: .leading),
            value: value
        )
    }

    static func leadingTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ContraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            attributes: ContraintAttributes(target: .leading, relatedView: attribute),
            value: value
        )
    }

    static func trailingTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ContraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            attributes: ContraintAttributes(target: .trailing, relatedView: attribute),
            value: value
        )
    }

    static func trailingConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            attributes: ContraintAttributes(target: .trailing, relatedView: .trailing),
            value: value
        )
    }

    static func topConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            attributes: ContraintAttributes(target: .top, relatedView: .top),
            value: value
        )
    }

    static func bottomConstraint(views: ContraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            views: views,
            attributes: ContraintAttributes(target: .bottom, relatedView: .bottom),
            value: value
        )
    }

    private static func make(
        views: ContraintViews,
        attributes: ContraintAttributes,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: views.target,
                                  attribute: attributes.target,
                                  relatedBy: .equal,
                                  toItem: views.relatedView,
                                  attribute: attributes.relatedView,
                                  multiplier: 1.0,
                                  constant: value)
    }
}
