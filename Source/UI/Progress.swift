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
               color: UIColor) -> [NSLayoutConstraint] {
        accessibilityIdentifier = "Progress"
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        let progressViewConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: self,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: superview,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: superview,
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
    
    func addBackground(usingImage image: UIImage,
                       andEdgeInset edgeInset: UIEdgeInsets,
                       andCorners corners: CGFloat) {
        let backgroundImageView = createBackgroundUsing(image: image, edgeInset: edgeInset, corners: corners)
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            MarginConstraintFactory.leadingConstraint(target: backgroundImageView, parent: self, value: 0.0),
            MarginConstraintFactory.trailingConstraint(target: backgroundImageView, parent: self, value: 0.0),
            MarginConstraintFactory.topConstraint(target: backgroundImageView, parent: self, value: 0.0),
            MarginConstraintFactory.bottomConstraint(target: backgroundImageView, parent: self, value: 0.0)
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
