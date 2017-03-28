//
//  RangeUISlider.swift
//
//  Created by Fabrizio Duroni on 25/03/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

/**
 Protocol used delegate the read of the RangeUISlider data.
 Multiple RangeUISlider could be delegated the same classes and
 identified by the instance returned in the protocol methods.
 */
@objc public protocol RangeUISliderDelegate {
    
    /**
     Calls the delegate when the user change the range by moving the knobs.
     
     - parameter minValueSelected: the minimum value selected.
     - parameter maxValueSelected: the maximum value selected.
     - parameter slider: the slider on which the range has been modified.
     */
    func rangeChanged(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider)
}

/// A custom slider with double knob that allow the user to select a range.
@IBDesignable
@objc public class RangeUISlider: UIView {
    
    // MARK: Inspectable property.
    
    /// Slider identifier.
    @IBInspectable var identifier: Int = 0
    /// Scale minimum value.
    @IBInspectable var scaleMinValue: CGFloat = 0.0
    /// Scale maximum value.
    @IBInspectable var scaleMaxValue: CGFloat = 1.0
    /// Selected range color.
    @IBInspectable var rangeSelectedColor: UIColor = UIColor.blue {
        
        didSet {
            
            self.selectedProgressView.backgroundColor = self.rangeSelectedColor
        }
    }
    /// Not selected range color.
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
            
            self.leftKnob.add(image: self.leftKnobImage)
        }
    }
    /// Left knob color.
    @IBInspectable var leftKnobColor: UIColor = UIColor.gray {
        
        didSet {
            
            self.leftKnob.backgroundView.backgroundColor = self.leftKnobColor
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
            
            self.rightKnob.add(image: self.rightKnobImage)
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
            
            self.bar.heightConstraint.constant = self.barHeight
        }
    }
    /// Bar leading offset.
    @IBInspectable var barLeading: CGFloat = 20.0 {
        
        didSet {
            
            self.bar.leadingConstraint.constant = self.barLeading
        }
    }
    /// Bar trailing offset.
    @IBInspectable var barTrailing: CGFloat = 20.0 {
        
        didSet {
            
            self.bar.trailingConstraint.constant = -self.barTrailing
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
    private let bar: Bar = Bar()
    /// Left knob.
    private let leftKnob: Knob = Knob()
    /// Right knob.
    private let rightKnob: Knob = Knob()
    /// UIView used as marker for selected range progress.
    private let selectedProgressView: ProgressView = ProgressView()
    /// UIVIew used as progress bar for left knob.
    private let leftProgressView: ProgressView = ProgressView()
    /// UIVIew used as progress bar for right knob.
    private let rightProgressView: ProgressView = ProgressView()
    /// Slider delegate.
    public var delegate: RangeUISliderDelegate?
    
    /**
     Standard init using coder.
     
     - parameter aDecoder: the decoder used to init the sliders.
     */
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.setup()
    }
    
    /**
     Standard init using a CGRect.
     
     - parameter frame: the frame used to init the slider.
     */
    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setup()
    }
    
    /**
     Method used to setup all the range slider components.
     All its subviews and the related constraints are added in this method.
     All the compoents returns arrays of constrains that are activated in a
     single call to NSLayoutConstraint.activate(constraints) (to improve 
     preformance).
     */
    private func setup() {
        
        self.addSubview(self.bar)
        self.bar.addSubview(self.selectedProgressView)
        self.bar.addSubview(self.leftProgressView)
        self.bar.addSubview(self.rightProgressView)
        self.bar.addSubview(self.leftKnob)
        self.bar.addSubview(self.rightKnob)
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: self.bar.setup(leading: self.barLeading,
                                                      trailing: self.barTrailing,
                                                      height: self.barHeight))
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
        constraints.append(contentsOf: self.selectedProgressView.setup(leftAnchorView: self.leftKnob,
                                                                       leftAnchorConstraintAttribute: .centerX,
                                                                       rightAnchorView: self.rightKnob,
                                                                       rightAnchorConstraintAttribute:  .centerX,
                                                                       color: self.rangeSelectedColor))
        constraints.append(contentsOf: self.leftProgressView.setup(leftAnchorView: self.bar,
                                                                   leftAnchorConstraintAttribute: .leading,
                                                                   rightAnchorView: self.leftKnob,
                                                                   rightAnchorConstraintAttribute: .centerX,
                                                                   color: self.rangeNotSelectedColor))
        constraints.append(contentsOf: self.rightProgressView.setup(leftAnchorView: self.rightKnob,
                                                                    leftAnchorConstraintAttribute: .centerX,
                                                                    rightAnchorView: self.bar,
                                                                    rightAnchorConstraintAttribute: .trailing,
                                                                    color: self.rangeNotSelectedColor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: Gesture recognizer methods (knobs movements).
    
    /**
     Method used to respond to the gesture recognizer attached on the left knob.
     
     - parameter gestureRecognizer: the gesture recognizer that uses this method as selector.
     */
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
    
    /**
     Method used to respond to the gesture recognizer attached on the right knob.
     
     - parameter gestureRecognizer: the gesture recognizer that uses this method as selector.
     */
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
    
    /**
     Method used to calculate the range selected.
     The selection is adapted to the custom scale eventually setted.
     */
    private func calculateChangeRange() {
        
        let minValue = self.leftKnob.xPositionConstraint.constant / self.bar.frame.width
        let maxValue = 1.0  + self.rightKnob.xPositionConstraint.constant / self.bar.frame.width
        let scaledMinValue = self.linearMapping(value: minValue)
        let scaledMaxValue = self.linearMapping(value: maxValue)
        
        self.delegate?.rangeChanged(minValueSelected: scaledMinValue,
                                    maxValueSelected: scaledMaxValue,
                                    slider: self)
    }
    
    /**
     Execute a linear mapping of the values.
     A simple equation of a straight line, no need for more complex interpolation here
     (good old times, when I was studying interpolation in Perlin noise..I miss you... :D).
     
     - parameter value: value to be mapped.
     
     - returns: the mapped value.
     */
    private func linearMapping(value: CGFloat) -> CGFloat {
        
        return value * (self.scaleMaxValue - self.scaleMinValue) + self.scaleMinValue
    }
}

// MARK: Bar

/// Class used to describe the bar of the slider.
class Bar: UIView {
    
    /// Bar leading offset constraint.
    private(set) var leadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar trailing offset constraint.
    private(set) var trailingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    /// Bar height constraint.
    private(set) var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    /**
     Method used to setup a bar.
     This methods returns all the constraints to be activated.
     
     - parameter leading: the leading constant value to be used when creating the leading constraint.
     - parameter trailing: the trailing constant value to be used when creating the trailing constraint.
     - parameter height: the height constant vallue to be used when creating the height constraint.
     
     - returns: an arrays of constraints to be activated.
     */
    fileprivate func setup(leading: CGFloat, trailing: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
        
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
}

// MARK: Knob

/// Enum used to identify the knob position.
fileprivate enum KnobPosition {
    case left
    case right
}

/// Class used to describe the knobs of the slider.
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
        
        self.xPositionConstraint =  NSLayoutConstraint(item: self,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: self.superview,
                                                       attribute: self.position == .left ? .leading : .trailing,
                                                       multiplier: 1.0,
                                                       constant: 0.0)
    }
    
    /**
     Method used to create the constraints used to manage the width and height 
     of the knob.
     
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
        self.addGestureRecognizer(gesture)
    }
    
    /**
     Method used to add an image on the knob (to use as background).
     
     - parameter anImage: the image to be used as background of the knob.
     */
    fileprivate func add(image anImage: UIImage?) {
        
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

// MARK: Progress 

/// Class used to describe the progress view inside the bar of the range slider.
class ProgressView: UIView {
    
    /**
     Method used to setup the progress view.
     
     - parameter leftAnchorView: the view used as left reference for the progress view constraints.
     - parameter leftAnchorConstraintAttribute: the attribute to be used for constraint used to manage the left margin.
     - parameter rightAnchorView: the view used as rightreference for the progress view constraints.
     - parameter rightAnchorConstraintAttribute: the attribute to be used for constraint used to manage the right margin.
     - parameter color: the background color of the progress view.
     
     - returns: an array of progress view constraints.
     */
    fileprivate func setup(leftAnchorView: UIView,
                           leftAnchorConstraintAttribute: NSLayoutAttribute,
                           rightAnchorView: UIView,
                           rightAnchorConstraintAttribute: NSLayoutAttribute,
                           color: UIColor) -> [NSLayoutConstraint] {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        
        let progressViewConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: self,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: self.superview,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.superview,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: leftAnchorView,
                               attribute: leftAnchorConstraintAttribute,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: rightAnchorView,
                               attribute: rightAnchorConstraintAttribute,
                               multiplier: 1.0,
                               constant: 0.0)
        ]
        
        return progressViewConstraints
    }
}
