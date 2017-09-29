//
//  GradientView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation

class GradientView: UIView {
    /// An additional layer to manage gradient effects.
    lazy private(set) var gradient: CAGradientLayer = CAGradientLayer()
    
    /**
     Layout subviews. In this case we need to layout the added gradient layer to get the size of the container.
     Disable also the CA default animation.
     */
    override func layoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.gradient.frame = self.bounds
        CATransaction.commit()
        CATransaction.setDisableActions(false)
    }
    
    /**
     Add a gradient to the view. This method execute the setup of the gradientLayer property, using data received.
     
     - parameter firstColor: the first color of the gradient.
     - parameter secondColor: the second color of the gradient.
     - parameter startPoint: the starting point of the gradient.
     - parameter endPoint: the end point of the gradient.
     - parameter cornerRadius: the corner radius inherited from the container. Default 0.0.
     */
    func addGradient(firstColor: UIColor?,
                                 secondColor: UIColor?,
                                 startPoint: CGPoint?,
                                 endPoint: CGPoint?,
                                 cornerRadius: CGFloat = 0.0) {
        guard firstColor != nil && secondColor != nil else {
            return
        }
        let color1 = firstColor ?? UIColor(red: 140.0/255.0, green: 140.0/255.0, blue: 140.0/255.0, alpha: 1.0)
        let color2 = secondColor ?? UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        let begin = startPoint ?? CGPoint(x: 0.0, y: 0.5)
        let end = endPoint ?? CGPoint(x: 0.0, y: 1.0)
        self.gradient.colors = [color1.cgColor, color2.cgColor]
        self.gradient.startPoint = begin
        self.gradient.endPoint = end
        self.gradient.cornerRadius = cornerRadius
        self.layer.addSublayer(self.gradient)
    }
}
