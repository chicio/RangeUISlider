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
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .centerX, related: .centerX),
            views: views,
            value: 0.0
        )
    }

    static func centerXTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews
    ) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .centerX, related: attribute),
            views: views,
            value: 0.0
        )
    }

    static func centerY(views: ConstraintViews, value: CGFloat = 0.0) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .centerY, related: .centerY),
            views: views,
            value: value
        )
    }
}
