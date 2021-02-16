//
//  ConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  Copyright © 2021 Fabrizio Duroni.
//

import UIKit

class ConstraintFactory {
    static func make(
        views: ConstraintViews,
        attributes: ConstraintAttributes,
        additionalInformation: ConstraintAdditionalInformations
    ) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: views.target,
                                  attribute: attributes.target,
                                  relatedBy: additionalInformation.relation,
                                  toItem: views.relatedView,
                                  attribute: attributes.relatedView,
                                  multiplier: additionalInformation.multiplier,
                                  constant: additionalInformation.constant)
    }
}
