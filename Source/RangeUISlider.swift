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
    @IBInspectable var scaleMinValue: CGFloat = 0.0
    /// Scale maximum value.
    @IBInspectable var scaleMaxValue: CGFloat = 1.0
    /// Default left knob starting value.
    @IBInspectable var defaultValueLeftKnob: CGFloat = 0.0
    /// Default right knob starting value.
    @IBInspectable var defaultValueRightKnob: CGFloat = 1.0
    /// Selected range color.
    @IBInspectable var rangeSelectedColor: UIColor = UIColor.blue {
        didSet {
            self.selectedProgressView.backgroundColor = self.rangeSelectedColor
        }
    }
    /// Background range selected strechable image.
    @IBInspectable var rangeSelectedBackgroundImage: UIImage? {
        didSet {
            self.addBackgroundToRangeSelected()
        }
    }
    /// Background range selected top edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetTop: CGFloat = 0.0 {
        didSet {
            self.addBackgroundToRangeSelected()
        }
    }
    /// Background range selected left edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0 {
        didSet {
            self.addBackgroundToRangeSelected()
        }
    }
    /// Background range selected bottom edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0 {
        didSet {
            self.addBackgroundToRangeSelected()
        }
    }
    /// Background range selected right edge insect for background image.
    @IBInspectable var rangeSelectedBackgroundEdgeInsetRight: CGFloat = 5.0 {
        didSet {
            self.addBackgroundToRangeSelected()
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable var rangeSelectedGradientColor1: UIColor? {
        didSet {
            self.selectedProgressView.addGradient(firstColor: self.rangeSelectedGradientColor1,
                                                  secondColor: self.rangeSelectedGradientColor2,
                                                  startPoint: self.rangeSelectedGradientStartPoint,
                                                  endPoint: self.rangeSelectedGradientEndPoint)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var rangeSelectedGradientColor2: UIColor? {
        didSet {
            self.selectedProgressView.addGradient(firstColor: self.rangeSelectedGradientColor1,
                                                  secondColor: self.rangeSelectedGradientColor2,
                                                  startPoint: self.rangeSelectedGradientStartPoint,
                                                  endPoint: self.rangeSelectedGradientEndPoint)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var rangeSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            self.selectedProgressView.addGradient(firstColor: self.rangeSelectedGradientColor1,
                                                  secondColor: self.rangeSelectedGradientColor2,
                                                  startPoint: self.rangeSelectedGradientStartPoint,
                                                  endPoint: self.rangeSelectedGradientEndPoint)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var rangeSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            self.selectedProgressView.addGradient(firstColor: self.rangeSelectedGradientColor1,
                                                  secondColor: self.rangeSelectedGradientColor2,
                                                  startPoint: self.rangeSelectedGradientStartPoint,
                                                  endPoint: self.rangeSelectedGradientEndPoint)
        }
    }
    /// Not selected range color.
    @IBInspectable var rangeNotSelectedColor: UIColor = UIColor.lightGray {
        didSet {
            self.leftProgressView.backgroundColor = self.rangeNotSelectedColor
            self.rightProgressView.backgroundColor = self.rangeNotSelectedColor
        }
    }
    /// Background range selected strechable image.
    @IBInspectable var rangeNotSelectedBackgroundImage: UIImage? {
        didSet {
            self.addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected top edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetTop: CGFloat = 0.0 {
        didSet {
            self.addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected left edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0 {
        didSet {
            self.addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected bottom edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0 {
        didSet {
            self.addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected right edge insect for background image.
    @IBInspectable var rangeNotSelectedBackgroundEdgeInsetRight: CGFloat = 5.0 {
        didSet {
            self.addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable var rangeNotSelectedGradientColor1: UIColor? {
        didSet {
            self.addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var rangeNotSelectedGradientColor2: UIColor? {
        didSet {
            self.addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var rangeNotSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            self.addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var rangeNotSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            self.addGradientToNotSelectedRangeIfNeeded()
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
    /// Gradient color 1 for range not selected.
    @IBInspectable var leftKnobGradientColor1: UIColor? {
        didSet {
            self.leftKnob.addGradient(firstColor: self.leftKnobGradientColor1,
                                      secondColor: self.leftKnobGradientColor2,
                                      startPoint: self.leftKnobGradientStartPoint,
                                      endPoint: self.leftKnobGradientEndPoint,
                                      cornerRadius: self.leftKnobCornes)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var leftKnobGradientColor2: UIColor? {
        didSet {
            self.leftKnob.addGradient(firstColor: self.leftKnobGradientColor1,
                                      secondColor: self.leftKnobGradientColor2,
                                      startPoint: self.leftKnobGradientStartPoint,
                                      endPoint: self.leftKnobGradientEndPoint,
                                      cornerRadius: self.leftKnobCornes)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var leftKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            self.leftKnob.addGradient(firstColor: self.leftKnobGradientColor1,
                                      secondColor: self.leftKnobGradientColor2,
                                      startPoint: self.leftKnobGradientStartPoint,
                                      endPoint: self.leftKnobGradientEndPoint,
                                      cornerRadius: self.leftKnobCornes)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var leftKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            self.leftKnob.addGradient(firstColor: self.leftKnobGradientColor1,
                                      secondColor: self.leftKnobGradientColor2,
                                      startPoint: self.leftKnobGradientStartPoint,
                                      endPoint: self.leftKnobGradientEndPoint,
                                      cornerRadius: self.leftKnobCornes)
        }
    }
    /// Left knob border width.
    @IBInspectable var leftKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            self.leftKnob.addBorders(usingColor: self.leftKnobBorderColor,
                                     andWidth: self.leftKnobBorderWidth,
                                     andCorners: self.leftKnobCornes)
        }
    }
    /// Left knob border color.
    @IBInspectable var leftKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            self.leftKnob.addBorders(usingColor: self.leftKnobBorderColor,
                                     andWidth: self.leftKnobBorderWidth,
                                     andCorners: self.leftKnobCornes)
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
    /// Gradient color 1 for range not selected.
    @IBInspectable var rightKnobGradientColor1: UIColor? {
        didSet {
            self.rightKnob.addGradient(firstColor: self.rightKnobGradientColor1,
                                       secondColor: self.rightKnobGradientColor2,
                                       startPoint: self.rightKnobGradientStartPoint,
                                       endPoint: self.rightKnobGradientEndPoint,
                                       cornerRadius: self.rightKnobCornes)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable var rightKnobGradientColor2: UIColor? {
        didSet {
            self.rightKnob.addGradient(firstColor: self.rightKnobGradientColor1,
                                       secondColor: self.rightKnobGradientColor2,
                                       startPoint: self.rightKnobGradientStartPoint,
                                       endPoint: self.rightKnobGradientEndPoint,
                                       cornerRadius: self.rightKnobCornes)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable var rightKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            self.rightKnob.addGradient(firstColor: self.rightKnobGradientColor1,
                                       secondColor: self.rightKnobGradientColor2,
                                       startPoint: self.rightKnobGradientStartPoint,
                                       endPoint: self.rightKnobGradientEndPoint,
                                       cornerRadius: self.rightKnobCornes)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable var rightKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            self.rightKnob.addGradient(firstColor: self.rightKnobGradientColor1,
                                       secondColor: self.rightKnobGradientColor2,
                                       startPoint: self.rightKnobGradientStartPoint,
                                       endPoint: self.rightKnobGradientEndPoint,
                                       cornerRadius: self.rightKnobCornes)
        }
    }
    /// Right knob border width.
    @IBInspectable var rightKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            self.rightKnob.addBorders(usingColor: self.rightKnobBorderColor,
                                      andWidth: self.rightKnobBorderWidth,
                                      andCorners: self.rightKnobCornes)
        }
    }
    /// Right knob border color.
    @IBInspectable var rightKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            self.rightKnob.addBorders(usingColor: self.rightKnobBorderColor,
                                      andWidth: self.rightKnobBorderWidth,
                                      andCorners: self.rightKnobCornes)
        }
    }
    /// Bar height.
    @IBInspectable var barHeight: CGFloat = 15.0 {
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
    @IBInspectable var barCornes: CGFloat = 0.0 {
        didSet {
            self.leftProgressView.layer.cornerRadius = barCornes
            self.rightProgressView.layer.cornerRadius = barCornes
            self.addGradientToNotSelectedRangeIfNeeded()
            self.addBackgroundToRangeNotSelectedIfNeeded()
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
    @IBInspectable var barShadowRadius: CGFloat = 0.0 {
        didSet {
            self.bar.layer.shadowRadius = self.barShadowRadius
        }
    }
    /// Bar border color.
    @IBInspectable var barBorderWidth: CGFloat = 0.0 {
        didSet {
            self.leftProgressView.layer.borderWidth = self.barBorderWidth
            self.rightProgressView.layer.borderWidth = self.barBorderWidth
            self.selectedProgressView.layer.borderWidth = self.barBorderWidth
        }
    }
    /// Bar border color.
    @IBInspectable var barBorderColor: UIColor = UIColor.clear {
        didSet {
            self.leftProgressView.layer.borderColor = self.barBorderColor.cgColor
            self.rightProgressView.layer.borderColor = self.barBorderColor.cgColor
            self.selectedProgressView.layer.borderColor = self.barBorderColor.cgColor
        }
    }
    /// Container corners.
    @IBInspectable var containerCorners: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.containerCorners
            self.layer.masksToBounds = self.containerCorners > 0.0
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
    private let selectedProgressView: ProgressView = ProgressView()
    /// UIVIew used as progress bar for left knob.
    private let leftProgressView: ProgressView = ProgressView()
    /// UIVIew used as progress bar for right knob.
    private let rightProgressView: ProgressView = ProgressView()
    /// Slider delegate.
    public weak var delegate: RangeUISliderDelegate?
    
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
     Method used to prepare fake values for interface builder preview.
     */
    public override func prepareForInterfaceBuilder() {
        //Fake values for interface builder.
        //Used to make visible the progress views.
        self.leftKnob.xPositionConstraint.constant = 40
        self.rightKnob.xPositionConstraint.constant = -40
    }
    
    /**
     Method used to layout precisely the subview.
     Used here to set the starting values of the knob.
     */
    public override func layoutSubviews() {
        super.layoutSubviews()
        let totalRange = self.scaleMaxValue - self.scaleMinValue
        let minValue = (self.defaultValueLeftKnob - self.scaleMinValue) / totalRange
        let maxValue = (self.defaultValueRightKnob - self.scaleMinValue) / totalRange
        self.leftKnob.xPositionConstraint.constant = self.bar.frame.width * minValue
        self.rightKnob.xPositionConstraint.constant = (self.bar.frame.width * maxValue) - self.bar.frame.width
    }
    
    /**
     Method used to setup all the range slider components. All its subviews and the related constraints are added in
     this method. All the compoents returns arrays of constrains that are activated in a single call to
     NSLayoutConstraint.activate(constraints) (to improve preformance).
     */
    private func setup() {
        self.addSubview(self.bar)
        self.bar.addSubview(self.selectedProgressView)
        self.bar.addSubview(self.leftProgressView)
        self.bar.addSubview(self.rightProgressView)
        self.bar.addSubview(self.leftKnob)
        self.bar.addSubview(self.rightKnob)
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints.append(contentsOf: self.bar.setup(leftKnob: self.leftKnob,
                                                      rightKnob: self.rightKnob,
                                                      leading: self.barLeading,
                                                      trailing: self.barTrailing,
                                                      height: self.barHeight))

        
        constraints.append(contentsOf: self.rightKnob.setup(position: .right,
                                                            width: self.rightKnobWidth,
                                                            height: self.rightKnobHeight,
                                                            target: self,
                                                            selector: #selector(moveRightKnob)))
        
        constraints.append(contentsOf: self.leftKnob.setup(position: .left,
                                                           width: self.leftKnobWidth,
                                                           height: self.leftKnobHeight,
                                                           target: self,
                                                           selector: #selector(moveLeftKnob)))

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
    
    /**
     Add a gradient layer to the not selected range views.
     */
    private func addGradientToNotSelectedRangeIfNeeded() {
        self.leftProgressView.addGradient(firstColor: self.rangeNotSelectedGradientColor1,
                                          secondColor: self.rangeNotSelectedGradientColor2,
                                          startPoint: self.rangeNotSelectedGradientStartPoint,
                                          endPoint: self.rangeNotSelectedGradientEndPoint,
                                          cornerRadius: self.barCornes)
        self.rightProgressView.addGradient(firstColor: self.rangeNotSelectedGradientColor1,
                                           secondColor: self.rangeNotSelectedGradientColor2,
                                           startPoint: self.rangeNotSelectedGradientStartPoint,
                                           endPoint: self.rangeNotSelectedGradientEndPoint,
                                           cornerRadius: self.barCornes)
    }
    
    /**
     Add a background image to the range not selected views.
     */
    func addBackgroundToRangeNotSelectedIfNeeded() {
        if let backgroundImage = self.rangeNotSelectedBackgroundImage {
            let edgeInset = UIEdgeInsets(top: self.rangeNotSelectedBackgroundEdgeInsetTop,
                                         left: self.rangeNotSelectedBackgroundEdgeInsetLeft,
                                         bottom: self.rangeNotSelectedBackgroundEdgeInsetBottom,
                                         right: self.rangeNotSelectedBackgroundEdgeInsetRight)
            self.leftProgressView.addBackground(usingImage: backgroundImage,
                                                andEdgeInset: edgeInset,
                                                andCorners: self.barCornes)
            self.rightProgressView.addBackground(usingImage: backgroundImage,
                                                 andEdgeInset: edgeInset,
                                                 andCorners: self.barCornes)
        }
    }
    
    /**
     Add a background image to the range selected views.
     */
    private func addBackgroundToRangeSelected() {
        if let backgroundImage = self.rangeSelectedBackgroundImage {
            let edgeInset = UIEdgeInsets(top: self.rangeSelectedBackgroundEdgeInsetTop,
                                         left: self.rangeSelectedBackgroundEdgeInsetLeft,
                                         bottom: self.rangeSelectedBackgroundEdgeInsetBottom,
                                         right: self.rangeSelectedBackgroundEdgeInsetRight)
            self.selectedProgressView.addBackground(usingImage: backgroundImage,
                                                    andEdgeInset: edgeInset,
                                                    andCorners: self.barCornes)
        }
    }
    
    // MARK: Gesture recognizer methods (knobs movements)
    
    /**
     Method used to respond to the gesture recognizer attached on the left knob.
     
     - parameter gestureRecognizer: the gesture recognizer that uses this method as selector.
     */
    @objc public final func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let positionForKnob = gestureRecognizer.location(in: self.bar).x
            let positionRightKnob = self.bar.frame.width + self.rightKnob.xPositionConstraint.constant
            if positionForKnob >= 0 && positionForKnob <= positionRightKnob {
                self.leftKnob.xPositionConstraint.constant = positionForKnob
            }
            self.rangeUpdate()
        }
        if gestureRecognizer.state == .ended {
            self.rangeSelected()
        }
    }
    
    /**
     Method used to respond to the gesture recognizer attached on the right knob.
     
     - parameter gestureRecognizer: the gesture recognizer that uses this method as selector.
     */
    @objc public final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let xLocationInBar = gestureRecognizer.location(in: self.bar).x
            let positionForKnob = xLocationInBar - self.bar.frame.width
            if positionForKnob <= 0 && xLocationInBar >= self.leftKnob.xPositionConstraint.constant {
                self.rightKnob.xPositionConstraint.constant = positionForKnob
            }
            self.rangeUpdate()
        }
        if gestureRecognizer.state == .ended {
            self.rangeSelected()
        }
    }
    
    // MARK: Range selected calculation.
    
    /**
     Method used to calculate the range selected during updates (moving knobs).
     The selection is adapted to the custom scale eventually setted.
     */
    private func rangeUpdate() {
        let rangeValues = self.calculateRangeSelected()
        self.delegate?.rangeIsChanging?(minValueSelected: rangeValues.minValue,
                                        maxValueSelected: rangeValues.maxValue,
                                        slider: self)
    }
    
    /**
     Method used to calculate the range selected after updates (moving knobs).
     The selection is adapted to the custom scale eventually setted.
     */
    func rangeSelected() {
        let rangeValues = self.calculateRangeSelected()
        self.delegate?.rangeChangeFinished(minValueSelected: rangeValues.minValue,
                                           maxValueSelected: rangeValues.maxValue,
                                           slider: self)
    }
    
    /**
     Calculate range selected based on knob position and scale.
     
     - returns: min and max values selected.
     */
    private func calculateRangeSelected() -> (minValue: CGFloat, maxValue: CGFloat) {
        let minValue = self.leftKnob.xPositionConstraint.constant / self.bar.frame.width
        let maxValue = 1.0  + self.rightKnob.xPositionConstraint.constant / self.bar.frame.width
        let scaledMinValue = self.linearMapping(value: minValue)
        let scaledMaxValue = self.linearMapping(value: maxValue)
        return (minValue: scaledMinValue, maxValue: scaledMaxValue)
    }
    
    /**
     Linear mapping of a values. A simple equation of a straight line. "Nothing to see", no need for more complex
     interpolation here (good old times, when I was studying interpolation in Perlin noise..I miss you... :D).
     
     - parameter value: value to be mapped.
     
     - returns: the mapped value.
     */
    private func linearMapping(value: CGFloat) -> CGFloat {
        return value * (self.scaleMaxValue - self.scaleMinValue) + self.scaleMinValue
    }
}
