//
//  GradientView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation

class GradientView: UIView {
    lazy private(set) var gradient: CAGradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradient.frame = bounds
        CATransaction.commit()
        CATransaction.setDisableActions(false)
    }
    
    func addGradient(firstColor: UIColor?,
                     secondColor: UIColor?,
                     startPoint: CGPoint?,
                     endPoint: CGPoint?,
                     cornerRadius: CGFloat = 0.0) {
        let color1 = firstColor ?? UIColor(red: 140.0/255.0, green: 140.0/255.0, blue: 140.0/255.0, alpha: 1.0)
        let color2 = secondColor ?? UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        let begin = startPoint ?? CGPoint(x: 0.0, y: 0.5)
        let end = endPoint ?? CGPoint(x: 0.0, y: 1.0)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = begin
        gradient.endPoint = end
        gradient.cornerRadius = cornerRadius
        layer.addSublayer(gradient)
    }
}
