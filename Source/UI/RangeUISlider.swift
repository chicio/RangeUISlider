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
open class RangeUISlider: UIView, ProgrammaticKnobChangeDelegate, KnobGestureManagerDelegate {
    /// Slider identifier.
    @IBInspectable public var identifier: Int = 0
    /// Step increment value. If different from 0 RangeUISlider will let the user drag by step increment.
    @IBInspectable public var stepIncrement: CGFloat = 0.0
    /// Default left knob starting value.
    @IBInspectable public var defaultValueLeftKnob: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    /// Default right knob starting value.
    @IBInspectable public var defaultValueRightKnob: CGFloat = 1.0 {
        didSet {
            setNeedsLayout()
        }
    }
    /// Scale minimum value.
    @IBInspectable public var scaleMinValue: CGFloat = 0.0 {
        didSet {
            setScale()
        }
    }
    /// Scale maximum value.
    @IBInspectable public var scaleMaxValue: CGFloat = 1.0 {
        didSet {
            setScale()
        }
    }
    /// Selected range color.
    @IBInspectable public var rangeSelectedColor: UIColor = UIColor.blue {
        didSet {
            progressViews.selectedProgressView.backgroundColor = rangeSelectedColor
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
            progressViews.selectedProgressView.addGradient(properties: selectedRangeGradientProperties())
        }
    }
    /// Gradient color 2 for range selected.
    @IBInspectable public var rangeSelectedGradientColor2: UIColor? {
        didSet {
            progressViews.selectedProgressView.addGradient(properties: selectedRangeGradientProperties())
        }
    }
    /// Gradient start point for selected range.
    @IBInspectable public var rangeSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            progressViews.selectedProgressView.addGradient(properties: selectedRangeGradientProperties())
        }
    }
    /// Gradient end point for selected range.
    @IBInspectable public var rangeSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            progressViews.selectedProgressView.addGradient(properties: selectedRangeGradientProperties())
        }
    }
    /// Not selected range color.
    @IBInspectable public var rangeNotSelectedColor: UIColor = UIColor.lightGray {
        didSet {
            progressViews.addBackgroundColorToNotSelectedProgressView(rangeNotSelectedColor: rangeNotSelectedColor)
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
            addGradientToNotSelectedRange()
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable public var rangeNotSelectedGradientColor2: UIColor? {
        didSet {
            addGradientToNotSelectedRange()
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable public var rangeNotSelectedGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            addGradientToNotSelectedRange()
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable public var rangeNotSelectedGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            addGradientToNotSelectedRange()
        }
    }
    /// Left knob width.
    @IBInspectable public var leftKnobWidth: CGFloat = 30.0 {
        didSet {
            knobs.leftKnob.widthConstraint.constant = leftKnobWidth
        }
    }
    /// Left knob height.
    @IBInspectable public var leftKnobHeight: CGFloat = 30.0 {
        didSet {
            knobs.leftKnob.heightConstraint.constant = leftKnobHeight
        }
    }
    /// Left knob corners.
    @IBInspectable public var leftKnobCorners: CGFloat = 15.0 {
        didSet {
            knobs.addCornersToLeftKnob(leftKnobCorners: leftKnobCorners)
        }
    }
    /// Left knob image.
    @IBInspectable public var leftKnobImage: UIImage? {
        didSet {
            knobs.leftKnob.add(image: leftKnobImage)
        }
    }
    /// Left knob color.
    @IBInspectable public var leftKnobColor: UIColor = UIColor.gray {
        didSet {
            knobs.leftKnob.backgroundView.backgroundColor = leftKnobColor
        }
    }
    /// Left knob shadow opacity.
    @IBInspectable public var leftShadowOpacity: Float = 0.0 {
        didSet {
            knobs.leftKnob.layer.shadowOpacity = leftShadowOpacity
        }
    }
    /// Left knob shadow color.
    @IBInspectable public var leftShadowColor: UIColor = UIColor.clear {
        didSet {
            knobs.leftKnob.layer.shadowColor = leftShadowColor.cgColor
        }
    }
    /// Left knob shadow offset.
    @IBInspectable public var leftShadowOffset: CGSize = CGSize() {
        didSet {
            knobs.leftKnob.layer.shadowOffset = leftShadowOffset
        }
    }
    /// Left knob shadow radius.
    @IBInspectable public var leftShadowRadius: CGFloat = 0 {
        didSet {
            knobs.leftKnob.layer.shadowRadius = leftShadowRadius
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable public var leftKnobGradientColor1: UIColor? {
        didSet {
            knobs.leftKnob.addGradient(properties: leftKnobGradientProperties())
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable public var leftKnobGradientColor2: UIColor? {
        didSet {
            knobs.leftKnob.addGradient(properties: leftKnobGradientProperties())
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable public var leftKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            knobs.leftKnob.addGradient(properties: leftKnobGradientProperties())
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable public var leftKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            knobs.leftKnob.addGradient(properties: leftKnobGradientProperties())
        }
    }
    /// Left knob border width.
    @IBInspectable public var leftKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            knobs.leftKnob.addBorders(usingColor: leftKnobBorderColor,
                                andWidth: leftKnobBorderWidth,
                                andCorners: leftKnobCorners)
        }
    }
    /// Left knob border color.
    @IBInspectable public var leftKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            knobs.leftKnob.addBorders(usingColor: leftKnobBorderColor,
                                andWidth: leftKnobBorderWidth,
                                andCorners: leftKnobCorners)
        }
    }
    /// Right knob width.
    @IBInspectable public var rightKnobWidth: CGFloat = 30.0 {
        didSet {
            knobs.rightKnob.widthConstraint.constant = rightKnobWidth
        }
    }
    /// Right knob height.
    @IBInspectable public var rightKnobHeight: CGFloat = 30.0 {
        didSet {
            knobs.rightKnob.heightConstraint.constant = rightKnobHeight
        }
    }
    /// Right knob corners.
    @IBInspectable public var rightKnobCorners: CGFloat = 15.0 {
        didSet {
            knobs.addCornersToRightKnob(rightKnobCorners: rightKnobCorners)
        }
    }
    /// Right knob image.
    @IBInspectable public var rightKnobImage: UIImage? {
        didSet {
            knobs.rightKnob.add(image: rightKnobImage)
        }
    }
    /// Right knob color.
    @IBInspectable public var rightKnobColor: UIColor = UIColor.gray {
        didSet {
            knobs.rightKnob.backgroundView.backgroundColor = rightKnobColor
        }
    }
    /// Right knob shadow opacity.
    @IBInspectable public var rightShadowOpacity: Float = 0.0 {
        didSet {
            knobs.rightKnob.layer.shadowOpacity = rightShadowOpacity
        }
    }
    /// Right knob shadow color.
    @IBInspectable public var rightShadowColor: UIColor = UIColor.clear {
        didSet {
            knobs.rightKnob.layer.shadowColor = rightShadowColor.cgColor
        }
    }
    /// Right knob shadow offset.
    @IBInspectable public var rightShadowOffset: CGSize = CGSize() {
        didSet {
            knobs.rightKnob.layer.shadowOffset = rightShadowOffset
        }
    }
    /// Right knob shadow radius.
    @IBInspectable public var rightShadowRadius: CGFloat = 0 {
        didSet {
            knobs.rightKnob.layer.shadowRadius = rightShadowRadius
        }
    }
    /// Gradient color 1 for range not selected.
    @IBInspectable public var rightKnobGradientColor1: UIColor? {
        didSet {
            knobs.rightKnob.addGradient(properties: rightKnobGradientProperties())
        }
    }
    /// Gradient color 2 for range not selected.
    @IBInspectable public var rightKnobGradientColor2: UIColor? {
        didSet {
            knobs.rightKnob.addGradient(properties: rightKnobGradientProperties())
        }
    }
    /// Gradient start point for not selected range.
    @IBInspectable public var rightKnobGradientStartPoint: CGPoint = CGPoint() {
        didSet {
            knobs.rightKnob.addGradient(properties: rightKnobGradientProperties())
        }
    }
    /// Gradient end point for not selected range.
    @IBInspectable public var rightKnobGradientEndPoint: CGPoint = CGPoint() {
        didSet {
            knobs.rightKnob.addGradient(properties: rightKnobGradientProperties())
        }
    }
    /// Right knob border width.
    @IBInspectable public var rightKnobBorderWidth: CGFloat = 0.0 {
        didSet {
            knobs.rightKnob.addBorders(
                usingColor: rightKnobBorderColor,
                andWidth: rightKnobBorderWidth,
                andCorners: rightKnobCorners
            )
        }
    }
    /// Right knob border color.
    @IBInspectable public var rightKnobBorderColor: UIColor = UIColor.clear {
        didSet {
            knobs.rightKnob.addBorders(
                usingColor: rightKnobBorderColor,
                andWidth: rightKnobBorderWidth,
                andCorners: rightKnobCorners
            )
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
            progressViews.addBarCornersToNotSelectedProgressView(barCorners: barCorners)
            addGradientToNotSelectedRange()
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
            progressViews.addBordersWidth(borderWidth: barBorderWidth)
        }
    }
    /// Bar border color.
    @IBInspectable public var barBorderColor: UIColor = UIColor.clear {
        didSet {
            progressViews.addBorderColor(borderColor: barBorderColor)
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
    private let knobs: Knobs = Knobs(leftKnob: Knob(), rightKnob: Knob())
    private let progressViews: ProgressViews = ProgressViews(
        selectedProgressView: Progress(),
        leftProgressView: Progress(),
        rightProgressView: Progress()
    )

    internal lazy var previousRangeSelected: RangeSelected = RangeSelected(
        minValue: defaultValueLeftKnob,
        maxValue: defaultValueRightKnob
    )
    internal lazy var scale: Scale = Scale(scaleMinValue: scaleMinValue, scaleMaxValue: scaleMaxValue)
    private lazy var programmaticKnobChange: ProgrammaticKnobChange = ProgrammaticKnobChange(
        bar: bar,
        knobs: knobs,
        delegate: self
    )
    private lazy var knobGestureManager: KnobGestureManager = KnobGestureManager(
        bar: bar,
        knobs: knobs,
        knobGestureManagerDelegate: self
    )
    private lazy var rangeSelectedCalculator: RangeSelectedCalculator = RangeSelectedCalculator()

    // MARK: init

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

    // MARK: views lifecycle

    /**
     Prepare RangeUISlider to be drawn in Interface Builder.
     */
    open override func prepareForInterfaceBuilder() {
        // Fake values for interface builder.
        // Used to make visible the progress views.
        knobs.leftKnob.xPositionConstraint.constant = 40
        knobs.rightKnob.xPositionConstraint.constant = -40
    }

    /**
     Custom layout subviews to set the default values for the know of RangeUISlider
     */
    public override func layoutSubviews() {
        super.layoutSubviews()
        changeLeftKnob(value: defaultValueLeftKnob)
        changeRightKnob(value: defaultValueRightKnob)
    }

    // MARK: programmatic api

    /**
     Change the value of the left knob programmatically.
     
     - parameter value: the new value to be assigned to the left knob
     */
    public func changeLeftKnob(value: CGFloat) {
        programmaticKnobChange.programmaticallyChangeLeftKnob(value: value)
    }

    /**
     Change the value of the right knob programmatically.
     
     - parameter value: the new value to be assigned to the right knob
     */
    public func changeRightKnob(value: CGFloat) {
        programmaticKnobChange.programmaticallyChangeRightKnob(value: value)
    }

    internal func programmaticChangeCompleted() {
        previousRangeSelected = rangeSelectedCalculator.calculate(
            scale: scale,
            knobPositions: knobs.horizontalPositions(),
            barWidth: bar.frame.width
        )
        rangeSelectionFinished()
    }

    // MARK: setup

    private func setup() {
        addViews()
        RangeUISliderSetup(bar: bar, knobs: knobs, progressViews: progressViews)
            .execute(
                barProperties: barProperties(),
                knobsProperties: knobsProperties(),
                progressViewsProperties: progressViewsProperties()
            )
    }

    private func addViews() {
        addSubview(bar)
        bar.addSubview(progressViews.selectedProgressView)
        bar.addSubview(progressViews.leftProgressView)
        bar.addSubview(progressViews.rightProgressView)
        bar.addSubview(knobs.leftKnob)
        bar.addSubview(knobs.rightKnob)
    }

    private func barProperties() -> BarProperties {
        return BarProperties(
            height: barHeight,
            leading: barLeading,
            trailing: barTrailing
        )
    }

    private func knobsProperties() -> KnobsProperties {
        return KnobsPropertiesBuilder(
            target: self,
            leftKnobSelector: #selector(moveLeftKnob),
            rightKnobSelector: #selector(moveRightKnob)
        )
        .leftKnobHeight(leftKnobHeight)
        .leftKnobWidth(leftKnobWidth)
        .rightKnobHeight(rightKnobHeight)
        .rightKnobWidth(rightKnobWidth)
        .build()
    }

    private func progressViewsProperties() -> ProgressViewsProperties {
        return ProgressViewsPropertiesFactory.make(
            rangeSelectedColor: rangeSelectedColor,
            rangeNotSelectedColor: rangeNotSelectedColor
        )
    }

    // MARK: gradient

    private func addGradientToNotSelectedRange() {
        let properties = GradientProperties(
            colors: GradientColors(
                firstColor: rangeNotSelectedGradientColor1,
                secondColor: rangeNotSelectedGradientColor2
            ),
            points: GradientPoints(
                startPoint: rangeNotSelectedGradientStartPoint,
                endPoint: rangeNotSelectedGradientEndPoint
            ),
            cornerRadius: barCorners
        )
        progressViews.addGradientToNotSelectedProgressView(properties: properties)
    }

    private func selectedRangeGradientProperties() -> GradientProperties {
        return GradientProperties(
            colors: GradientColors(
                firstColor: rangeSelectedGradientColor1,
                secondColor: rangeSelectedGradientColor2
            ),
            points: GradientPoints(
                startPoint: rangeSelectedGradientStartPoint,
                endPoint: rangeSelectedGradientEndPoint
            ),
            cornerRadius: 0.0
        )
    }

    private func leftKnobGradientProperties() -> GradientProperties {
        return GradientProperties(
            colors: GradientColors(
                firstColor: leftKnobGradientColor1,
                secondColor: leftKnobGradientColor2
            ),
            points: GradientPoints(
                startPoint: leftKnobGradientStartPoint,
                endPoint: leftKnobGradientEndPoint
            ),
            cornerRadius: leftKnobCorners
        )
    }

    private func rightKnobGradientProperties() -> GradientProperties {
        return GradientProperties(
            colors: GradientColors(
                firstColor: rightKnobGradientColor1,
                secondColor: rightKnobGradientColor2
            ),
            points: GradientPoints(
                startPoint: rightKnobGradientStartPoint,
                endPoint: rightKnobGradientEndPoint
            ),
            cornerRadius: rightKnobCorners
        )
    }

    // MARK: background

    private func addBackgroundToRangeNotSelectedIfNeeded() {
        progressViews.addBackgroundToNotSelectedProgressViews(
            image: rangeNotSelectedBackgroundImage,
            edgeInset: UIEdgeInsets(
                top: rangeNotSelectedBackgroundEdgeInsetTop,
                left: rangeNotSelectedBackgroundEdgeInsetLeft,
                bottom: rangeNotSelectedBackgroundEdgeInsetBottom,
                right: rangeNotSelectedBackgroundEdgeInsetRight
            ),
            barCorners: barCorners
        )
    }

    private func addBackgroundToRangeSelected() {
        progressViews.addBackgroundToSelectedProgressViews(
            image: rangeSelectedBackgroundImage,
            edgeInset: UIEdgeInsets(
                top: rangeSelectedBackgroundEdgeInsetTop,
                left: rangeSelectedBackgroundEdgeInsetLeft,
                bottom: rangeSelectedBackgroundEdgeInsetBottom,
                right: rangeSelectedBackgroundEdgeInsetRight
            ),
            barCorners: barCorners
        )
    }

    // MARK: Scale

    private func setScale() {
        scale = Scale(scaleMinValue: scaleMinValue, scaleMaxValue: scaleMaxValue)
    }

    // MARK: gesture

    @objc final func moveLeftKnob(gestureRecognizer: UIPanGestureRecognizer) {
        knobGestureManager.moveLeftKnob(gesture: getGestureData(gestureRecognizer: gestureRecognizer))
    }

    @objc final func moveRightKnob(gestureRecognizer: UIPanGestureRecognizer) {
        knobGestureManager.moveRightKnob(gesture: getGestureData(gestureRecognizer: gestureRecognizer))
    }

    private func getGestureData(gestureRecognizer: UIPanGestureRecognizer) -> GestureData {
        return GestureData(
            gestureRecognizer: gestureRecognizer,
            scale: scale,
            stepIncrement: stepIncrement,
            semanticContentAttribute: self.semanticContentAttribute
        )
    }

    internal func rangeChangeStarted() {
        delegate?.rangeChangeStarted?()
    }

    internal func rangeSelectionUpdate() {
        let rangeSelected = calculateSelectedRange()

        if isDifferentFromPreviousRangeSelected(rangeSelected: rangeSelected) {
            delegate?.rangeIsChanging?(
                minValueSelected: rangeSelected.minValue,
                maxValueSelected: rangeSelected.maxValue,
                slider: self
            )
            previousRangeSelected = rangeSelected
        }
    }

    private func isDifferentFromPreviousRangeSelected(rangeSelected: RangeSelected) -> Bool {
        return rangeSelected.minValue != previousRangeSelected.minValue
            || rangeSelected.maxValue != previousRangeSelected.maxValue
    }

    internal func rangeSelectionFinished() {
        let rangeSelected = calculateSelectedRange()

        if !rangeSelected.maxValue.isNaN && !rangeSelected.maxValue.isNaN {
            delegate?.rangeChangeFinished(
                minValueSelected: rangeSelected.minValue,
                maxValueSelected: rangeSelected.maxValue,
                slider: self
            )
        }
    }

    private func calculateSelectedRange() -> RangeSelected {
        return rangeSelectedCalculator.calculate(
            scale: scale,
            knobPositions: knobs.horizontalPositions(),
            barWidth: bar.frame.width
        )
    }
}
