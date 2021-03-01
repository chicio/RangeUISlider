//
//  ProgressView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

/**
 The `Progress` UI view RangeUIslider. It is a customized `UIView`.
 It is a subclass of `Gradient` view.
 */
public class Progress: Gradient {
    func setup(
        leftAnchorView: UIView,
        rightAnchorView: UIView,
        properties: ProgressProperties
    ) -> [NSLayoutConstraint] {
        accessibilityIdentifier = "Progress"
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = properties.color
        let views = ConstraintViews(target: self, related: superview)
        return [
            DimensionConstraintFactory.equalHeight(views: views),
            PositionConstraintFactory.centerY(views: views),
            MarginConstraintFactory.leadingTo(
                attribute: properties.leftAnchorConstraintAttribute,
                views: ConstraintViews(target: self, related: leftAnchorView),
                value: 0.0
            ),
            MarginConstraintFactory.trailingTo(
                attribute: properties.rightAnchorConstraintAttribute,
                views: ConstraintViews(target: self, related: rightAnchorView),
                value: 0.0
            )
        ]
    }

    func addBackground(image: UIImage, edgeInset: UIEdgeInsets, corners: CGFloat) {
        let backgroundImageView = createBackgroundUsing(image: image, edgeInset: edgeInset, corners: corners)
        let views = ConstraintViews(target: backgroundImageView, related: self)
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate(MatchingMarginConstraintFactory.make(views: views))
    }

    private func createBackgroundUsing(image: UIImage, edgeInset: UIEdgeInsets, corners: CGFloat) -> UIView {
        let backgroundResizableImage = image.resizableImage(withCapInsets: edgeInset)
        let backgroundImageView = UIImageView(image: backgroundResizableImage)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.layer.masksToBounds = corners > 0
        backgroundImageView.layer.cornerRadius = corners
        backgroundImageView.accessibilityIdentifier = "ProgressBackground"
        return backgroundImageView
    }
}
