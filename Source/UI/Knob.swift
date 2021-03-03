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
    /// The knobs UI components. See `KnobComponents` class.
    public let components: KnobComponents = KnobComponents()

    private(set) var xPositionConstraint: NSLayoutConstraint!
    private(set) var widthConstraint: NSLayoutConstraint!
    private(set) var heightConstraint: NSLayoutConstraint!

    func setup(properties: KnobProperties) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        accessibilityIdentifier = properties.accessibilityIdentifier
        setGestureRecognizer(gesture: properties.gesture)
        setupBackground()
        return generateConstraintsFrom(
            dimensions: properties.dimensions,
            position: properties.position
        )
    }

    func addBorders(usingColor color: UIColor, andWidth width: CGFloat, andCorners corners: CGFloat) {
        if components.imageView.image != nil {
            addBorders(toView: components.imageView, usingColor: color, andWidth: width)
            components.imageView.layer.cornerRadius = corners
        } else {
            addBorders(toView: components.backgroundView, usingColor: color, andWidth: width)
        }
    }

    func add(image anImage: UIImage?) {
        if let image = anImage {
            components.imageView.image = image
            components.imageView.translatesAutoresizingMaskIntoConstraints = false
            components.imageView.contentMode = .scaleToFill
            components.backgroundView.addSubview(components.imageView)
            let views = ConstraintViews(target: components.imageView, related: self)
            NSLayoutConstraint.activate([
                PositionConstraintFactory.centerX(views: views),
                PositionConstraintFactory.centerY(views: views),
                DimensionConstraintFactory.equalWidth(views: views),
                DimensionConstraintFactory.equalHeight(views: views)
            ])
        }
    }

    func showLabels(shouldShow: Bool, topPosition: Bool) {
        if shouldShow {
            components.knobLabel.setAccessibilityIdentifier(accessibilityIdentifier: accessibilityIdentifier)
            addSubview(components.knobLabel.label)
            bringSubviewToFront(components.knobLabel.label)
            NSLayoutConstraint.activate(
                components.knobLabel.calculateConstraintUsing(knob: self, topPosition: topPosition)
            )
        } else {
            components.knobLabel.label.removeFromSuperview()
            NSLayoutConstraint.deactivate(components.knobLabel.getConstraints())
        }
    }

    private func setupBackground() {
        components.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(components.backgroundView)
        bringSubviewToFront(components.backgroundView)
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
            views: ConstraintViews(target: components.backgroundView, related: self)
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
