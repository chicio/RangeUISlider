//
//  DoubleUISlider.swift
//  DoubleSliderProject
//
//  Created by Fabrizio Duroni on 15/03/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

@objc public protocol RangeUISliderDelegate {
    
    func rangeChanged(minValue: CGFloat, maxValue: CGFloat)
}

@IBDesignable
@objc public class DoubleUISlider: UIView {
    
    // MARK: Inspectable property.
    
    /// Scale min value.
    @IBInspectable var scaleMinValue: CGFloat = 0.0
    /// Scale max value.
    @IBInspectable var scaleMaxValue: CGFloat = 1.0
    /// Right knob width.
    @IBInspectable var rightKnobWidth: CGFloat = 30.0 {
        
        didSet {
            
            self.rightKnobsWidthConstraint.constant = self.rightKnobWidth
        }
    }
    /// Right knob height.
    @IBInspectable var rightKnobHeight: CGFloat = 30.0 {
        
        didSet {
            
            self.rightKnobsHeightConstraint.constant = self.rightKnobHeight
        }
    }
    /// Right knob corners.
    @IBInspectable var rightKnobCornes: CGFloat = 15.0 {
        
        didSet {
            
            self.rightKnob.layer.cornerRadius = self.rightKnobCornes
            self.rightKnob.layer.masksToBounds = self.rightKnobCornes > 0.0
        }
    }
    /// Right knob image.
    @IBInspectable var rightKnobImage: UIImage? {
        
        didSet {
            
            self.setup(image: self.rightKnobImage, forKnob: self.rightKnob)
        }
    }
    /// Right knob color.
    @IBInspectable var rightKnobColor: UIColor = UIColor.gray {
        
        didSet {
            
            self.rightKnob.backgroundColor = self.rightKnobColor
        }
    }
    /// Left knob width.
    @IBInspectable var leftKnobWidth: CGFloat = 30.0 {
        
        didSet {
            
            self.leftKnobsWidthConstraint.constant = self.leftKnobWidth
        }
    }
    /// Left knob height.
    @IBInspectable var leftKnobHeight: CGFloat = 30.0 {
        
        didSet {
            
            self.leftKnobsHeightConstraint.constant = self.leftKnobHeight
        }
    }
    /// Left knob corners.
    @IBInspectable var leftKnobCornes: CGFloat = 15.0 {
        
        didSet {
            
            self.leftKnob.layer.cornerRadius = self.leftKnobCornes
            self.leftKnob.layer.masksToBounds = self.leftKnobCornes > 0.0
        }
    }
    /// Left knob image.
    @IBInspectable var leftKnobImage: UIImage? {
        
        didSet {
            
            self.setup(image: self.leftKnobImage, forKnob: self.leftKnob)
        }
    }
    /// Left knob color.
    @IBInspectable var leftKnobColor: UIColor = UIColor.gray {
        
        didSet {
            
            self.leftKnob.backgroundColor = self.leftKnobColor
        }
    }
    /// Bar height.
    @IBInspectable var barHeight: CGFloat = 20.0 {
        
        didSet {
            
            self.barHeightConstraint.constant = self.barHeight
        }
    }
    /// Bar leading offset.
    @IBInspectable var barLeading: CGFloat = 20.0 {
        
        didSet {
            
            self.barLeadingConstraint.constant = self.barLeading
        }
    }
    /// Bar trailing offset.
    @IBInspectable var barTrailing: CGFloat = 20.0 {
        
        didSet {
            
            self.barTrailingConstraint.constant = -self.barTrailing
        }
    }
    /// Container corners.
    @IBInspectable var containerCorners: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.cornerRadius = self.containerCorners
            self.layer.masksToBounds = self.containerCorners > 0.0
        }
    }
    
    // MARK: Instance property.
    
    /// SliderBar component.
    private let bar: UIView = UIView()
    /// Left knob.
    private let leftKnob: UIView = UIView()
    /// Right knob.
    private let rightKnob: UIView = UIView()
    /// UIVIew used as progress bar for left knob.
    private let leftProgressView: UIView = UIView()
    /// UIVIew used as progress bar for right knob.
    private let rightProgressView: UIView = UIView()
    /// Slider delegate.
    public var delegate: RangeUISliderDelegate?
    
    /// Left knob position constraint.
    private var leftKnobXPositionConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Right knob position constraint.
    private var rightKnobXPositionConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar leading offset constraint.
    private var barLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar trailing offset constraint.
    private var barTrailingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar height constraint.
    private var barHeightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Right knobs width constraint.
    private var rightKnobsWidthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Right knobs height constraint.
    private var rightKnobsHeightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Left knob width constraint.
    private var leftKnobsWidthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Left knob height constraint.
    private var leftKnobsHeightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override public init(frame: CGRect) {
        
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
        
        self.barLeadingConstraint = NSLayoutConstraint(item: self.bar,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: self.barLeading)
        
        self.barTrailingConstraint = NSLayoutConstraint(item: self.bar,
                                                        attribute: .trailing,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .trailing,
                                                        multiplier: 1.0,
                                                        constant: -1.0 * self.barTrailing)
        
        self.barHeightConstraint = NSLayoutConstraint(item: self.bar,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: self.barHeight)
        
        NSLayoutConstraint.activate([
            self.barLeadingConstraint,
            self.barTrailingConstraint,
            self.barHeightConstraint,
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
    
    // MARK: Knobs.
    
    private func setupLeftKnob() {
        
        self.leftKnob.translatesAutoresizingMaskIntoConstraints = false
        self.leftKnob.layer.cornerRadius = 15.0
        self.bar.addSubview(self.leftKnob)
        
        self.leftKnobXPositionConstraint = NSLayoutConstraint(item: self.leftKnob,
                                                              attribute: .centerX,
                                                              relatedBy: .equal,
                                                              toItem: self.bar,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0.0)
        
        self.leftKnobsWidthConstraint = NSLayoutConstraint(item: self.leftKnob,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: nil,
                                                           attribute: .notAnAttribute,
                                                           multiplier: 1.0,
                                                           constant: 30)
        
        self.leftKnobsHeightConstraint = NSLayoutConstraint(item: self.leftKnob,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 30)
        
        NSLayoutConstraint.activate([
            self.leftKnobXPositionConstraint,
            NSLayoutConstraint(item: self.leftKnob,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 1.0),
            self.leftKnobsWidthConstraint,
            self.leftKnobsHeightConstraint
            ])
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(moveLeftKnob))
        self.leftKnob.addGestureRecognizer(gesture)
    }
    
    private func setupRightKnob() {
        
        self.rightKnob.translatesAutoresizingMaskIntoConstraints = false
        self.rightKnob.layer.cornerRadius = self.rightKnobCornes
        self.rightKnob.layer.masksToBounds = self.rightKnobCornes > 0.0
        self.bar.addSubview(self.rightKnob)
        
        self.rightKnobXPositionConstraint = NSLayoutConstraint(item: self.rightKnob,
                                                               attribute: .centerX,
                                                               relatedBy: .equal,
                                                               toItem: self.bar,
                                                               attribute: .trailing,
                                                               multiplier: 1.0,
                                                               constant: 0.0)
        
        self.rightKnobsWidthConstraint = NSLayoutConstraint(item: self.rightKnob,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: self.rightKnobWidth)
        
        self.rightKnobsHeightConstraint = NSLayoutConstraint(item: self.rightKnob,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 30)
        
        NSLayoutConstraint.activate([
            self.rightKnobXPositionConstraint,
            NSLayoutConstraint(item: self.rightKnob,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 1.0),
            self.rightKnobsWidthConstraint,
            self.rightKnobsHeightConstraint
        ])
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(moveRightKnob))
        self.rightKnob.addGestureRecognizer(gesture)
    }
    
    func setup(image anImage: UIImage?, forKnob knob: UIView) {
        
        if let image = anImage {
            
            let knobImageView = UIImageView(image: image)
            knobImageView.translatesAutoresizingMaskIntoConstraints = false
            knobImageView.contentMode = .scaleToFill
            knob.addSubview(knobImageView)
            
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: knob,
                                   attribute: .centerX,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .centerY,
                                   relatedBy: .equal,
                                   toItem: knob,
                                   attribute: .centerY,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: knob,
                                   attribute: .width,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: knob,
                                   attribute: .height,
                                   multiplier: 1.0,
                                   constant: 0.0)
            ])
        }
    }
    
    // MARK: Progress views.
    
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
    
    // MARK: Gesture recognizer methods (knobs movements).
    
    public final func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let positionForKnob = gestureRecognizer.location(in: self.bar).x
            let positionRightKnob = self.bar.frame.width + self.rightKnobXPositionConstraint.constant
            
            if positionForKnob >= 0 && positionForKnob <= positionRightKnob {
                
                self.leftKnobXPositionConstraint.constant = positionForKnob
            }
            
            self.calculateChangeRange()
        }
    }
    
    public final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let xLocationInBar = gestureRecognizer.location(in: self.bar).x
            let positionForKnob = xLocationInBar - self.bar.frame.width
            
            if positionForKnob <= 0 && xLocationInBar >= self.leftKnobXPositionConstraint.constant {
                
                self.rightKnobXPositionConstraint.constant = positionForKnob
            }
            
            self.calculateChangeRange()
        }
    }
    
    // MARK: Range selected calculation.
    
    private func calculateChangeRange() {
        
        let minValue = self.leftKnobXPositionConstraint.constant / self.bar.frame.width
        let maxValue = 1.0  + self.rightKnobXPositionConstraint.constant / self.bar.frame.width
        let scaledMinValue = self.linearMapping(value: minValue)
        let scaledMaxValue = self.linearMapping(value: maxValue)
        
        self.delegate?.rangeChanged(minValue: scaledMinValue, maxValue: scaledMaxValue)
    }
    
    private func linearMapping(value: CGFloat) -> CGFloat {
        
        return value * (self.scaleMaxValue - self.scaleMinValue) + self.scaleMinValue
    }
}
