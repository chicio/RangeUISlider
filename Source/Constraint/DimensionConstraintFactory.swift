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
        return ConstraintFactory.make(
            views: ConstraintViews(target: target),
            attributes: ConstraintAttributes(target: .height, related: .notAnAttribute),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }

    static func equalHeight(views: ConstraintViews) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .height, related: .height),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: 0.0
            )
        )
    }

    static func width(target: UIView, value: CGFloat) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: ConstraintViews(target: target),
            attributes: ConstraintAttributes(target: .width, related: .notAnAttribute),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: value
            )
        )
    }
    
    static func equalWidth(views: ConstraintViews) -> NSLayoutConstraint {
        return ConstraintFactory.make(
            views: views,
            attributes: ConstraintAttributes(target: .width, related: .width),
            additionalInformation: ConstraintAdditionalInformations(
                relation: .equal,
                multiplier: 1.0,
                constant: 0.0
            )
        )
    }
}
