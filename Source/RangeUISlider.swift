//
//  RangeUISlider.swift
//
//  Created by Fabrizio Duroni on 25/03/2017.
//  2017 Fabrizio Duroni.
//

// swiftlint:disable type_body_length
// swiftlint:disable identifier_name
// swiftlint:disable file_length

import Foundation
import UIKit

/**
 A custom slider with two knobs that allow the user to select a range.
 RangeUISlider has been created using Autolayout. It is an IBDesignable UIVIew and all its properties are IBInspectable.
 RangeUISlider support RTL (right to left) languages automatically out of the box.
 */
@IBDesignable
open class RangeUISlider: UIView {
    /// Slider identifier.
    @IBInspectable public var identifier: Int = 0
    /// Step increment value. If different from 0 RangeUISlider will let the user drag by step increment.
    @IBInspectable public var stepIncrement: CGFloat = 0.0
    /// Default left knob starting value.
    @IBInspectable public var defaultValueLeftKnob: CGFloat = 0.0
    /// Default right knob starting value.
    @IBInspectable public var defaultValueRightKnob: CGFloat = 1.0
    /// Scale minimum value.
    @IBInspectable public var scaleMinValue: CGFloat = 0.0 {
        didSet {
            calculateScale()
        }
    }
    /// Scale maximum value.
    @IBInspectable public var scaleMaxValue: CGFloat = 1.0 {
        didSet {
            calculateScale()
        }
    }
    /// Selected range color.
    @IBInspectable public var rangeSelectedColor: UIColor = UIColor.blue {
        didSet {
            selectedProgressView.backgroundColor = rangeSelectedColor
        }
    }
    /// Background range selected strechable image.
    @IBInspectable public var rangeSelectedBackgroundImage: UIImage? {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected top edge insect for background image.
    @IBInspectable public var rangeSelectedBackgroundEdgeInsetTop: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected left edge insect for background image.
    @IBInspectable public var rangeSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected bottom edge insect for background image.
    @IBInspectable public var rangeSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Background range selected right edge insect for background image.
    @IBInspectable public var rangeSelectedBackgroundEdgeInsetRight: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeSelected()
        }
    }
    /// Gradient color 1 for range selected.
    @IBInspectable public var rangeSelectedGradientColor1: UIColor? {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                             secondColor: rangeSelectedGradientColor2,
                                             startPoint: rangeSelectedGradientStartPoint,
                                             endPoint: rangeSelectedGradientEndPoint,
                                             cornerRadius: 0.0)
        }
    }
    /// Gradient color 2 for range selected.
    @IBInspectable public var rangeSelectedGradientColor2: UIColor? {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                             secondColor: rangeSelectedGradientColor2,
                                             startPoint: rangeSelectedGradientStartPoint,
                                             endPoint: rangeSelectedGradientEndPoint,
                                             cornerRadius: 0.0)
        }
    }
    /// Gradient start point for selected range.
    @IBInspectable public var rangeSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                             secondColor: rangeSelectedGradientColor2,
                                             startPoint: rangeSelectedGradientStartPoint,
                                             endPoint: rangeSelectedGradientEndPoint,
                                             cornerRadius: 0.0)
        }
    }
    /// Gradient end point for selected range.
    @IBInspectable public var rangeSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            selectedProgressView.addGradient(firstColor: rangeSelectedGradientColor1,
                                             secondColor: rangeSelectedGradientColor2,
                                             startPoint: rangeSelectedGradientStartPoint,
                                             endPoint: rangeSelectedGradientEndPoint,
                                             cornerRadius: 0.0)
        }
    }
    /// Not selected range color.
    @IBInspectable public var rangeNotSelectedColor: UIColor = UIColor.lightGray {
        didSet {
            leftProgressView.backgroundColor = rangeNotSelectedColor
            rightProgressView.backgroundColor = rangeNotSelectedColor
        }
    }
    /// Background range selected strechable image.
    @IBInspectable public var rangeNotSelectedBackgroundImage: UIImage? {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected top edge insect for background image.
    @IBInspectable public var rangeNotSelectedBackgroundEdgeInsetTop: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected left edge insect for background image.
    @IBInspectable public var rangeNotSelectedBackgroundEdgeInsetLeft: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected bottom edge insect for background image.
    @IBInspectable public var rangeNotSelectedBackgroundEdgeInsetBottom: CGFloat = 0.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Background range selected right edge insect for background image.
    @IBInspectable public var rangeNotSelectedBackgroundEdgeInsetRight: CGFloat = 5.0 {
        didSet {
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable public var rangeNotSelectedGradientColor1: UIColor? {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable public var rangeNotSelectedGradientColor2: UIColor? {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable public var rangeNotSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable public var rangeNotSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            addGradientToNotSelectedRangeIfNeeded()
        }
    }
    /// Left knob width.
    @IBInspectable public var leftKnobWidth: CGFloat = 30.0 {
        didSet {
            leftKnob.widthConstraint.constant = leftKnobWidth
        }
    }
    /// Left knob height.
    @IBInspectable public var leftKnobHeight: CGFloat = 30.0 {
        didSet {
            leftKnob.heightConstraint.constant = leftKnobHeight
        }
    }
    /// Left knob corners.
    @IBInspectable public var leftKnobCorners: CGFloat = 15.0 {
        didSet {
            leftKnob.backgroundView.layer.cornerRadius = leftKnobCorners
            leftKnob.backgroundView.layer.masksToBounds = leftKnobCorners > 0.0
        }
    }
    /// Left knob image.
    @IBInspectable public var leftKnobImage: UIImage? {
        didSet {
            leftKnob.add(image: leftKnobImage)
        }
    }
    /// Left knob color.
    @IBInspectable public var leftKnobColor: UIColor = UIColor.gray {
        didSet {
            leftKnob.backgroundView.backgroundColor = leftKnobColor
        }
    }
    /// Left knob shadow opacity.
    @IBInspectable public var leftShadowOpacity: Float = 0.0 {
        didSet {
            leftKnob.layer.shadowOpacity = leftShadowOpacity
        }
    }
    /// Left knob shadow color.
    @IBInspectable public var leftShadowColor: UIColor = UIColor.clear {
        didSet {
            leftKnob.layer.shadowColor = leftShadowColor.cgColor
        }
    }
    /// Left knob shadow offset.
    @IBInspectable public var leftShadowOffset: CGSize = CGSize() {
        didSet {
            leftKnob.layer.shadowOffset = leftShadowOffset
        }
    }
    /// Left knob shadow radius.
    @IBInspectable public var leftShadowRadius: CGFloat = 0 {
        didSet {
            leftKnob.layer.shadowRadius = leftShadowRadius
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable public var leftKnobGradientColor1: UIColor? {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                 secondColor: leftKnobGradientColor2,
                                 startPoint: leftKnobGradientStartPoint,
                                 endPoint: leftKnobGradientEndPoint,
                                 cornerRadius: leftKnobCorners)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable public var leftKnobGradientColor2: UIColor? {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                 secondColor: leftKnobGradientColor2,
                                 startPoint: leftKnobGradientStartPoint,
                                 endPoint: leftKnobGradientEndPoint,
                                 cornerRadius: leftKnobCorners)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable public var leftKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                 secondColor: leftKnobGradientColor2,
                                 startPoint: leftKnobGradientStartPoint,
                                 endPoint: leftKnobGradientEndPoint,
                                 cornerRadius: leftKnobCorners)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable public var leftKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            leftKnob.addGradient(firstColor: leftKnobGradientColor1,
                                 secondColor: leftKnobGradientColor2,
                                 startPoint: leftKnobGradientStartPoint,
                                 endPoint: leftKnobGradientEndPoint,
                                 cornerRadius: leftKnobCorners)
        }
    }
    /// Left knob border width.
    @IBInspectable public var leftKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            leftKnob.addBorders(usingColor: leftKnobBorderColor,
                                andWidth: leftKnobBorderWidth,
                                andCorners: leftKnobCorners)
        }
    }
    /// Left knob border color.
    @IBInspectable public var leftKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            leftKnob.addBorders(usingColor: leftKnobBorderColor,
                                andWidth: leftKnobBorderWidth,
                                andCorners: leftKnobCorners)
        }
    }
    /// Right knob width.
    @IBInspectable public var rightKnobWidth: CGFloat = 30.0 {
        didSet {
            rightKnob.widthConstraint.constant = rightKnobWidth
        }
    }
    /// Right knob height.
    @IBInspectable public var rightKnobHeight: CGFloat = 30.0 {
        didSet {
            rightKnob.heightConstraint.constant = rightKnobHeight
        }
    }
    /// Right knob corners.
    @IBInspectable public var rightKnobCorners: CGFloat = 15.0 {
        didSet {
            rightKnob.backgroundView.layer.cornerRadius = rightKnobCorners
            rightKnob.backgroundView.layer.masksToBounds = rightKnobCorners > 0.0
        }
    }
    /// Right knob image.
    @IBInspectable public var rightKnobImage: UIImage? {
        didSet {
            rightKnob.add(image: rightKnobImage)
        }
    }
    /// Right knob color.
    @IBInspectable public var rightKnobColor: UIColor = UIColor.gray {
        didSet {
            rightKnob.backgroundView.backgroundColor = rightKnobColor
        }
    }
    /// Right knob shadow opacity.
    @IBInspectable public var rightShadowOpacity: Float = 0.0 {
        didSet {
            rightKnob.layer.shadowOpacity = rightShadowOpacity
        }
    }
    /// Right knob shadow color.
    @IBInspectable public var rightShadowColor: UIColor = UIColor.clear {
        didSet {
            rightKnob.layer.shadowColor = rightShadowColor.cgColor
        }
    }
    /// Right knob shadow offset.
    @IBInspectable public var rightShadowOffset: CGSize = CGSize() {
        didSet {
            rightKnob.layer.shadowOffset = rightShadowOffset
        }
    }
    /// Right knob shadow radius.
    @IBInspectable public var rightShadowRadius: CGFloat = 0 {
        didSet {
            rightKnob.layer.shadowRadius = rightShadowRadius
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable public var rightKnobGradientColor1: UIColor? {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                  secondColor: rightKnobGradientColor2,
                                  startPoint: rightKnobGradientStartPoint,
                                  endPoint: rightKnobGradientEndPoint,
                                  cornerRadius: rightKnobCorners)
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable public var rightKnobGradientColor2: UIColor? {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                  secondColor: rightKnobGradientColor2,
                                  startPoint: rightKnobGradientStartPoint,
                                  endPoint: rightKnobGradientEndPoint,
                                  cornerRadius: rightKnobCorners)
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable public var rightKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                  secondColor: rightKnobGradientColor2,
                                  startPoint: rightKnobGradientStartPoint,
                                  endPoint: rightKnobGradientEndPoint,
                                  cornerRadius: rightKnobCorners)
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable public var rightKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            rightKnob.addGradient(firstColor: rightKnobGradientColor1,
                                  secondColor: rightKnobGradientColor2,
                                  startPoint: rightKnobGradientStartPoint,
                                  endPoint: rightKnobGradientEndPoint,
                                  cornerRadius: rightKnobCorners)
        }
    }
    /// Right knob border width.
    @IBInspectable public var rightKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            rightKnob.addBorders(usingColor: rightKnobBorderColor,
                                 andWidth: rightKnobBorderWidth,
                                 andCorners: rightKnobCorners)
        }
    }
    /// Right knob border color.
    @IBInspectable public var rightKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            rightKnob.addBorders(usingColor: rightKnobBorderColor,
                                 andWidth: rightKnobBorderWidth,
                                 andCorners: rightKnobCorners)
        }
    }
    /// Bar height.
    @IBInspectable public var barHeight: CGFloat = 15.0 {
        didSet {
            bar.heightConstraint.constant = barHeight
        }
    }
    /// Bar leading offset.
    @IBInspectable public var barLeading: CGFloat = 20.0 {
        didSet {
            bar.leadingConstraint.constant = barLeading
        }
    }
    /// Bar trailing offset.
    @IBInspectable public var barTrailing: CGFloat = 20.0 {
        didSet {
            bar.trailingConstraint.constant = -barTrailing
        }
    }
    /// Bar corners.
    @IBInspectable public var barCorners: CGFloat = 0.0 {
        didSet {
            leftProgressView.layer.cornerRadius = barCorners
            rightProgressView.layer.cornerRadius = barCorners
            addGradientToNotSelectedRangeIfNeeded()
            addBackgroundToRangeNotSelectedIfNeeded()
        }
    }
    /// Bar shadow opacity.
    @IBInspectable public var barShadowOpacity: Float = 0.0 {
        didSet {
            bar.layer.shadowOpacity = barShadowOpacity
        }
    }
    /// Bar shadow color.
    @IBInspectable public var barShadowColor: UIColor = UIColor.clear {
        didSet {
            bar.layer.shadowColor = barShadowColor.cgColor
        }
    }
    /// Bar shadow offset.
    @IBInspectable public var barShadowOffset: CGSize = CGSize() {
        didSet {
            bar.layer.shadowOffset = barShadowOffset
        }
    }
    /// Bar shadow radius.
    @IBInspectable public var barShadowRadius: CGFloat = 0.0 {
        didSet {
            bar.layer.shadowRadius = barShadowRadius
        }
    }
    /// Bar border color.
    @IBInspectable public var barBorderWidth: CGFloat = 0.0 {
        didSet {
            leftProgressView.layer.borderWidth = barBorderWidth
            rightProgressView.layer.borderWidth = barBorderWidth
            selectedProgressView.layer.borderWidth = barBorderWidth
        }
    }
    /// Bar border color.
    @IBInspectable public var barBorderColor: UIColor = UIColor.clear {
        didSet {
            leftProgressView.layer.borderColor = barBorderColor.cgColor
            rightProgressView.layer.borderColor = barBorderColor.cgColor
            selectedProgressView.layer.borderColor = barBorderColor.cgColor
        }
    }
    /// Container corners.
    @IBInspectable public var containerCorners: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = containerCorners
            layer.masksToBounds = containerCorners > 0.0
        }
    }
    /// Slider delegate.
    public weak var delegate: RangeUISliderDelegate?

    private let bar: Bar = Bar()
    private let leftKnob: Knob = Knob()
    private let rightKnob: Knob = Knob()
    private let selectedProgressView: Progress = Progress()
    private let leftProgressView: Progress = Progress()
    private let rightProgressView: Progress = Progress()
    private var previousRangeSelectedValues: RangeSelected = (0, 0)
    private lazy var scale = scaleMaxValue - scaleMinValue
    private lazy var stepCalculator = StepCalculator()
    private lazy var numberOfSteps: CGFloat = stepCalculator.calculateNumberOfSteps(
        scale: scale,
        stepIncrement: stepIncrement
    )
    private lazy var stepWidth: CGFloat = stepCalculator.calculateStepWidth(
        barWidth: bar.frame.width,
        numberOfSteps: numberOfSteps
    )
    private lazy var rangeSelectedCalculator: RangeSelectedCalculator = RangeSelectedCalculator(
        scale: scale,
        scaleMinValue: scaleMinValue
    )

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
     Prepare RangeUISlider to be drawn in Interface Builder.
     */
    open override func prepareForInterfaceBuilder() {
        // Fake values for interface builder.
        // Used to make visible the progress views.
        leftKnob.xPositionConstraint.constant = 40
        rightKnob.xPositionConstraint.constant = -40
    }

    /**
     Custom layout subviews to set the default values for the know of RangeUISlider
     */
    public override func layoutSubviews() {
        super.layoutSubviews()
        leftKnob.xPositionConstraint.constant = calculateLeftKnobPositionFrom(value: defaultValueLeftKnob)
        rightKnob.xPositionConstraint.constant = calculateRightKnobPoitionFrom(value: defaultValueRightKnob)
        previousRangeSelectedValues = rangeSelectedCalculator.calculateRangeSelected(
            leftKnobPosition: leftKnob.xPositionConstraint.constant,
            rightKnobPosition: rightKnob.xPositionConstraint.constant,
            barWidth: bar.frame.width
        )
    }

    /**
     Change the value of the left knob programmatically.
     
     - parameter value: the new value to be assigned to the left knob
     */
    public func changeLeftKnob(value: CGFloat) {
        if isValidForLeftKnob(value: value) {
            leftKnob.xPositionConstraint.constant = calculateLeftKnobPositionFrom(value: value)
            previousRangeSelectedValues = rangeSelectedCalculator.calculateRangeSelected(
                leftKnobPosition: leftKnob.xPositionConstraint.constant,
                rightKnobPosition: rightKnob.xPositionConstraint.constant,
                barWidth: bar.frame.width
            )
            rangeSelectionFinished()
        }
    }

    /**
     Change the value of the right knob programmatically.
     
     - parameter value: the new value to be assigned to the right knob
     */
    public func changeRightKnob(value: CGFloat) {
        if isValidforRightKnob(value: value) {
            rightKnob.xPositionConstraint.constant = calculateRightKnobPoitionFrom(value: value)
            previousRangeSelectedValues = rangeSelectedCalculator.calculateRangeSelected(
                leftKnobPosition: leftKnob.xPositionConstraint.constant,
                rightKnobPosition: rightKnob.xPositionConstraint.constant,
                barWidth: bar.frame.width
            )
            rangeSelectionFinished()
        }
    }

    private func calculateLeftKnobPositionFrom(value: CGFloat) -> CGFloat {
        return bar.frame.width * getMinFrom(value: value)
    }

    private func calculateRightKnobPoitionFrom(value: CGFloat) -> CGFloat {
        return (bar.frame.width * getMaxFrom(value: value)) - bar.frame.width
    }

    private func getMinFrom(value: CGFloat) -> CGFloat {
        return (value - scaleMinValue) / scale
    }

    private func getMaxFrom(value: CGFloat) -> CGFloat {
        return (value - scaleMinValue) / scale
    }

    private func isValidForLeftKnob(value: CGFloat) -> Bool {
        return value > scaleMinValue && value < previousRangeSelectedValues.maxValue
    }

    private func isValidforRightKnob(value: CGFloat) -> Bool {
        return value <= scaleMaxValue && value > previousRangeSelectedValues.minValue
    }

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

        constraints.append(contentsOf: rightKnob.setup(accessibilityIdentifier: "RightKnob",
                                                       position: .right,
                                                       width: rightKnobWidth,
                                                       height: rightKnobHeight,
                                                       target: self,
                                                       selector: #selector(moveRightKnob)))

        constraints.append(contentsOf: leftKnob.setup(accessibilityIdentifier: "LeftKnob",
                                                      position: .left,
                                                      width: leftKnobWidth,
                                                      height: leftKnobHeight,
                                                      target: self,
                                                      selector: #selector(moveLeftKnob)))

        constraints.append(contentsOf: selectedProgressView.setup(leftAnchorView: leftKnob,
                                                                  leftAnchorConstraintAttribute: .centerX,
                                                                  rightAnchorView: rightKnob,
                                                                  rightAnchorConstraintAttribute: .centerX,
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

    private func addBackgroundToRangeNotSelectedIfNeeded() {
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

    private func calculateScale() {
        scale = scaleMaxValue - scaleMinValue
        rangeSelectedCalculator = RangeSelectedCalculator(
            scale: scale,
            scaleMinValue: scaleMinValue
        )
    }

    @objc final func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        recognize(gestureRecognizer: gestureRecognizer, updateKnob: updateLeftKnobPositionUsing)
    }

    @objc final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        recognize(gestureRecognizer: gestureRecognizer, updateKnob: updateRightKnobPositionUsing)
    }

    private func recognize(gestureRecognizer: UIPanGestureRecognizer, updateKnob: (UIPanGestureRecognizer) -> Void) {
        if gestureRecognizer.state == .began {
            rangeSelectionStartedForKnobUsing(gestureRecognizer: gestureRecognizer, updateKnob: updateKnob)
        }
        if gestureRecognizer.state == .changed {
            updateKnobAndRangeUsing(gestureRecognizer: gestureRecognizer, updateKnob: updateKnob)
        }
        if gestureRecognizer.state == .ended {
            rangeSelectionFinished()
        }
    }

    private func rangeSelectionStartedForKnobUsing(gestureRecognizer: UIPanGestureRecognizer,
                                                   updateKnob: (UIPanGestureRecognizer) -> Void) {
        updateKnob(gestureRecognizer)
        delegate?.rangeChangeStarted?()
    }

    private func updateKnobAndRangeUsing(gestureRecognizer: UIPanGestureRecognizer,
                                         updateKnob: (UIPanGestureRecognizer) -> Void) {
        updateKnob(gestureRecognizer)
        rangeSelectionUpdate()
    }

    private func updateLeftKnobPositionUsing(gestureRecognizer: UIPanGestureRecognizer) {
        let userInterfaceDirection = UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
        if userInterfaceDirection == UIUserInterfaceLayoutDirection.rightToLeft {
            let positionForKnob = bar.frame.width - positionForKnobGiven(
                xLocationInBar: gestureRecognizer.location(in: bar).x
            )
            let positionRightKnob = -1 * rightKnob.xPositionConstraint.constant
            if positionForKnob >= 0 && (bar.frame.width - positionForKnob) >= positionRightKnob {
                leftKnob.xPositionConstraint.constant = positionForKnob
            }
        } else {
            let positionForKnob = positionForKnobGiven(xLocationInBar: gestureRecognizer.location(in: bar).x)
            let positionRightKnob = bar.frame.width + rightKnob.xPositionConstraint.constant
            if positionForKnob >= 0 && positionForKnob <= positionRightKnob {
                leftKnob.xPositionConstraint.constant = positionForKnob
            }
        }
    }

    private func updateRightKnobPositionUsing(gestureRecognizer: UIPanGestureRecognizer) {
        let userInterfaceDirection = UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
        if userInterfaceDirection == UIUserInterfaceLayoutDirection.rightToLeft {
            let xLocationInBar = gestureRecognizer.location(in: bar).x
            let positionForKnob = -1 * positionForKnobGiven(xLocationInBar: xLocationInBar)
            if positionForKnob <= 0 && xLocationInBar <= (bar.frame.width - leftKnob.xPositionConstraint.constant) {
                rightKnob.xPositionConstraint.constant = positionForKnob
            }
        } else {
            let xLocationInBar = gestureRecognizer.location(in: bar).x
            let positionForKnob = positionForKnobGiven(xLocationInBar: xLocationInBar - bar.frame.width)
            if positionForKnob <= 0 && xLocationInBar >= leftKnob.xPositionConstraint.constant {
                rightKnob.xPositionConstraint.constant = positionForKnob
            }
        }
    }

    private func positionForKnobGiven(xLocationInBar: CGFloat) -> CGFloat {
        return (xLocationInBar / stepWidth).rounded(FloatingPointRoundingRule.down) * stepWidth
    }

    private func rangeSelectionUpdate() {
        let rangeSelected = rangeSelectedCalculator.calculateRangeSelected(
            leftKnobPosition: leftKnob.xPositionConstraint.constant,
            rightKnobPosition: rightKnob.xPositionConstraint.constant,
            barWidth: bar.frame.width
        )
        if isDifferentFromPreviousRangeSelected(rangeSelected: rangeSelected) {
            delegate?.rangeIsChanging?(minValueSelected: rangeSelected.minValue,
                                       maxValueSelected: rangeSelected.maxValue,
                                       slider: self)
            previousRangeSelectedValues = rangeSelected
        }
    }

    private func isDifferentFromPreviousRangeSelected(rangeSelected: RangeSelected) -> Bool {
        return rangeSelected != previousRangeSelectedValues
    }

    private func rangeSelectionFinished() {
        let rangeSelected = rangeSelectedCalculator.calculateRangeSelected(
            leftKnobPosition: leftKnob.xPositionConstraint.constant,
            rightKnobPosition: rightKnob.xPositionConstraint.constant,
            barWidth: bar.frame.width
        )

        if !rangeSelected.maxValue.isNaN && !rangeSelected.maxValue.isNaN {
            delegate?.rangeChangeFinished(minValueSelected: rangeSelected.minValue,
                                          maxValueSelected: rangeSelected.maxValue,
                                          slider: self)
        }
    }
}
