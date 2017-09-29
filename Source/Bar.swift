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
    
    /**
     Method used to setup a bar. This methods returns all the constraints to be activated.
     
     - parameter leftKnob: the left knob of the bar.
     - parameter rightKnob: the right knob of the bar.
     - parameter leading: the leading constant value to be used when creating the leading constraint.
     - parameter trailing: the trailing constant value to be used when creating the trailing constraint.
     - parameter height: the height constant vallue to be used when creating the height constraint.
     
     - returns: an arrays of constraints to be activated.
     */
    func setup(leftKnob: Knob,
               rightKnob: Knob,
               leading: CGFloat,
               trailing: CGFloat,
               height: CGFloat) -> [NSLayoutConstraint] {
        
        self.leftKnob = leftKnob
        self.rightKnob = rightKnob
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingConstraint = NSLayoutConstraint(item: self,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: self.superview,
                                                    attribute: .leading,
                                                    multiplier: 1.0,
                                                    constant: leading)
        self.trailingConstraint = NSLayoutConstraint(item: self,
                                                     attribute: .trailing,
                                                     relatedBy: .equal,
                                                     toItem: self.superview,
                                                     attribute: .trailing,
                                                     multiplier: 1.0,
                                                     constant: -1.0 * trailing)
        self.heightConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: height)
        let barConstraints: [NSLayoutConstraint] = [
            self.leadingConstraint,
            self.trailingConstraint,
            self.heightConstraint,
            NSLayoutConstraint(item: self,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: self.superview,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.superview,
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
        if let leftKnobHittedView = self.hitTestViewFor(knob: self.leftKnob, contains: point, with: event)  {
            return leftKnobHittedView
        }
        if let rightKnobHittedView = self.hitTestViewFor(knob: self.rightKnob, contains: point, with: event)  {
            return rightKnobHittedView
        }
        return self
    }
    
    /**
     Select the hitTest for a specific knob if it contains the point of touch.
     
     - seealso: https://developer.apple.com/library/content/qa/qa2013/qa1812.html.
     
     - parameter point: the hit point inside the bar.
     - parameter event: the event that caused the hit.
     
     - returns: the view that must manage the touch.
     */
    private func hitTestViewFor(knob: Knob, contains point: CGPoint, with event: UIEvent?) -> UIView? {
        let pointForTargetView = knob.convert(point, from: self)
        if knob.bounds.contains(pointForTargetView) {
            return knob.hitTest(pointForTargetView, with: event)
        }
        return nil
    }
}
