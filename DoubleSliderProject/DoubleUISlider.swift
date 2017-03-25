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
            
            self.layer.cornerRadius = corners
            self.layer.masksToBounds = corners > 0.0
            setNeedsLayout()
        }
    }
    
    // MARK: Instance property.
    
    /// SliderBar component.
    private let bar: UIView = UIView()
    /// Left knob.
    private let leftKnob: UIView = UIView()
    /// Right knob.
    private let rightKnob: UIView = UIView()
    /// Left knob position constraint.
    private var leftKnobPosition: NSLayoutConstraint = NSLayoutConstraint()
    /// Right knob position constraint.
    private var rightKnobPosition: NSLayoutConstraint = NSLayoutConstraint()
    /// UIVIew used as progress bar for left knob.
    private let leftProgressView: UIView = UIView()
    /// UIVIew used as progress bar for right knob.
    private let rightProgressView: UIView = UIView()
    
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
        self.setupRightKnob()
        self.setupLeftProgressView()
        self.setupRightProgressView()
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
    
    private func setupLeftKnob() {
        
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
                                                   constant: 0.0)
        
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
    
    private func setupRightKnob() {
        
        self.rightKnob.translatesAutoresizingMaskIntoConstraints = false
        self.rightKnob.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.rightKnob.layer.cornerRadius = 15.0
        self.bar.addSubview(self.rightKnob)
        
        self.rightKnobPosition = NSLayoutConstraint(item: self.rightKnob,
                                                    attribute: .centerX,
                                                    relatedBy: .equal,
                                                    toItem: self.bar,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0.0)
        
        NSLayoutConstraint.activate([
            self.rightKnobPosition,
            NSLayoutConstraint(item: self.rightKnob,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 1.0),
            NSLayoutConstraint(item: self.rightKnob,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 30),
            NSLayoutConstraint(item: self.rightKnob,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 30)
            ])
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(moveRightKnob))
        self.rightKnob.addGestureRecognizer(gesture)
    }
    
    private func setupLeftProgressView() {
        
        self.leftProgressView.translatesAutoresizingMaskIntoConstraints = false
        self.leftProgressView.backgroundColor = #colorLiteral(red: 0.9994254708, green: 0.9855895638, blue: 0, alpha: 1)
        self.bar.insertSubview(self.leftProgressView, belowSubview: self.leftKnob)
        
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
    
    private func setupRightProgressView() {
        
        self.rightProgressView.translatesAutoresizingMaskIntoConstraints = false
        self.rightProgressView.backgroundColor = #colorLiteral(red: 0.9994254708, green: 0.9855895638, blue: 0, alpha: 1)
        self.bar.insertSubview(self.rightProgressView, belowSubview: self.rightKnob)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.rightProgressView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.rightProgressView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.rightProgressView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.rightKnob,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.rightProgressView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
    }
    
    public final func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let positionForKnob = gestureRecognizer.location(in: self.bar).x

            if positionForKnob >= 0 {
                
                self.leftKnobPosition.constant = positionForKnob
            }
        }
    }
    
    public final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let positionForKnob = gestureRecognizer.location(in: self.bar).x - self.bar.frame.width
            
            if positionForKnob <= 0 {
                
                self.rightKnobPosition.constant = positionForKnob
            }
        }
    }
}
