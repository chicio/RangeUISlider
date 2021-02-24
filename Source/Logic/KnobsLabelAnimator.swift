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

    init(leftKnob: Knob, rightKnob: Knob) {
        self.leftKnob = leftKnob
        self.rightKnob = rightKnob
    }

    func animate(shouldShow: Bool) {
        if shouldShow {
            if leftKnob.center.x + leftKnob.knobLabel.label.frame.width/2 >
                rightKnob.center.x - rightKnob.knobLabel.label.frame.width/2
                && canAnimateMoveAway {
                UIView.animate(withDuration: 0.2) { [unowned self] in
                    self.leftKnob.knobLabel.setXPositionConstraint(-self.leftKnob.knobLabel.label.frame.width / 2)
                    self.rightKnob.knobLabel.setXPositionConstraint(self.leftKnob.knobLabel.label.frame.width / 2)
                    self.canAnimateMoveAway = false
                    self.leftKnob.layoutIfNeeded()
                    self.rightKnob.layoutIfNeeded()
                } completion: { (_) in
                    self.canAnimateCenter = true
                }
            }

            if leftKnob.center.x + leftKnob.knobLabel.label.frame.width/2 <=
                rightKnob.center.x - rightKnob.knobLabel.label.frame.width/2
                && canAnimateCenter {
                UIView.animate(withDuration: 0.2) { [unowned self] in
                    self.leftKnob.knobLabel.setXPositionConstraint(0)
                    self.rightKnob.knobLabel.setXPositionConstraint(0)
                    self.canAnimateCenter = false
                    self.leftKnob.layoutIfNeeded()
                    self.rightKnob.layoutIfNeeded()
                } completion: { (_) in
                    self.canAnimateMoveAway = true
                }

            }
        }
    }
}
