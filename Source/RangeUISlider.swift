//
//  RangeUISlider.swift
//
//  Created by Fabrizio Duroni on 25/03/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

/**
 A custom slider with double knob that allow the user to select a range.
 Created using autolayout and IBDesignabled/IBInspectable.
 */
@IBDesignable
@objc public class RangeUISlider: UIView {
    // MARK: Inspectable property
    
    /// Slider identifier.
    @IBInspectable public var identifier: Int = 0
    /// Scale minimum value.
    @IBInspectable public var scaleMinValue: CGFloat = 0.0
    /// Scale maximum value.
    @IBInspectable public var scaleMaxValue: CGFloat = 1.0
    /// Default left knob starting value.
    @IBInspectable public var defaultValueLeftKnob: CGFloat = 0.0
    /// Default right knob starting value.
    @IBInspectable public var defaultValueRightKnob: CGFloat = 1.0
    /// Selected range color.
    @IBInspectable var rangeSelectedColor: UIColor = UIColor.blue {
        didSet {
            selectedProgressView.backgroundColor = rangeSelectedColor
        }
    }
    /// Background range selected strechable image.
    @IBInspectable var rangeSelectedBackgroundImage: UIImage? {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected top edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetTop: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected left edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected bottom edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected right edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetRight: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable var rangeSelectedGradientColor1: UIColor? {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                                  secondColor: rangeSelectedGradientColor2,
                                                  startPoint: rangeSelectedGradientStartPoint,
                                                  endPoint: rangeSelectedGradientEndPoint,
                                                  cornerRadius: 0.0)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var rangeSelectedGradientColor2: UIColor? {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                                  secondColor: rangeSelectedGradientColor2,
                                                  startPoint: rangeSelectedGradientStartPoint,
                                                  endPoint: rangeSelectedGradientEndPoint,
                                                  cornerRadius: 0.0)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var rangeSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                                  secondColor: rangeSelectedGradientColor2,
                                                  startPoint: rangeSelectedGradientStartPoint,
                                                  endPoint: rangeSelectedGradientEndPoint,
                                                  cornerRadius: 0.0)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var rangeSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                                  secondColor: rangeSelectedGradientColor2,
                                                  startPoint: rangeSelectedGradientStartPoint,
                                                  endPoint: rangeSelectedGradientEndPoint,
                                                  cornerRadius: 0.0)
        }
    }
    /// Not selected range color.
    @IBInspectable var rangeNotSelectedColor: UIColor = UIColor.lightGray {
        didSet {
            leftProgressView.backgroundColor = rangeNotSelectedColor
            rightProgressView.backgroundColor = rangeNotSelectedColor
        }
    }
    /// Background range selected strechable image.
    @IBInspectable var rangeNotSelectedBackgroundImage: UIImage? {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected top edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetTop: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected left edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected bottom edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected right edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetRight: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable var rangeNotSelectedGradientColor1: UIColor? {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var rangeNotSelectedGradientColor2: UIColor? {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var rangeNotSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var rangeNotSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Left knob width.
    @IBInspectable var leftKnobWidth: CGFloat = 30.0 {
        didSet {
            leftKnob.widthConstraint.constant = leftKnobWidth
        }
    }
    /// Left knob height.
    @IBInspectable var leftKnobHeight: CGFloat = 30.0 {
        didSet {
            leftKnob.heightConstraint.constant = leftKnobHeight
        }
    }
    /// Left knob corners.
    @IBInspectable var leftKnobCorners: CGFloat = 15.0 {
        didSet {
            leftKnob.backgroundView.layer.cornerRadius = leftKnobCorners
            leftKnob.backgroundView.layer.masksToBounds = leftKnobCorners > 0.0
        }
    }
    /// Left knob image.
    @IBInspectable var leftKnobImage: UIImage? {
        didSet {
            leftKnob.add(image: leftKnobImage)
        }
    }
    /// Left knob color.
    @IBInspectable var leftKnobColor: UIColor = UIColor.gray {
        didSet {
            leftKnob.backgroundView.backgroundColor = leftKnobColor
        }
    }
    /// Left knob shadow opacity.
    @IBInspectable var leftShadowOpacity: Float = 0.0 {
        didSet {
            leftKnob.layer.shadowOpacity = leftShadowOpacity
        }
    }
    /// Left knob shadow color.
    @IBInspectable var leftShadowColor: UIColor = UIColor.clear {
        didSet {
            leftKnob.layer.shadowColor = leftShadowColor.cgColor
        }
    }
    /// Left knob shadow offset.
    @IBInspectable var leftShadowOffset: CGSize = CGSize() {
        didSet {
            leftKnob.layer.shadowOffset = leftShadowOffset
        }
    }
    /// Left knob shadow radius.
    @IBInspectable var leftShadowRadius: CGFloat = 0 {
        didSet {
            leftKnob.layer.shadowRadius = leftShadowRadius
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable var leftKnobGradientColor1: UIColor? {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                      secondColor: leftKnobGradientColor2,
                                      startPoint: leftKnobGradientStartPoint,
                                      endPoint: leftKnobGradientEndPoint,
                                      cornerRadius: leftKnobCorners)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var leftKnobGradientColor2: UIColor? {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                      secondColor: leftKnobGradientColor2,
                                      startPoint: leftKnobGradientStartPoint,
                                      endPoint: leftKnobGradientEndPoint,
                                      cornerRadius: leftKnobCorners)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var leftKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                      secondColor: leftKnobGradientColor2,
                                      startPoint: leftKnobGradientStartPoint,
                                      endPoint: leftKnobGradientEndPoint,
                                      cornerRadius: leftKnobCorners)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var leftKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                      secondColor: leftKnobGradientColor2,
                                      startPoint: leftKnobGradientStartPoint,
                                      endPoint: leftKnobGradientEndPoint,
                                      cornerRadius: leftKnobCorners)
        }
    }
    /// Left knob border width.
    @IBInspectable var leftKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            leftKnob.addBorders(usingColor: leftKnobBorderColor,
                                     andWidth: leftKnobBorderWidth,
                                     andCorners: leftKnobCorners)
        }
    }
    /// Left knob border color.
    @IBInspectable var leftKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            leftKnob.addBorders(usingColor: leftKnobBorderColor,
                                     andWidth: leftKnobBorderWidth,
                                     andCorners: leftKnobCorners)
        }
    }
    /// Right knob width.
    @IBInspectable var rightKnobWidth: CGFloat = 30.0 {
        didSet {
            rightKnob.widthConstraint.constant = rightKnobWidth
        }
    }
    /// Right knob height.
    @IBInspectable var rightKnobHeight: CGFloat = 30.0 {
        didSet {
            rightKnob.heightConstraint.constant = rightKnobHeight
        }
    }
    /// Right knob corners.
    @IBInspectable var rightKnobCorners: CGFloat = 15.0 {
        didSet {
            rightKnob.backgroundView.layer.cornerRadius = rightKnobCorners
            rightKnob.backgroundView.layer.masksToBounds = rightKnobCorners > 0.0
        }
    }
    /// Right knob image.
    @IBInspectable var rightKnobImage: UIImage? {
        didSet {
            rightKnob.add(image: rightKnobImage)
        }
    }
    /// Right knob color.
    @IBInspectable var rightKnobColor: UIColor = UIColor.gray {
        didSet {
            rightKnob.backgroundView.backgroundColor = rightKnobColor
        }
    }
    /// Right knob shadow opacity.
    @IBInspectable var rightShadowOpacity: Float = 0.0 {
        didSet {
            rightKnob.layer.shadowOpacity = rightShadowOpacity
        }
    }
    /// Right knob shadow color.
    @IBInspectable var rightShadowColor: UIColor = UIColor.clear {
        didSet {
            rightKnob.layer.shadowColor = rightShadowColor.cgColor
        }
    }
    /// Right knob shadow offset.
    @IBInspectable var rightShadowOffset: CGSize = CGSize() {
        didSet {
            rightKnob.layer.shadowOffset = rightShadowOffset
        }
    }
    /// Right knob shadow radius.
    @IBInspectable var rightShadowRadius: CGFloat = 0 {
        didSet {
            rightKnob.layer.shadowRadius = rightShadowRadius
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable var rightKnobGradientColor1: UIColor? {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                       secondColor: rightKnobGradientColor2,
                                       startPoint: rightKnobGradientStartPoint,
                                       endPoint: rightKnobGradientEndPoint,
                                       cornerRadius: rightKnobCorners)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var rightKnobGradientColor2: UIColor? {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                       secondColor: rightKnobGradientColor2,
                                       startPoint: rightKnobGradientStartPoint,
                                       endPoint: rightKnobGradientEndPoint,
                                       cornerRadius: rightKnobCorners)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var rightKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                       secondColor: rightKnobGradientColor2,
                                       startPoint: rightKnobGradientStartPoint,
                                       endPoint: rightKnobGradientEndPoint,
                                       cornerRadius: rightKnobCorners)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var rightKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                       secondColor: rightKnobGradientColor2,
                                       startPoint: rightKnobGradientStartPoint,
                                       endPoint: rightKnobGradientEndPoint,
                                       cornerRadius: rightKnobCorners)
        }
    }
    /// Right knob border width.
    @IBInspectable var rightKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            rightKnob.addBorders(usingColor: rightKnobBorderColor,
                                      andWidth: rightKnobBorderWidth,
                                      andCorners: rightKnobCorners)
        }
    }
    /// Right knob border color.
    @IBInspectable var rightKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            rightKnob.addBorders(usingColor: rightKnobBorderColor,
                                      andWidth: rightKnobBorderWidth,
                                      andCorners: rightKnobCorners)
        }
    }
    /// Bar height.
    @IBInspectable var barHeight: CGFloat = 15.0 {
        didSet {
            bar.heightConstraint.constant = barHeight
        }
    }
    /// Bar leading offset.
    @IBInspectable var barLeading: CGFloat = 20.0 {
        didSet {
            bar.leadingConstraint.constant = barLeading
        }
    }
    /// Bar trailing offset.
    @IBInspectable var barTrailing: CGFloat = 20.0 {
        didSet {
            bar.trailingConstraint.constant = -barTrailing
        }
    }
    /// Bar corners.
    @IBInspectable var barCorners: CGFloat = 0.0 {
        didSet {
            leftProgressView.layer.cornerRadius = barCorners
            rightProgressView.layer.cornerRadius = barCorners
            addGradientToNotSelectedRangeIfNeeded()
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Bar shadow opacity.
    @IBInspectable var barShadowOpacity: Float = 0.0 {
        didSet {
            bar.layer.shadowOpacity = barShadowOpacity
        }
    }
    /// Bar shadow color.
    @IBInspectable var barShadowColor: UIColor = UIColor.clear {
        didSet {
            bar.layer.shadowColor = barShadowColor.cgColor
        }
    }
    /// Bar shadow offset.
    @IBInspectable var barShadowOffset: CGSize = CGSize() {
        didSet {
            bar.layer.shadowOffset = barShadowOffset
        }
    }
    /// Bar shadow radius.
    @IBInspectable var barShadowRadius: CGFloat = 0.0 {
        didSet {
            bar.layer.shadowRadius = barShadowRadius
        }
    }
    /// Bar border color.
    @IBInspectable var barBorderWidth: CGFloat = 0.0 {
        didSet {
            leftProgressView.layer.borderWidth = barBorderWidth
            rightProgressView.layer.borderWidth = barBorderWidth
            selectedProgressView.layer.borderWidth = barBorderWidth
        }
    }
    /// Bar border color.
    @IBInspectable var barBorderColor: UIColor = UIColor.clear {
        didSet {
            leftProgressView.layer.borderColor = barBorderColor.cgColor
            rightProgressView.layer.borderColor = barBorderColor.cgColor
            selectedProgressView.layer.borderColor = barBorderColor.cgColor
        }
    }
    /// Container corners.
    @IBInspectable var containerCorners: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = containerCorners
            layer.masksToBounds = containerCorners > 0.0
        }
    }
    
    // MARK: Instance property
    
    /// SliderBar component.
    private let bar: Bar = Bar()
    /// Left knob.
    private let leftKnob: Knob = Knob()
    /// Right knob.
    private let rightKnob: Knob = Knob()
    /// UIView used as marker for selected range progress.
    private let selectedProgressView: Progress = Progress()
    /// UIVIew used as progress bar for left knob.
    private let leftProgressView: Progress = Progress()
    /// UIVIew used as progress bar for right knob.
    private let rightProgressView: Progress = Progress()
    /// Slider delegate.
    public weak var delegate: RangeUISliderDelegate?
    
    /**
     Standard init using coder.
     
     - parameter aDecoder: the decoder used to init the sliders.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /**
     Standard init using a CGRect.
     
     - parameter frame: the frame used to init the slider.
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /**
     Method used to prepare fake values for interface builder preview.
     */
    public override func prepareForInterfaceBuilder() {
        //Fake values for interface builder.
        //Used to make visible the progress views.
        leftKnob.xPositionConstraint.constant = 40
        rightKnob.xPositionConstraint.constant = -40
    }
    
    /**
     Method used to layout precisely the subview.
     Used here to set the starting values of the knob.
     */
    public override func layoutSubviews() {
        super.layoutSubviews()
        let totalRange = scaleMaxValue - scaleMinValue
        let minValue = (defaultValueLeftKnob - scaleMinValue) / totalRange
        let maxValue = (defaultValueRightKnob - scaleMinValue) / totalRange
        leftKnob.xPositionConstraint.constant = bar.frame.width * minValue
        rightKnob.xPositionConstraint.constant = (bar.frame.width * maxValue) - bar.frame.width
    }
    
    /**
     Method used to setup all the range slider components. All its subviews and the related constraints are added in
     this method. All the compoents returns arrays of constrains that are activated in a single call to
     NSLayoutConstraint.activate(constraints) (to improve preformance).
     */
    private func setup() {
        addSubview(bar)
        bar.addSubview(selectedProgressView)
        bar.addSubview(leftProgressView)
        bar.addSubview(rightProgressView)
        bar.addSubview(leftKnob)
        bar.addSubview(rightKnob)
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints.append(contentsOf: bar.setup(leftKnob: leftKnob,
                                                      rightKnob: rightKnob,
                                                      leading: barLeading,
                                                      trailing: barTrailing,
                                                      height: barHeight))

        
        constraints.append(contentsOf: rightKnob.setup(position: .right,
                                                            width: rightKnobWidth,
                                                            height: rightKnobHeight,
                                                            target: self,
                                                            selector: #selector(moveRightKnob)))
        
        constraints.append(contentsOf: leftKnob.setup(position: .left,
                                                           width: leftKnobWidth,
                                                           height: leftKnobHeight,
                                                           target: self,
                                                           selector: #selector(moveLeftKnob)))

        constraints.append(contentsOf: selectedProgressView.setup(leftAnchorView: leftKnob,
                                                                       leftAnchorConstraintAttribute: .centerX,
                                                                       rightAnchorView: rightKnob,
                                                                       rightAnchorConstraintAttribute:  .centerX,
                                                                       color: rangeSelectedColor))
        
        constraints.append(contentsOf: leftProgressView.setup(leftAnchorView: bar,
                                                                   leftAnchorConstraintAttribute: .leading,
                                                                   rightAnchorView: leftKnob,
                                                                   rightAnchorConstraintAttribute: .centerX,
                                                                   color: rangeNotSelectedColor))
        
        constraints.append(contentsOf: rightProgressView.setup(leftAnchorView: rightKnob,
                                                                    leftAnchorConstraintAttribute: .centerX,
                                                                    rightAnchorView: bar,
                                                                    rightAnchorConstraintAttribute: .trailing,
                                                                    color: rangeNotSelectedColor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /**
     Add a gradient layer to the not selected range views.
     */
    private func addGradientToNotSelectedRangeIfNeeded() {
        leftProgressView.addGradient(firstColor: rangeNotSelectedGradientColor1,
                                          secondColor: rangeNotSelectedGradientColor2,
                                          startPoint: rangeNotSelectedGradientStartPoint,
                                          endPoint: rangeNotSelectedGradientEndPoint,
                                          cornerRadius: barCorners)
        rightProgressView.addGradient(firstColor: rangeNotSelectedGradientColor1,
                                           secondColor: rangeNotSelectedGradientColor2,
                                           startPoint: rangeNotSelectedGradientStartPoint,
                                           endPoint: rangeNotSelectedGradientEndPoint,
                                           cornerRadius: barCorners)
    }
    
    /**
     Add a background image to the range not selected views.
     */
    func addBackgroundToRangeNotSelectedIfNeeded() {
        if let backgroundImage = rangeNotSelectedBackgroundImage {
            let edgeInset = UIEdgeInsets(top: rangeNotSelectedBackgroundEdgeInsetTop,
                                         left: rangeNotSelectedBackgroundEdgeInsetLeft,
                                         bottom: rangeNotSelectedBackgroundEdgeInsetBottom,
                                         right: rangeNotSelectedBackgroundEdgeInsetRight)
            leftProgressView.addBackground(usingImage: backgroundImage,
                                                andEdgeInset: edgeInset,
                                                andCorners: barCorners)
            rightProgressView.addBackground(usingImage: backgroundImage,
                                                 andEdgeInset: edgeInset,
                                                 andCorners: barCorners)
        }
    }
    
    /**
     Add a background image to the range selected views.
     */
    private func addBackgroundToRangeSelected() {
        if let backgroundImage = rangeSelectedBackgroundImage {
            let edgeInset = UIEdgeInsets(top: rangeSelectedBackgroundEdgeInsetTop,
                                         left: rangeSelectedBackgroundEdgeInsetLeft,
                                         bottom: rangeSelectedBackgroundEdgeInsetBottom,
                                         right: rangeSelectedBackgroundEdgeInsetRight)
            selectedProgressView.addBackground(usingImage: backgroundImage,
                                                    andEdgeInset: edgeInset,
                                                    andCorners: barCorners)
        }
    }
    
    // MARK: Gesture recognizer methods (knobs movements)
    
    /**
     Method used to respond to the gesture recognizer attached on the left knob.
     
     - parameter gestureRecognizer: the gesture recognizer that uses this method as selector.
     */
    @objc public final func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let positionForKnob = gestureRecognizer.location(in: bar).x
            let positionRightKnob = bar.frame.width + rightKnob.xPositionConstraint.constant
            if positionForKnob >= 0 && positionForKnob <= positionRightKnob {
                leftKnob.xPositionConstraint.constant = positionForKnob
            }
            rangeUpdate()
        }
        if gestureRecognizer.state == .ended {
            rangeSelected()
        }
    }
    
    /**
     Method used to respond to the gesture recognizer attached on the right knob.
     
     - parameter gestureRecognizer: the gesture recognizer that uses this method as selector.
     */
    @objc public final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let xLocationInBar = gestureRecognizer.location(in: bar).x
            let positionForKnob = xLocationInBar - bar.frame.width
            if positionForKnob <= 0 && xLocationInBar >= leftKnob.xPositionConstraint.constant {
                rightKnob.xPositionConstraint.constant = positionForKnob
            }
            rangeUpdate()
        }
        if gestureRecognizer.state == .ended {
            rangeSelected()
        }
    }
    
    // MARK: Range selected calculation.
    
    /**
     Method used to calculate the range selected during updates (moving knobs).
     The selection is adapted to the custom scale eventually setted.
     */
    private func rangeUpdate() {
        let rangeValues = calculateRangeSelected()
        delegate?.rangeIsChanging?(minValueSelected: rangeValues.minValue,
                                        maxValueSelected: rangeValues.maxValue,
                                        slider: self)
    }
    
    /**
     Method used to calculate the range selected after updates (moving knobs).
     The selection is adapted to the custom scale eventually setted.
     */
    func rangeSelected() {
        let rangeValues = calculateRangeSelected()
        delegate?.rangeChangeFinished(minValueSelected: rangeValues.minValue,
                                           maxValueSelected: rangeValues.maxValue,
                                           slider: self)
    }
    
    /**
     Calculate range selected based on knob position and scale.
     
     - returns: min and max values selected.
     */
    private func calculateRangeSelected() -> (minValue: CGFloat, maxValue: CGFloat) {
        let minValue = leftKnob.xPositionConstraint.constant / bar.frame.width
        let maxValue = 1.0  + rightKnob.xPositionConstraint.constant / bar.frame.width
        let scaledMinValue = linearMapping(value: minValue)
        let scaledMaxValue = linearMapping(value: maxValue)
        return (minValue: scaledMinValue, maxValue: scaledMaxValue)
    }
    
    /**
     Linear mapping of a values. A simple equation of a straight line. "Nothing to see", no need for more complex
     interpolation here (good old times, when I was studying interpolation in Perlin noise..I miss you... :D).
     
     - parameter value: value to be mapped.
     
     - returns: the mapped value.
     */
    private func linearMapping(value: CGFloat) -> CGFloat {
        return value * (scaleMaxValue - scaleMinValue) + scaleMinValue
    }
}
