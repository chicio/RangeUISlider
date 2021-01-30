//
//  ProgressView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

class Progress: Gradient {
    func setup(leftAnchorView: UIView,
               leftAnchorConstraintAttribute: NSLayoutConstraint.Attribute,
               rightAnchorView: UIView,
               rightAnchorConstraintAttribute: NSLayoutConstraint.Attribute,
               color: UIColor
    ) -> [NSLayoutConstraint] {
        accessibilityIdentifier = "Progress"
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        return [
            DimensionConstraintFactory.equalHeightConstraint(target: self, parent: superview),
            CenterConstraintFactory.centerY(target: self, parent: superview),
            MarginConstraintFactory.leadingTo(
                attribute: leftAnchorConstraintAttribute,
                views: ContraintViews(target: self, relatedView: leftAnchorView),
                value: 0.0
            ),
            MarginConstraintFactory.trailingTo(
                attribute: rightAnchorConstraintAttribute,
                views: ContraintViews(target: self, relatedView: rightAnchorView),
                value: 0.0
            )
        ]
    }

    func addBackground(image: UIImage, edgeInset: UIEdgeInsets, corners: CGFloat) {
        let backgroundImageView = createBackgroundUsing(image: image, edgeInset: edgeInset, corners: corners)
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            MarginConstraintFactory.leadingConstraint(
                views: ContraintViews(target: backgroundImageView, relatedView: self),
                value: 0.0
            ),
            MarginConstraintFactory.trailingConstraint(
                views: ContraintViews(target: backgroundImageView, relatedView: self),
                value: 0.0
            ),
            MarginConstraintFactory.topConstraint(
                views: ContraintViews(target: backgroundImageView, relatedView: self),
                value: 0.0
            ),
            MarginConstraintFactory.bottomConstraint(
                views: ContraintViews(target: backgroundImageView, relatedView: self),
                value: 0.0
            )
        ])
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
