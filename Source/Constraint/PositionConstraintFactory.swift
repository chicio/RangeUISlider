//
//  PositionConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class PositionConstraintFactory {
    static func centerX(views: ConstraintViews) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .centerX, related: .centerX),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: 0.0
            )
        )
    }

    static func centerXTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews
    ) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .centerX, related: attribute),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: 0.0
            )
        )
    }

    static func centerY(views: ConstraintViews) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .centerY, related: .centerY),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: 0.0
            )
        )
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
