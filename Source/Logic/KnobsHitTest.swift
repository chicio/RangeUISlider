//
//  KnobsHitTest.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class KnobsHitTest {
    private unowned let leftKnob: Knob
    private unowned let rightKnob: Knob
    private unowned let parentView: UIView

    init(leftKnob: Knob, rightKnob: Knob, parentView: UIView) {
        self.leftKnob = leftKnob
        self.rightKnob = rightKnob
        self.parentView = parentView
    }

    func test(point: CGPoint, event: UIEvent?) -> Knob? {
        return aKnobHasBeenHit(
            leftKnobHit: hitTestInBarCoordinateSpaceFor(view: leftKnob, contains: point, with: event),
            rightKnobHit: hitTestInBarCoordinateSpaceFor(view: rightKnob, contains: point, with: event)
        )
    }

    private func hitTestInBarCoordinateSpaceFor(view: UIView, contains point: CGPoint, with event: UIEvent?) -> Bool {
        return hasBeenHitted(view: view, in: view.convert(point, from: parentView), with: event)
    }

    private func hasBeenHitted(view: UIView, in point: CGPoint, with event: UIEvent?) -> Bool {
        if view.hitTest(point, with: event) != nil {
            return true
        }
        return false
    }

    private func aKnobHasBeenHit(leftKnobHit: Bool, rightKnobHit: Bool) -> Knob? {
        if let knobChoosed = chooseKnobIfBothHaveBeenHit(
            leftKnobHitted: leftKnobHit,
            rightKnobHitted: rightKnobHit
        ) {
            return knobChoosed
        }
        if rightKnobHit {
            return rightKnob
        }
        if leftKnobHit {
            return leftKnob
        }
        return nil
    }

    private func chooseKnobIfBothHaveBeenHit(leftKnobHitted: Bool, rightKnobHitted: Bool) -> Knob? {
        if (leftKnobHitted && rightKnobHitted),
           let knobChoosenToBeReturned = chooseKnobToBeReturnedWhenBothHit() {
            return knobChoosenToBeReturned
        }
        return nil
    }

    private func chooseKnobToBeReturnedWhenBothHit() -> Knob? {
        if leftKnobIsAtTheLeftMarginOfTheBar() {
            return rightKnob
        }
        if rightKnobIsAtTheRightMarginOfTheBar() {
            return leftKnob
        }
        return nil
    }

    private func leftKnobIsAtTheLeftMarginOfTheBar() -> Bool {
        return leftKnob.xPositionConstraint.constant < leftKnob.widthConstraint.constant
    }

    private func rightKnobIsAtTheRightMarginOfTheBar() -> Bool {
        return rightKnob.xPositionConstraint.constant * -1 <= rightKnob.widthConstraint.constant
    }
}
