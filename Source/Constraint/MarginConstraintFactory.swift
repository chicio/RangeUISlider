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
        return EqualRelationConstraintFactory.make(
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
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .leading, related: attribute),
            views: views,
            value: value
        )
    }

    static func trailing(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
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
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .trailing, related: attribute),
            views: views,
            value: value
        )
    }

    static func top(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .top, related: .top),
            views: views,
            value: value
        )
    }

    static func topTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .top, related: attribute),
            views: views,
            value: value
        )
    }

    static func bottom(views: ConstraintViews, value: CGFloat) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .bottom, related: .bottom),
            views: views,
            value: value
        )
    }

    static func bottomTo(
        attribute: NSLayoutConstraint.Attribute,
        views: ConstraintViews,
        value: CGFloat
    ) -> NSLayoutConstraint {
        return EqualRelationConstraintFactory.make(
            attributes: ConstraintAttributes(target: .bottom, related: attribute),
            views: views,
            value: value
        )
    }
}
