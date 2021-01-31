//
//  EqualRelationConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class EqualRelationConstraintFactory {
    static func make(
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
