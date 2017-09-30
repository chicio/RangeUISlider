//
//  Bar.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation

class Bar: UIView {
    private(set) var leadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private(set) var trailingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private(set) var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private weak var leftKnob: Knob!
    private weak var rightKnob: Knob!
    private var leftKnobHitted: Bool = false
    private var rightKnobHitted: Bool = false
    
    func setup(leftKnob aLeftKnob: Knob,
               rightKnob aRightKnob: Knob,
               leading: CGFloat,
               trailing: CGFloat,
               height: CGFloat) -> [NSLayoutConstraint] {
        leftKnob = aLeftKnob
        rightKnob = aRightKnob
        translatesAutoresizingMaskIntoConstraints = false
        let barContraints = createConstraintsUsing(leading: leading, trailing: trailing, height: height)
        return barContraints
    }
    
    func createConstraintsUsing(leading: CGFloat, trailing: CGFloat, height: CGFloat) -> [NSLayoutConstraint]  {
        leadingConstraint = NSLayoutConstraint(item: self,
                                               attribute: .leading,
                                               relatedBy: .equal,
                                               toItem: superview,
                                               attribute: .leading,
                                               multiplier: 1.0,
                                               constant: leading)
        trailingConstraint = NSLayoutConstraint(item: self,
                                                attribute: .trailing,
                                                relatedBy: .equal,
                                                toItem: superview,
                                                attribute: .trailing,
                                                multiplier: 1.0,
                                                constant: -1.0 * trailing)
        heightConstraint = NSLayoutConstraint(item: self,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: height)
        let barConstraints: [NSLayoutConstraint] = [
            leadingConstraint,
            trailingConstraint,
            heightConstraint,
            NSLayoutConstraint(item: self,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: superview,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: superview,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0)
        ]
        return barConstraints
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        leftKnobHitted = hitTestInBarCoordinateSpaceFor(view: leftKnob, contains: point, with: event)
        rightKnobHitted = hitTestInBarCoordinateSpaceFor(view: rightKnob, contains: point, with: event)
        if let knobHitted = aKnobHasBeenHitted() {
            return knobHitted
        }
        return self
    }
    
    private func hitTestInBarCoordinateSpaceFor(view: UIView, contains point: CGPoint, with event: UIEvent?) -> Bool {
        let pointInViewCoordinateSpace = view.convert(point, from: self)
        return hasBeenHitted(view: view, in: pointInViewCoordinateSpace, with: event)
    }
    
    func aKnobHasBeenHitted() -> Knob? {
        if let knobChoosed = getKnobIfNecessaryWhenTheyHaveBeenBothHitted()  {
            return knobChoosed
        }
        if rightKnobHitted {
            return rightKnob
        }
        if leftKnobHitted {
            return leftKnob
        }
        return nil
    }
    
    private func getKnobIfNecessaryWhenTheyHaveBeenBothHitted() -> Knob? {
        if bothKnobHaveBeenHitted(), let knobChoosenToBeReturned = chooseIfKnobHaveToBeReturnedIfBothHaveBeenHitted() {
            return knobChoosenToBeReturned
        }
        return nil
    }
    
    private func bothKnobHaveBeenHitted() -> Bool {
        return leftKnobHitted && rightKnobHitted
    }
    
    private func chooseIfKnobHaveToBeReturnedIfBothHaveBeenHitted() -> Knob? {
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
    
    private func hasBeenHitted(view: UIView, in point: CGPoint, with event: UIEvent?) -> Bool {
        if wasHitTestSuccessfulFor(view: view, in: point, with: event) {
            return true
        }
        return false
    }
    
    private func wasHitTestSuccessfulFor(view: UIView, in point: CGPoint, with event: UIEvent?) -> Bool {
        return view.hitTest(point, with: event) != nil
    }
}
