//
//  MarginConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 28/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class MarginConstraintFactory {
    static func leading(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            attributes: ConstraintAttributes(target: .leading, related: .leading),
            views: views,
            value: value
        )
    }

    static func leadingTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            attributes: ConstraintAttributes(target: .leading, related: attribute),
            views: views,
            value: value
        )
    }

    static func trailing(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            attributes: ConstraintAttributes(target: .trailing, related: .trailing),
            views: views,
            value: value
        )
    }

    static func trailingTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            attributes: ConstraintAttributes(target: .trailing, related: attribute),
            views: views,
            value: value
        )
    }

    static func top(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            attributes: ConstraintAttributes(target: .top, related: .top),
            views: views,
            value: value
        )
    }

    static func bottom(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return MarginConstraintFactory.make(
            attributes: ConstraintAttributes(target: .bottom, related: .bottom),
            views: views,
            value: value
        )
    }

    private static func make(
        attributes: ConstraintAttributes,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: attributes,
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }
}
