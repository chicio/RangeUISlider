//
//  ProgressViewsPropertiesFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 01/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class ProgressViewsPropertiesFactory {
    static func make(rangeSelectedColor: UIColor, rangeNotSelectedColor: UIColor) -> ProgressViewsProperties {
        return ProgressViewsProperties(
            selectedProgressViewProperties: ProgressProperties(
                leftAnchorConstraintAttribute: .centerX,
                rightAnchorConstraintAttribute: .centerX,
                color: rangeSelectedColor
            ),
            leftProgressViewProperties: ProgressProperties(
                leftAnchorConstraintAttribute: .leading,
                rightAnchorConstraintAttribute: .centerX,
                color: rangeNotSelectedColor
            ),
            rightProgressViewProperties: ProgressProperties(
                leftAnchorConstraintAttribute: .centerX,
                rightAnchorConstraintAttribute: .trailing,
                color: rangeNotSelectedColor
            )
        )
    }
}
