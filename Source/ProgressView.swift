//
//  ProgressView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ProgressView: GradientView {
    /**
     Method used to setup the background of the progress view using an image.
     The image is streched using the resizable with cap api.
     
     - parameter image: the image to be used as background.
     - parameter edgeInset: the edge inset to be used for image stretching.
     - parameter corners: corner radius ihnerited from the bar (container of the progress views).
     */
    func addBackground(usingImage image: UIImage,
                       andEdgeInset edgeInset: UIEdgeInsets,
                       andCorners corners: CGFloat) {
        let backgroundResizableImage = image.resizableImage(withCapInsets: edgeInset)
        let backgroundImageView = UIImageView(image: backgroundResizableImage)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.layer.masksToBounds = corners > 0
        backgroundImageView.layer.cornerRadius = corners
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: backgroundImageView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: backgroundImageView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: backgroundImageView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: backgroundImageView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0)
            ])
    }
    
    /**
     Method used to setup the progress view.
     
     - parameter leftAnchorView: the view used as left reference for the progress view constraints.
     - parameter leftAnchorConstraintAttribute: the attribute to be used for left margin constraint.
     - parameter rightAnchorView: the view used as rightreference for the progress view constraints.
     - parameter rightAnchorConstraintAttribute: the attribute to be used for right margin constraint.
     - parameter color: the background color of the progress view.
     
     - returns: an array of progress view constraints.
     */
    func setup(leftAnchorView: UIView,
               leftAnchorConstraintAttribute: NSLayoutAttribute,
               rightAnchorView: UIView,
               rightAnchorConstraintAttribute: NSLayoutAttribute,
               color: UIColor) -> [NSLayoutConstraint] {
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
}
