//
//  Knob.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import UIKit

class Knob: Gradient, UIGestureRecognizerDelegate {
    public let backgroundView: UIView = UIView()
    private lazy var imageView: UIImageView = UIImageView()
    private(set) var xPositionConstraint: NSLayoutConstraint!
    private(set) var widthConstraint: NSLayoutConstraint!
    private(set) var heightConstraint: NSLayoutConstraint!

    func setup(properties: KnobProperties, target: Any?, selector: Selector) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        accessibilityIdentifier = properties.accessibilityIdentifier
        setGestureRecognizer(withTarget: target, usingSelector: selector)
        setupBackground()
        return generateConstraintsFrom(dimensions: properties.dimensions, position: properties.position)
    }

    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        bringSubviewToFront(backgroundView)
    }

    private func setGestureRecognizer(withTarget target: Any?, usingSelector selector: Selector) {
        let gesture = UIPanGestureRecognizer(target: target, action: selector)
        gesture.delegate = self
        addGestureRecognizer(gesture)
    }

    private func generateConstraintsFrom(dimensions: Dimensions, position: KnobPosition) -> [NSLayoutConstraint] {
        xPositionConstraint = PositionConstraintFactory.centerXTo(
            attribute: position == .left ? .leading : .trailing,
            views: ConstraintViews(target: self, related: superview)
        )
        widthConstraint = DimensionConstraintFactory.width(target: self, value: dimensions.width)
        heightConstraint = DimensionConstraintFactory.height(target: self, value: dimensions.height)
        let knobConstraints: [NSLayoutConstraint] = [
            xPositionConstraint,
            PositionConstraintFactory.centerY(views: ConstraintViews(target: self, related: superview)),
            widthConstraint,
            heightConstraint
        ]

        return knobConstraints + [
            MarginConstraintFactory.leading(
                views: ConstraintViews(target: backgroundView, related: self),
                value: 0.0
            ),
            MarginConstraintFactory.trailing(
                views: ConstraintViews(target: backgroundView, related: self),
                value: 0.0
            ),
            MarginConstraintFactory.top(
                views: ConstraintViews(target: backgroundView, related: self),
                value: 0.0
            ),
            MarginConstraintFactory.bottom(
                views: ConstraintViews(target: backgroundView, related: self),
                value: 0.0
            )
        ]
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
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

    func addBorders(usingColor color: UIColor, andWidth width: CGFloat, andCorners corners: CGFloat) {
        if imageView.image != nil {
            addBorders(toView: imageView, usingColor: color, andWidth: width)
            imageView.layer.cornerRadius = corners
        } else {
            addBorders(toView: backgroundView, usingColor: color, andWidth: width)
        }
    }

    private func addBorders(toView view: UIView,
                            usingColor color: UIColor,
                            andWidth width: CGFloat) {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
    }
}
