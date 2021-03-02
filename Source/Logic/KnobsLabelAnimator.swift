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
            tryToAnimateMoveAway()
            tryToAnimateMoveToCenter()
        }
    }

    private func tryToAnimateMoveAway() {
        if shouldMoveLabelAway() {
            animation(
                constraintsValues: (left: moveAwayLeftKnobValue(), right: moveAwayRightKnobValue()),
                animationStart: { [unowned self] in self.canAnimateMoveAway = false },
                animationCompleted: { [unowned self] (_) in self.canAnimateCenter = true }
            )
        }
    }

    private func tryToAnimateMoveToCenter() {
        if shouldMoveToCenter() {
            animation(
                constraintsValues: (left: 0, right: 0),
                animationStart: { [unowned self] in self.canAnimateCenter = false },
                animationCompleted: { [unowned self] (_) in self.canAnimateMoveAway = true }
            )
        }
    }

    private func animation(
        constraintsValues: (left: CGFloat, right: CGFloat),
        animationStart:  () -> Void,
        animationCompleted: @escaping (Bool) -> Void
    ) {
        UIView.animate(
            withDuration: 0.2,
            animations: {
                self.leftKnob.components.knobLabel.setXPositionConstraint(constraintsValues.left)
                self.rightKnob.components.knobLabel.setXPositionConstraint(constraintsValues.right)
                self.canAnimateCenter = false
                self.leftKnob.layoutIfNeeded()
                self.rightKnob.layoutIfNeeded()
            },
            completion: animationCompleted)
    }

    private func moveAwayLeftKnobValue() -> CGFloat {
        return -(self.leftKnob.components.knobLabel.label.frame.width / 2) - spaceBetweenLabelsPerKnob
    }

    private func moveAwayRightKnobValue() -> CGFloat {
        return (self.rightKnob.components.knobLabel.label.frame.width) / 2 + spaceBetweenLabelsPerKnob
    }

    private func shouldMoveToCenter() -> Bool {
        return leftKnobLabelRightMargin() < rightKnobLabelLeftMargin() && canAnimateCenter
    }

    private func shouldMoveLabelAway() -> Bool {
        return leftKnobLabelRightMargin() >= rightKnobLabelLeftMargin() && canAnimateMoveAway
    }

    private func leftKnobLabelRightMargin() -> CGFloat {
        return leftKnob.center.x + leftKnob.components.knobLabel.label.frame.width/2
    }

    private func rightKnobLabelLeftMargin() -> CGFloat {
        return rightKnob.center.x - rightKnob.components.knobLabel.label.frame.width/2
    }
}
