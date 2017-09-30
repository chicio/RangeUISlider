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

class Knob: Gradient, UIGestureRecognizerDelegate {
    private(set) var backgroundView: UIView = UIView()
    lazy private(set) var imageView: UIImageView = UIImageView()
    private(set) var xPositionConstraint: NSLayoutConstraint!
    private(set) var widthConstraint: NSLayoutConstraint!
    private(set) var heightConstraint: NSLayoutConstraint!
    private(set) var position: KnobPosition!
    private(set) var gestureRecognizerTarget: Any?
    
    func setup(position aPosition: KnobPosition,
               width: CGFloat,
               height: CGFloat,
               target: Any?,
               selector: Selector) -> [NSLayoutConstraint] {
        position = aPosition
        translatesAutoresizingMaskIntoConstraints = false
        let knobBackgroundConstraints: [NSLayoutConstraint] = setupBackground()
        setXPositionConstraint()
        setDimensionConstraints(usingWidth: width, andHeight: height)
        setGestureRecognizer(withTarget: target, usingSelector: selector)
        let knobConstraints: [NSLayoutConstraint] = [
            xPositionConstraint,
            centerVerticallyConstraint(),
            widthConstraint,
            heightConstraint
        ]
        return knobConstraints + knobBackgroundConstraints
    }
    
    private func setupBackground() -> [NSLayoutConstraint] {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        let knobBackgroundViewConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: backgroundView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: backgroundView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: backgroundView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: backgroundView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0)
        ]
        return knobBackgroundViewConstraints
    }
    
    private func setXPositionConstraint() {
        xPositionConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .centerX,
                                                 relatedBy: .equal,
                                                 toItem: superview,
                                                 attribute: position == .left ? .leading : .trailing,
                                                 multiplier: 1.0,
                                                 constant: 0.0)
    }
    
    private func setDimensionConstraints(usingWidth width: CGFloat, andHeight height: CGFloat) {
        widthConstraint = NSLayoutConstraint(item: self,
                                             attribute: .width,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: .notAnAttribute,
                                             multiplier: 1.0,
                                             constant: width)
        heightConstraint = NSLayoutConstraint(item: self,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: height)
    }
    
    private func centerVerticallyConstraint() -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: .centerY,
                                  relatedBy: .equal,
                                  toItem: superview,
                                  attribute: .centerY,
                                  multiplier: 1.0,
                                  constant: 1.0)
    }
    
    private func setGestureRecognizer(withTarget target: Any?, usingSelector selector: Selector) {
        let gesture = UIPanGestureRecognizer(target: target, action: selector)
        gesture.delegate = self
        addGestureRecognizer(gesture)
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
    
    func add(image anImage: UIImage?) {
        if let image = anImage {
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleToFill
            addSubview(imageView)
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: imageView,
                                   attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .centerX,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: imageView,
                                   attribute: .centerY,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .centerY,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: imageView,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .width,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: imageView,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .height,
                                   multiplier: 1.0,
                                   constant: 0.0)
                ])
        }
    }
    
    func addBorders(usingColor color: UIColor, andWidth width: CGFloat, andCorners corners: CGFloat) {
        if imageView.image != nil {
            addBorders(toView: imageView, usingColor: color, andWidth: width)
            imageView.layer.cornerRadius = corners
        } else {
            addBorders(toView: backgroundView, usingColor: color, andWidth: width)
        }
    }
    
    private func addBorders(toView view: UIView,
                            usingColor color: UIColor,
                            andWidth width: CGFloat) {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }
}
