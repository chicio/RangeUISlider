//
//  Bar.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation

class Bar: UIView {
    /// Bar leading offset constraint.
    private(set) var leadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar trailing offset constraint.
    private(set) var trailingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar height constraint.
    private(set) var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Left knob reference. Unforce wrapped because it surely exist from in range slider (refernce in main view).
    private weak var leftKnob: Knob!
    /// Right knob reference. Unforce wrapped because it surely exist from in range slider (refernce in main view).
    private weak var rightKnob: Knob!
    /// Flag that indicates that the left knob has been hitted.
    private var leftKnobHitted: Bool = false
    /// Flag that indicates that the right knob has been hitted.
    private var rightKnobHitted: Bool = false

    /**
     Method used to setup a bar. This methods returns all the constraints to be activated.
     
     - parameter leftKnob: the left knob of the bar.
     - parameter rightKnob: the right knob of the bar.
     - parameter leading: the leading constant value to be used when creating the leading constraint.
     - parameter trailing: the trailing constant value to be used when creating the trailing constraint.
     - parameter height: the height constant vallue to be used when creating the height constraint.
     
     - returns: an arrays of constraints to be activated.
     */
    func setup(leftKnob aLeftKnob: Knob,
               rightKnob aRightKnob: Knob,
               leading: CGFloat,
               trailing: CGFloat,
               height: CGFloat) -> [NSLayoutConstraint] {
        
        leftKnob = aLeftKnob
        rightKnob = aRightKnob
        translatesAutoresizingMaskIntoConstraints = false
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
    
    /**
     Overridden hitTest method to support out of bounds view.
     In this case we have to manage the fact that the knobs must be
     draggable also outside of the bar bounds.
     
     - parameter point: the hit point inside the bar.
     - parameter event: the event that caused the hit.
     
     - returns the view that must manage the touch.
     */
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        leftKnobHitted = hitTestFor(view: leftKnob, contains: point, with: event)
        rightKnobHitted = hitTestFor(view: rightKnob, contains: point, with: event)
        if let knobChoosed = getKnobIfTheyHaveBeenBothHadBeenHitted()  {
            return knobChoosed
        }
        if rightKnobHitted {
            return rightKnob
        }
        if leftKnobHitted {
            return leftKnob
        }
        return self
    }
    
    private func getKnobIfTheyHaveBeenBothHadBeenHitted() -> Knob? {
        if bothKnobHaveBeenHitted() {
            if leftKnobIsAtTheLeftMarginOfTheBar() {
                return rightKnob
            }
            if rightKnobIsAtTheRightMarginOfTheBar() {
                return leftKnob
            }
        }
        return nil
    }
    
    private func bothKnobHaveBeenHitted() -> Bool {
        return leftKnobHitted && rightKnobHitted
    }
    
    private func leftKnobIsAtTheLeftMarginOfTheBar() -> Bool {
        return leftKnob.xPositionConstraint.constant < leftKnob.widthConstraint.constant
    }
    
    private func rightKnobIsAtTheRightMarginOfTheBar() -> Bool {
        return rightKnob.xPositionConstraint.constant * -1 <= rightKnob.widthConstraint.constant
    }
    
    /**
     Hit test for a specific view if it contains the point of touch.
     
     - seealso: https://developer.apple.com/library/content/qa/qa2013/qa1812.html.
     
     - parameter view: the view to be tested for hit/not hit.
     - parameter point: the hit point inside the bar.
     - parameter event: the event that caused the hit.
     
     - returns: true if the view has been hitted.
     */
    private func hitTestFor(view: UIView, contains point: CGPoint, with event: UIEvent?) -> Bool {
        let pointInViewCoordinateSpace = view.convert(point, from: self)
        return hasBeenHitted(view: view, in: pointInViewCoordinateSpace, with: event)
    }
    
    /**
     Check if a view or one of its descendant has been hitted.
     
     - parameter view: the view under test for hit.
     - parameter point: the point toi be checked for test on view.
     - parameter event: the event that fired the touch.
     
     - returns: true if the point is in the view, else false.
     */
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
