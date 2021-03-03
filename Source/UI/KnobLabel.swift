//
//  KnobLabel.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 24/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

/**
  The KnobLabel class. it contains the knob label.
 */
public class KnobLabel {
    /// The knob label `UILabel` component.
    let label: UILabel
    private var constraints: [String: NSLayoutConstraint]
    private let xLabelPositionConstraint: String = "xLabelPositionConstraint"

    init() {
        self.label = UILabel()
        self.constraints = [:]
        self.label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
    }

    func calculateConstraintUsing(knob: Knob, topPosition: Bool) -> [NSLayoutConstraint] {
        let views = ConstraintViews(target: label, related: knob)
        if !constraints.isEmpty {
            NSLayoutConstraint.deactivate(getConstraints())
        }
        constraints = [
            xLabelPositionConstraint: PositionConstraintFactory.centerX(views: views),
            "bottomConstraint": getLabelPositionConstraint(topPosition: topPosition, views: views)
        ]
        return getConstraints()
    }

    func getConstraints() -> [NSLayoutConstraint] {
        return constraints.map { $1 }
    }

    func setXPositionConstraint(_ value: CGFloat) {
        constraints[xLabelPositionConstraint]?.constant = value
    }

    func setAccessibilityIdentifier(accessibilityIdentifier: String?) {
        label.isAccessibilityElement = true
        label.isUserInteractionEnabled = true
        label.accessibilityIdentifier = "\(accessibilityIdentifier ?? "")Label"
    }

    private func getLabelPositionConstraint(topPosition: Bool, views: ConstraintViews) -> NSLayoutConstraint {
        return topPosition
            ? MarginConstraintFactory.bottomTo(attribute: .top, views: views, value: 0)
            : MarginConstraintFactory.topTo(attribute: .bottom, views: views, value: 0)
    }
}
