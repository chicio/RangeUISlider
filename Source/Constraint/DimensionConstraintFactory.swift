//
//  DimensionConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class DimensionConstraintFactory {
    static func height(target: UIView, value: CGFloat) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .height, related: .notAnAttribute),
            views: ConstraintViews(target: target),
            value: value
        )
    }

    static func equalHeight(views: ConstraintViews) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .height, related: .height),
            views: views,
            value: 0.0
        )
    }

    static func width(target: UIView, value: CGFloat) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .width, related: .notAnAttribute),
            views: ConstraintViews(target: target),
            value: value
        )
    }

    static func equalWidth(views: ConstraintViews) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .width, related: .width),
            views: views,
            value: 0.0
        )
    }
}
