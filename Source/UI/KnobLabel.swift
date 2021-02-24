//
//  KnobLabel.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 24/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class KnobLabel {
    let label: UILabel
    private var constraints: [String: NSLayoutConstraint]

    init() {
        self.label = UILabel()
        self.constraints = [:]
        self.label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 1
    }

    func calculateConstraintUsing(knob: Knob) -> [NSLayoutConstraint] {
        let views = ConstraintViews(target: label, related: knob)
        constraints = [
            "xLabelPositionConstraint": PositionConstraintFactory.centerX(views: views),
            "bottomConstraint": MarginConstraintFactory.bottomTo(attribute: .top, views: views, value: 0)
        ]
        return getConstrains()
    }

    func getConstrains() -> [NSLayoutConstraint] {
        return constraints.map { $1 }
    }

    func setXPositionConstraint(_ value: CGFloat) {
        constraints["xLabelPositionConstraint"]?.constant = value
    }

    func setAccessibilityIdentifier(accessibilityIdentifier: String?) {
        label.isAccessibilityElement = true
        label.isUserInteractionEnabled = true
        label.accessibilityIdentifier = "\(accessibilityIdentifier ?? "")Label"
    }
}
