//
//  GradientView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

class Gradient: UIView {
    lazy private(set) var gradient: CAGradientLayer = CAGradientLayer()

    override func layoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradient.frame = bounds
        CATransaction.commit()
        CATransaction.setDisableActions(false)
    }

    func addGradient(properties: GradientProperties) {
        if let firstColor = properties.colors.firstColor?.cgColor,
           let secondColor = properties.colors.secondColor?.cgColor {
            gradient.colors = [firstColor, secondColor]
            gradient.startPoint = properties.points.startPoint ?? CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = properties.points.endPoint ?? CGPoint(x: 0.0, y: 1.0)
            gradient.cornerRadius = properties.cornerRadius
            layer.addSublayer(gradient)
        }
    }
}
