//
//  ContraintViews.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class ConstraintViews {
    unowned let target: UIView
    unowned let relatedView: UIView?

    init(target: UIView, related: UIView? = nil) {
        self.target = target
        self.relatedView = related
    }
}
