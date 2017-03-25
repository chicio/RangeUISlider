//
//  DoubleUISlider.swift
//  DoubleSliderProject
//
//  Created by Fabrizio Duroni on 15/03/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DoubleUISlider: UIView {
    
    // MARK: Constants.
    
    fileprivate let offsetSliderBar: CGFloat = 20.0
    
    // MARK: Inspectable property.
    
    @IBInspectable var corners: CGFloat = 0.0 {
        didSet {
            
            layer.cornerRadius = corners
            layer.masksToBounds = corners > 0.0
            setNeedsLayout()
        }
    }
    
    // MARK: Instance property.
    
    /// SliderBar component.
    fileprivate let bar: UIView = UIView()
    /// Left knob.
    fileprivate let leftKnob: UIView = UIView()
    /// Right knob.
    fileprivate let rightKnob: UIView = UIView()
    /// Left knob position constraint.
    fileprivate var leftKnobPosition: NSLayoutConstraint = NSLayoutConstraint()
    /// UIVIew to draw before the left knob.
    fileprivate let leftProgressView: UIView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        
        self.setUpBar()
        self.setupLeftKnob()
        self.setuProgressView()
    }
    
    private func setUpBar() {
        
        self.bar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.bar)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.bar,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: self.offsetSliderBar),
            NSLayoutConstraint(item: self.bar,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: -1.0 * self.offsetSliderBar),
            NSLayoutConstraint(item: self.bar,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .height,
                               multiplier: 0.3,
                               constant: 0.0),
            NSLayoutConstraint(item: self.bar,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.bar,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0)
            ])
        self.bar.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
    
    func setupLeftKnob() {
        
        self.leftKnob.translatesAutoresizingMaskIntoConstraints = false
        self.leftKnob.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.leftKnob.layer.cornerRadius = 15.0
        self.bar.addSubview(self.leftKnob)
        
        self.leftKnobPosition = NSLayoutConstraint(item: self.leftKnob,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: self.bar,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 1.0)
        
        NSLayoutConstraint.activate([
            self.leftKnobPosition,
            NSLayoutConstraint(item: self.leftKnob,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 1.0),
            NSLayoutConstraint(item: self.leftKnob,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 30),
            NSLayoutConstraint(item: self.leftKnob,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 30)
        ])
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(moveLeftKnob))
        self.leftKnob.addGestureRecognizer(gesture)
    }
    
    func setuProgressView() {
        
        self.leftProgressView.translatesAutoresizingMaskIntoConstraints = false
        self.leftProgressView.backgroundColor = #colorLiteral(red: 0.9994254708, green: 0.9855895638, blue: 0, alpha: 1)
        self.bar.insertSubview(self.leftProgressView, belowSubview: self.leftKnob)
        self.bar.bringSubview(toFront: self.leftKnob)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.leftProgressView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.leftProgressView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.leftProgressView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.leftProgressView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.leftKnob,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
    }
    
    static var position = 0
    
    func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let positionForKnob = gestureRecognizer.location(in: self.bar)

            if positionForKnob.x >= 0 {
                
                self.leftKnobPosition.constant = positionForKnob.x
                self.leftKnob.layoutIfNeeded()
            }
        }
    }
}
