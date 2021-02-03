//
//  KnobGestureManager.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 03/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class KnobGestureManager {
    private unowned let bar: Bar
    private unowned let knobs: Knobs
    private unowned let knobGestureManagerDelegate: KnobGestureManagerDelegate
    private let stepCalculator: StepCalculator

    init(bar: Bar, knobs: Knobs, knobGestureManagerDelegate: KnobGestureManagerDelegate) {
        self.bar = bar
        self.knobs = knobs
        self.knobGestureManagerDelegate = knobGestureManagerDelegate
        self.stepCalculator = StepCalculator()
    }

    func moveLeftKnob(gesture: GestureData) {
        recognize(gesture: gesture, updateKnob: updateLeftKnobPositionUsing)
    }

    func moveRightKnob(gesture: GestureData) {
        recognize(gesture: gesture, updateKnob: updateRightKnobPositionUsing)
    }

    private func recognize(gesture: GestureData, updateKnob: (GestureData) -> Void) {
        if gesture.gestureRecognizer.state == .began {
            rangeSelectionStartedForKnobUsing(gesture: gesture, updateKnob: updateKnob)
        }
        if gesture.gestureRecognizer.state == .changed {
            updateKnobAndRangeUsing(gesture: gesture, updateKnob: updateKnob)
        }
        if gesture.gestureRecognizer.state == .ended {
            knobGestureManagerDelegate.rangeSelectionFinished()
        }
    }

    private func rangeSelectionStartedForKnobUsing(gesture: GestureData, updateKnob: (GestureData) -> Void) {
        updateKnob(gesture)
        knobGestureManagerDelegate.rangeChangeStarted()
    }

    private func updateKnobAndRangeUsing(gesture: GestureData, updateKnob: (GestureData) -> Void) {
        updateKnob(gesture)
        knobGestureManagerDelegate.rangeSelectionUpdate()
    }

    private func updateLeftKnobPositionUsing(gesture: GestureData) {
        let userInterfaceDirection = UIView.userInterfaceLayoutDirection(for: gesture.semanticContentAttribute)
        if userInterfaceDirection == UIUserInterfaceLayoutDirection.rightToLeft {
            let positionForKnob = bar.frame.width - positionForKnobGiven(
                xLocationInBar: gesture.gestureRecognizer.location(in: bar).x,
                gesture: gesture
            )
            let positionRightKnob = -1 * knobs.rightKnob.xPositionConstraint.constant
            if positionForKnob >= 0 && (bar.frame.width - positionForKnob) >= positionRightKnob {
                knobs.leftKnob.xPositionConstraint.constant = positionForKnob
            }
        } else {
            let positionForKnob = positionForKnobGiven(
                xLocationInBar: gesture.gestureRecognizer.location(in: bar).x,
                gesture: gesture
            )
            let positionRightKnob = bar.frame.width + knobs.rightKnob.xPositionConstraint.constant
            if positionForKnob >= 0 && positionForKnob <= positionRightKnob {
                knobs.leftKnob.xPositionConstraint.constant = positionForKnob
            }
        }
    }

    private func updateRightKnobPositionUsing(gesture: GestureData) {
        let userInterfaceDirection = UIView.userInterfaceLayoutDirection(for: gesture.semanticContentAttribute)
        if userInterfaceDirection == UIUserInterfaceLayoutDirection.rightToLeft {
            let xLocationInBar = gesture.gestureRecognizer.location(in: bar).x
            let positionForKnob = -1 * positionForKnobGiven(
                xLocationInBar: xLocationInBar,
                gesture: gesture
            )
            if positionForKnob <= 0 &&
                xLocationInBar <= (bar.frame.width - knobs.leftKnob.xPositionConstraint.constant) {
                knobs.rightKnob.xPositionConstraint.constant = positionForKnob
            }
        } else {
            let xLocationInBar = gesture.gestureRecognizer.location(in: bar).x
            let positionForKnob = positionForKnobGiven(
                xLocationInBar: xLocationInBar - bar.frame.width,
                gesture: gesture
            )
            if positionForKnob <= 0 && xLocationInBar >= knobs.leftKnob.xPositionConstraint.constant {
                knobs.rightKnob.xPositionConstraint.constant = positionForKnob
            }
        }
    }

    private func positionForKnobGiven(xLocationInBar: CGFloat, gesture: GestureData) -> CGFloat {
        let stepWidth = stepCalculator.calculateStepWidth(
            stepIncrement: gesture.stepIncrement,
            scale: gesture.scale,
            barWidth: bar.frame.width
        )
        return (xLocationInBar / stepWidth).rounded(FloatingPointRoundingRule.down) * stepWidth
    }
}
