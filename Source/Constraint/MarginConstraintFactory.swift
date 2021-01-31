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
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .leading, related: .leading),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }

    static func leadingTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .leading, related: attribute),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }

    static func trailing(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .trailing, related: .trailing),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }

    static func trailingTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .trailing, related: attribute),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }

    static func top(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .top, related: .top),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }

    static func bottom(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .bottom, related: .bottom),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }
}
