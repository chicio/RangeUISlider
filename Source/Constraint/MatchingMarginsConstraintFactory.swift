//
//  MatchingMarginsConstraintFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 31/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class MatchingMarginConstraintFactory {
    static func make(views: ConstraintViews) -> [NSLayoutConstraint] {
        return [
            MarginConstraintFactory.leading(views: views, value: 0.0),
            MarginConstraintFactory.trailing(views: views, value: 0.0),
            MarginConstraintFactory.top(views: views, value: 0.0),
            MarginConstraintFactory.bottom(views: views, value: 0.0)
        ]
    }
}
