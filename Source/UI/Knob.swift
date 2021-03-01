//
//  Knob.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import UIKit

/**
 The `Knob` UI components of RangeUIslider. It is a customized `UIView`.
 It is a subclass of `Gradient` view.
 */
public class Knob: Gradient, UIGestureRecognizerDelegate {
    public let backgroundView: UIView = UIView()
    private lazy var imageView: UIImageView = UIImageView()
    private(set) var xPositionConstraint: NSLayoutConstraint!
    private(set) var widthConstraint: NSLayoutConstraint!
    private(set) var heightConstraint: NSLayoutConstraint!

    func setup(properties: KnobProperties) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        accessibilityIdentifier = properties.accessibilityIdentifier
        setGestureRecognizer(gesture: properties.gesture)
        setupBackground()
        return generateConstraintsFrom(dimensions: properties.dimensions, position: properties.position)
    }

    func addBorders(usingColor color: UIColor, andWidth width: CGFloat, andCorners corners: CGFloat) {
        if imageView.image != nil {
            addBorders(toView: imageView, usingColor: color, andWidth: width)
            imageView.layer.cornerRadius = corners
        } else {
            addBorders(toView: backgroundView, usingColor: color, andWidth: width)
        }
    }

    func add(image anImage: UIImage?) {
        if let image = anImage {
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleToFill
            addSubview(imageView)
            let views = ConstraintViews(target: imageView, related: self)
            NSLayoutConstraint.activate([
                PositionConstraintFactory.centerX(views: views),
                PositionConstraintFactory.centerY(views: views),
                DimensionConstraintFactory.equalWidth(views: views),
                DimensionConstraintFactory.equalHeight(views: views)
            ])
        }
    }

    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        bringSubviewToFront(backgroundView)
    }

    private func setGestureRecognizer(gesture: KnobGesturesProperties) {
        let gesture = UIPanGestureRecognizer(target: gesture.target, action: gesture.selector)
        gesture.delegate = self
        addGestureRecognizer(gesture)
    }

    private func generateConstraintsFrom(dimensions: Dimensions, position: KnobPosition) -> [NSLayoutConstraint] {
        let views = ConstraintViews(target: self, related: superview)
        xPositionConstraint = PositionConstraintFactory.centerXTo(attribute: centerXFor(position), views: views)
        widthConstraint = DimensionConstraintFactory.width(target: self, value: dimensions.width)
        heightConstraint = DimensionConstraintFactory.height(target: self, value: dimensions.height)
        return [
            PositionConstraintFactory.centerY(views: views),
            xPositionConstraint,
            widthConstraint,
            heightConstraint
        ] + backgroundViewConstraints()
    }

    private func centerXFor(_ position: KnobPosition) -> NSLayoutConstraint.Attribute {
        return position == .left ? .leading : .trailing
    }

    private func backgroundViewConstraints() -> [NSLayoutConstraint] {
        return MatchingMarginConstraintFactory.make(
            views: ConstraintViews(target: backgroundView, related: self)
        )
    }

    private func addBorders(toView view: UIView,
                            usingColor color: UIColor,
                            andWidth width: CGFloat) {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }

    /**
     Gesture recognizer delegate method implementation for knob movement.
     */
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return true
    }

    /**
     Gesture recognizer delegate method implementation for knob movement.
     */
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return false
    }

    /**
     Gesture recognizer delegate method implementation for knob movement.
     */
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}
