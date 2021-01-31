//
//  ConstraintAttributes.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 30/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class ConstraintAttributes {
    let target: NSLayoutConstraint.Attribute
    let relatedView: NSLayoutConstraint.Attribute

    init(target: NSLayoutConstraint.Attribute, related: NSLayoutConstraint.Attribute) {
        self.target = target
        self.relatedView = related
    }
}
