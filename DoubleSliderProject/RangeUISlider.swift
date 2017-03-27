//
//  RangeUISlider.swift
//
//  Created by Fabrizio Duroni on 25/03/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

@objc public protocol RangeUISliderDelegate {
    
    func rangeChanged(minValue: CGFloat, maxValue: CGFloat, sliderIdentifier: Int)
}

@IBDesignable
@objc public class RangeUISlider: UIView {
    
    // MARK: Inspectable property.
    
    /// Identifier used to check which slider we are getting values from.
    @IBInspectable var identifier: Int = 0
    /// Scale min value.
    @IBInspectable var scaleMinValue: CGFloat = 0.0
    /// Scale max value.
    @IBInspectable var scaleMaxValue: CGFloat = 1.0
    ///Selected range background color.
    @IBInspectable var rangeSelectedColor: UIColor = UIColor.blue {
        
        didSet {
            
            self.selectedProgressView.backgroundColor = self.rangeSelectedColor
        }
    }
    ///Not selected range background color.
    @IBInspectable var rangeNotSelectedColor: UIColor = UIColor.lightGray {
        
        didSet {
            
            self.leftProgressView.backgroundColor = self.rangeNotSelectedColor
            self.rightProgressView.backgroundColor = self.rangeNotSelectedColor
        }
    }
    /// Left knob width.
    @IBInspectable var leftKnobWidth: CGFloat = 30.0 {
        
        didSet {
            
            self.leftKnob.widthConstraint.constant = self.leftKnobWidth
        }
    }
    /// Left knob height.
    @IBInspectable var leftKnobHeight: CGFloat = 30.0 {
        
        didSet {
            
            self.leftKnob.heightConstraint.constant = self.leftKnobHeight
        }
    }
    /// Left knob corners.
    @IBInspectable var leftKnobCornes: CGFloat = 15.0 {
        
        didSet {
            
            self.leftKnob.backgroundView.layer.cornerRadius = self.leftKnobCornes
            self.leftKnob.backgroundView.layer.masksToBounds = self.leftKnobCornes > 0.0
        }
    }
    /// Left knob image.
    @IBInspectable var leftKnobImage: UIImage? {
        
        didSet {
            
            self.leftKnob.setup(image: self.leftKnobImage)
        }
    }
    /// Left knob color.
    @IBInspectable var leftKnobColor: UIColor = UIColor.gray {
        
        didSet {

            self.leftKnob.backgroundColor = self.leftKnobColor
        }
    }
    /// Left knob shadow opacity.
    @IBInspectable var leftShadowOpacity: Float = 0.0 {
        
        didSet {
            
            self.leftKnob.layer.shadowOpacity = self.leftShadowOpacity
        }
    }
    /// Left knob shadow color.
    @IBInspectable var leftShadowColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.leftKnob.layer.shadowColor = self.leftShadowColor.cgColor
        }
    }
    /// Left knob shadow offset.
    @IBInspectable var leftShadowOffset: CGSize = CGSize() {
        
        didSet {
            
            self.leftKnob.layer.shadowOffset = self.leftShadowOffset
        }
    }
    /// Left knob shadow radius.
    @IBInspectable var leftShadowRadius: CGFloat = 0 {
        
        didSet {
            
            self.leftKnob.layer.shadowRadius = self.leftShadowRadius
        }
    }
    /// Right knob width.
    @IBInspectable var rightKnobWidth: CGFloat = 30.0 {
        
        didSet {
            
            self.rightKnob.widthConstraint.constant = self.rightKnobWidth
        }
    }
    /// Right knob height.
    @IBInspectable var rightKnobHeight: CGFloat = 30.0 {
        
        didSet {
            
            self.rightKnob.heightConstraint.constant = self.rightKnobHeight
        }
    }
    /// Right knob corners.
    @IBInspectable var rightKnobCornes: CGFloat = 15.0 {
        
        didSet {
            
            self.rightKnob.backgroundView.layer.cornerRadius = self.rightKnobCornes
            self.rightKnob.backgroundView.layer.masksToBounds = self.rightKnobCornes > 0.0
        }
    }
    /// Right knob image.
    @IBInspectable var rightKnobImage: UIImage? {
        
        didSet {
            
            self.rightKnob.setup(image: self.rightKnobImage)
        }
    }
    /// Right knob color.
    @IBInspectable var rightKnobColor: UIColor = UIColor.gray {
        
        didSet {
            
            self.rightKnob.backgroundView.backgroundColor = self.rightKnobColor
        }
    }
    /// Right knob shadow opacity.
    @IBInspectable var rightShadowOpacity: Float = 0.0 {
        
        didSet {
            
            self.rightKnob.layer.shadowOpacity = self.rightShadowOpacity
        }
    }
    /// Right knob shadow color.
    @IBInspectable var rightShadowColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.rightKnob.layer.shadowColor = self.rightShadowColor.cgColor
        }
    }
    /// Right knob shadow offset.
    @IBInspectable var rightShadowOffset: CGSize = CGSize() {
        
        didSet {
            
            self.rightKnob.layer.shadowOffset = self.rightShadowOffset
        }
    }
    /// Right knob shadow radius.
    @IBInspectable var rightShadowRadius: CGFloat = 0 {
        
        didSet {
            
            self.rightKnob.layer.shadowRadius = self.rightShadowRadius
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
    /// Bar corners.
    @IBInspectable var barCornes: CGFloat = 20.0 {
        
        didSet {
            
            self.leftProgressView.layer.cornerRadius = barCornes
            self.rightProgressView.layer.cornerRadius = barCornes
        }
    }
    /// Bar shadow opacity.
    @IBInspectable var barShadowOpacity: Float = 0.0 {
        
        didSet {
            
            self.bar.layer.shadowOpacity = self.barShadowOpacity
        }
    }
    /// Bar shadow color.
    @IBInspectable var barShadowColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.bar.layer.shadowColor = self.barShadowColor.cgColor
        }
    }
    /// Bar shadow offset.
    @IBInspectable var barShadowOffset: CGSize = CGSize() {
        
        didSet {
            
            self.bar.layer.shadowOffset = self.barShadowOffset
        }
    }
    /// Bar shadow radius.
    @IBInspectable var barShadowRadius: CGFloat = 0 {
        
        didSet {
            
            self.bar.layer.shadowRadius = self.barShadowRadius
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
    private let leftKnob: Knob = Knob()
    /// Right knob.
    private let rightKnob: Knob = Knob()
    /// UIView used as marker for selected range progress.
    private let selectedProgressView: UIView = UIView()
    /// UIVIew used as progress bar for left knob.
    private let leftProgressView: UIView = UIView()
    /// UIVIew used as progress bar for right knob.
    private let rightProgressView: UIView = UIView()
    /// Slider delegate.
    public var delegate: RangeUISliderDelegate?
    /// Bar leading offset constraint.
    private var barLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar trailing offset constraint.
    private var barTrailingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar height constraint.
    private var barHeightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        
        //Fake values for interface builder.
        //Used to make visible the progress views.
        self.leftKnob.xPositionConstraint.constant = 40
        self.rightKnob.xPositionConstraint.constant = -40
    }
    
    private func setup() {
        
        self.bar.addSubview(self.leftKnob)
        self.bar.addSubview(self.rightKnob)
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: self.setUpBar())
        constraints.append(contentsOf: self.leftKnob.setup(position: .left,
                                                           width: self.leftKnobWidth,
                                                           height: self.leftKnobHeight,
                                                           target: self,
                                                           selector: #selector(moveLeftKnob)))
        constraints.append(contentsOf: self.rightKnob.setup(position: .right,
                                                            width: self.rightKnobWidth,
                                                            height: self.rightKnobHeight,
                                                            target: self,
                                                            selector: #selector(moveRightKnob)))
        self.setupSelectedProgressView()
        self.setupLeftProgressView()
        self.setupRightProgressView()
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setUpBar() -> [NSLayoutConstraint] {
        
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
        let barConstraints: [NSLayoutConstraint] = [
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
        ]
        
        return barConstraints
    }
    
    // MARK: Progress views.
    
    func setupSelectedProgressView() {
        
        self.selectedProgressView.translatesAutoresizingMaskIntoConstraints = false
        self.selectedProgressView.backgroundColor = self.rangeSelectedColor
        self.bar.addSubview(self.selectedProgressView)
        self.bar.sendSubview(toBack: self.selectedProgressView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.selectedProgressView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.selectedProgressView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.bar,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.selectedProgressView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.leftKnob,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.selectedProgressView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.rightKnob,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0)
            ])
    }
    
    private func setupLeftProgressView() {
        
        self.leftProgressView.translatesAutoresizingMaskIntoConstraints = false
        self.leftProgressView.backgroundColor = self.rangeNotSelectedColor
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
        self.rightProgressView.backgroundColor = self.rangeNotSelectedColor
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
            let positionRightKnob = self.bar.frame.width + self.rightKnob.xPositionConstraint.constant
            
            if positionForKnob >= 0 && positionForKnob <= positionRightKnob {
                
                self.leftKnob.xPositionConstraint.constant = positionForKnob
            }
            
            self.calculateChangeRange()
        }
    }
    
    public final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let xLocationInBar = gestureRecognizer.location(in: self.bar).x
            let positionForKnob = xLocationInBar - self.bar.frame.width
            
            if positionForKnob <= 0 && xLocationInBar >= self.leftKnob.xPositionConstraint.constant {
                
                self.rightKnob.xPositionConstraint.constant = positionForKnob
            }
            
            self.calculateChangeRange()
        }
    }
    
    // MARK: Range selected calculation.
    
    private func calculateChangeRange() {
        
        let minValue = self.leftKnob.xPositionConstraint.constant / self.bar.frame.width
        let maxValue = 1.0  + self.rightKnob.xPositionConstraint.constant / self.bar.frame.width
        let scaledMinValue = self.linearMapping(value: minValue)
        let scaledMaxValue = self.linearMapping(value: maxValue)
        
        self.delegate?.rangeChanged(minValue: scaledMinValue,
                                    maxValue: scaledMaxValue,
                                    sliderIdentifier: self.identifier)
    }
    
    private func linearMapping(value: CGFloat) -> CGFloat {
        
        return value * (self.scaleMaxValue - self.scaleMinValue) + self.scaleMinValue
    }
}

// MARK: Knob

fileprivate enum KnobPosition {
    case left
    case right
}

fileprivate class Knob: UIView {
    
    /// Knob background view.
    private(set) var backgroundView: UIView = UIView()
    /// Knob x position constraint.
    private(set) var xPositionConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Knob width constraint.
    private(set) var widthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Knob height constraint.
    private(set) var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Knob position.
    private(set) var position: KnobPosition = .left
    /// Gesture recognizer target.
    private(set) var gestureRecognizerTarget:Any?
    
    fileprivate func setup(position: KnobPosition,
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
            self.centerConstraint(),
            self.widthConstraint,
            self.heightConstraint
        ]
        
        return knobConstraints + knobBackgroundConstraints
    }
    
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
    
    private func setXPositionConstraint() {
    
        self.xPositionConstraint =  NSLayoutConstraint(item: self,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: self.superview,
                                                       attribute: self.position == .left ? .leading : .trailing,
                                                       multiplier: 1.0,
                                                       constant: 0.0)
    }
    
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
    
    private func centerConstraint() -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: self,
                                  attribute: .centerY,
                                  relatedBy: .equal,
                                  toItem: self.superview,
                                  attribute: .centerY,
                                  multiplier: 1.0,
                                  constant: 1.0)
    }
    
    private func setGestureRecognizer(withTarget target: Any?, usingSelector selector: Selector) {
        
        let gesture = UIPanGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(gesture)
    }
    
    func setup(image anImage: UIImage?) {
        
        if let image = anImage {
            
            let knobImageView = UIImageView(image: image)
            knobImageView.translatesAutoresizingMaskIntoConstraints = false
            knobImageView.contentMode = .scaleToFill
            self.addSubview(knobImageView)
            
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .centerX,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .centerY,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .centerY,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .width,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: knobImageView,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .height,
                                   multiplier: 1.0,
                                   constant: 0.0)
            ])
        }
    }
}








