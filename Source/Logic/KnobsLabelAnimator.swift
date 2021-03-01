//
//  KnobsLabelAnimator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 24/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class KnobsLabelAnimator {
    private unowned let leftKnob: Knob
    private unowned let rightKnob: Knob
    private var canAnimateMoveAway: Bool = true
    private var canAnimateCenter: Bool = false
    private let spaceBetweenLabelsPerKnob: CGFloat = 2.5

    init(leftKnob: Knob, rightKnob: Knob) {
        self.leftKnob = leftKnob
        self.rightKnob = rightKnob
    }

    func animate(shouldShow: Bool) {
        if shouldShow {
            if leftKnobLabelRightMargin() >= rightKnobLabelLeftMargin() && canAnimateMoveAway {
                UIView.animate(withDuration: 0.2) { [unowned self] in
                    self.leftKnob.components.knobLabel.setXPositionConstraint(
                        -(self.leftKnob.components.knobLabel.label.frame.width / 2) - spaceBetweenLabelsPerKnob
                    )
                    self.rightKnob.components.knobLabel.setXPositionConstraint(
                        (self.rightKnob.components.knobLabel.label.frame.width) / 2 + spaceBetweenLabelsPerKnob
                    )
                    self.canAnimateMoveAway = false
                    self.leftKnob.layoutIfNeeded()
                    self.rightKnob.layoutIfNeeded()
                } completion: { [unowned self] (_) in
                    self.canAnimateCenter = true
                }
            }

            if leftKnobLabelRightMargin() < rightKnobLabelLeftMargin() && canAnimateCenter {
                UIView.animate(withDuration: 0.2) { [unowned self] in
                    self.leftKnob.components.knobLabel.setXPositionConstraint(0)
                    self.rightKnob.components.knobLabel.setXPositionConstraint(0)
                    self.canAnimateCenter = false
                    self.leftKnob.layoutIfNeeded()
                    self.rightKnob.layoutIfNeeded()
                } completion: { [unowned self] (_) in
                    self.canAnimateMoveAway = true
                }

            }
        }
    }

    private func leftKnobLabelRightMargin() -> CGFloat {
        return leftKnob.center.x + leftKnob.components.knobLabel.label.frame.width/2
    }

    private func rightKnobLabelLeftMargin() -> CGFloat {
        return rightKnob.center.x - rightKnob.components.knobLabel.label.frame.width/2
    }
}
