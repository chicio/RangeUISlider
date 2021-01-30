//
//  ConstraintAttributes.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 30/01/21.
//  2021 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ContraintAttributes {
    let target: NSLayoutConstraint.Attribute
    let relatedView: NSLayoutConstraint.Attribute

    init(target: NSLayoutConstraint.Attribute, relatedView: NSLayoutConstraint.Attribute) {
        self.target = target
        self.relatedView = relatedView
    }
}
