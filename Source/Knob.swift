//
//  Knob.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation

enum KnobPosition {
    case left
    case right
}

class Knob: GradientView, UIGestureRecognizerDelegate {
    /// Knob background view.
    private(set) var backgroundView: UIView = UIView()
    /// ImageView used as background view when an image is choosed for knob.
    lazy private(set) var imageView: UIImageView = UIImageView()
    /// Knob x position constraint.
    private(set) var xPositionConstraint: NSLayoutConstraint!
    /// Knob width constraint.
    private(set) var widthConstraint: NSLayoutConstraint!
    /// Knob height constraint.
    private(set) var heightConstraint: NSLayoutConstraint!
    /// Knob position.
    private(set) var position: KnobPosition!
    /// Gesture recognizer target.
    private(set) var gestureRecognizerTarget: Any?
    
    /**
     Method used to setup the knob.
     
     - parameter position: the knob position.
     - parameter width: the knob width.
     - parameter height: the knob height.
     - parameter target: the knob gesture target.
     - parameter selector: the knob gesture selector.
     
     - returns: an arrays of knob constraints to be activated.
     */
    func setup(position: KnobPosition,
                           width: CGFloat,
                           height: CGFloat,
                           target: Any?,
                           selector: Selector) -> [NSLayoutConstraint] {
        self.position = position
        self.translatesAutoresizingMaskIntoConstraints = false
        let knobBackgroundConstraints: [NSLayoutConstraint] = self.setupBackground()
        self.setXPositionConstraint()
        self.setDimensionConstraints(usingWidth: width, andHeight: height)
        self.setGestureRecognizer(withTarget: target, usingSelector: selector)
        let knobConstraints: [NSLayoutConstraint] = [
            self.xPositionConstraint,
            self.centerVerticallyConstraint(),
            self.widthConstraint,
            self.heightConstraint
        ]
        return knobConstraints + knobBackgroundConstraints
    }
    
    /**
     Method used to setup a knob background.
     
     - returns: an arrays of knob background constraints to be activated.
     */
    private func setupBackground() -> [NSLayoutConstraint] {
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundView)
        let knobBackgroundViewConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: self.backgroundView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.backgroundView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.backgroundView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.backgroundView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0)
        ]
        return knobBackgroundViewConstraints
    }
    
    /**
     Method used to create a constraint to manage the x position of the knob.
     */
    private func setXPositionConstraint() {
        self.xPositionConstraint = NSLayoutConstraint(item: self,
                                                      attribute: .centerX,
                                                      relatedBy: .equal,
                                                      toItem: self.superview,
                                                      attribute: self.position == .left ? .leading : .trailing,
                                                      multiplier: 1.0,
                                                      constant: 0.0)
    }
    
    /**
     Method used to create the constraints used to manage the width and height of the knob.
     
     - parameter width: the width of the knob.
     - parameter height: the height of the knob.
     */
    private func setDimensionConstraints(usingWidth width: CGFloat, andHeight height: CGFloat) {
        self.widthConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: width)
        self.heightConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: height)
    }
    
    /**
     Method used to create the constraint used to manage the Y position of the knob.
     
     - returns: an NSLayoutConstraint used to manage the y position of the knob.
     */
    private func centerVerticallyConstraint() -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: .centerY,
                                  relatedBy: .equal,
                                  toItem: self.superview,
                                  attribute: .centerY,
                                  multiplier: 1.0,
                                  constant: 1.0)
    }
    
    /**
     Method used to create and attach a gesture recognizer to the knob.
     
     - parameter target: the target for the gesture recognizer selector action.
     - parameter selector: the selector used by the target to manage the action.
     */
    private func setGestureRecognizer(withTarget target: Any?, usingSelector selector: Selector) {
        let gesture = UIPanGestureRecognizer(target: target, action: selector)
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        gesture.delaysTouchesEnded = true
        self.addGestureRecognizer(gesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    /**
     Method used to add an image on the knob (to use as background).
     
     - parameter anImage: the image to be used as background of the knob.
     */
    func add(image anImage: UIImage?) {
        if let image = anImage {
            self.imageView.image = image
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            self.imageView.contentMode = .scaleToFill
            self.addSubview(self.imageView)
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: self.imageView,
                                   attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .centerX,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: self.imageView,
                                   attribute: .centerY,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .centerY,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: self.imageView,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .width,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: self.imageView,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .height,
                                   multiplier: 1.0,
                                   constant: 0.0)
                ])
        }
    }
    
    /**
     Add borders to the knob.
     
     - parameter color: the border UIColor.
     - parameter width: the border width.
     - parameter corners: the current corner radius of the knob.
     */
    func addBorders(usingColor color: UIColor, andWidth width: CGFloat, andCorners corners: CGFloat) {
        if self.imageView.image != nil {
            self.addBorders(toView: self.imageView, usingColor: color, andWidth: width)
            self.imageView.layer.cornerRadius = corners
        } else {
            self.addBorders(toView: self.backgroundView, usingColor: color, andWidth: width)
        }
    }
    
    /**
     Add borders to a specific view.
     
     - parameter view: the view on which the border will be added.
     - parameter color: the border UIColor.
     - parameter width: the border width.
     */
    private func addBorders(toView view: UIView,
                            usingColor color: UIColor,
                            andWidth width: CGFloat) {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }
}
