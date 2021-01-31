//
//  ConstraintAdditionalInformations.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class ConstraintAdditionalInformations {
    let relation: NSLayoutConstraint.Relation
    let multiplier: CGFloat
    let constant: CGFloat

    init(relation: NSLayoutConstraint.Relation, multiplier: CGFloat, constant: CGFloat) {
        self.relation = relation
        self.multiplier = multiplier
        self.constant = constant
    }
}
