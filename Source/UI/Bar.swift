//
//  Bar.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

class Bar: UIView {
    private(set) var leadingConstraint: NSLayoutConstraint!
    private(set) var trailingConstraint: NSLayoutConstraint!
    private(set) var heightConstraint: NSLayoutConstraint!
    private var knobsHitTest: KnobsHitTest!

    func setup(leftKnob aLeftKnob: Knob,
               rightKnob aRightKnob: Knob,
               leading: CGFloat,
               trailing: CGFloat,
               height: CGFloat) -> [NSLayoutConstraint] {
        accessibilityIdentifier = "Bar"
        translatesAutoresizingMaskIntoConstraints = false
        self.knobsHitTest = KnobsHitTest(leftKnob: aLeftKnob, rightKnob: aRightKnob, parentView: self)
        return createConstraintsUsing(leading: leading, trailing: trailing, height: height)
    }

    private func createConstraintsUsing(leading: CGFloat, trailing: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
        leadingConstraint = MarginConstraintFactory.leadingConstraint(
            views: ContraintViews(target: self, relatedView: superview),
            value: leading
        )
        trailingConstraint = MarginConstraintFactory.trailingConstraint(
            views: ContraintViews(target: self, relatedView: superview),
            value: -1.0 * trailing
        )
        heightConstraint = DimensionConstraintFactory.heightConstraint(target: self, value: height)
        let barConstraints: [NSLayoutConstraint] = [
            leadingConstraint,
            trailingConstraint,
            heightConstraint,
            CenterConstraintFactory.centerX(target: self, parent: superview),
            CenterConstraintFactory.centerY(target: self, parent: superview)
        ]
        return barConstraints
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let knobHitted = knobsHitTest.test(point: point, event: event) {
            return knobHitted
        }
        return self
    }
}
