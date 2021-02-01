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
    private let defaultFirstColor = UIColor(red: 140.0/255.0, green: 140.0/255.0, blue: 140.0/255.0, alpha: 1.0)
    private let defaultSecondColor = UIColor(red: 140.0/255.0, green: 140.0/255.0, blue: 140.0/255.0, alpha: 1.0)
    lazy private(set) var gradient: CAGradientLayer = CAGradientLayer()

    override func layoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradient.frame = bounds
        CATransaction.commit()
        CATransaction.setDisableActions(false)
    }

    func addGradient(properties: GradientProperties) {
        gradient.colors = [
            (properties.colors.firstColor ?? defaultFirstColor).cgColor,
            (properties.colors.secondColor ?? defaultSecondColor).cgColor
        ]
        gradient.startPoint = properties.points.startPoint ?? CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = properties.points.endPoint ?? CGPoint(x: 0.0, y: 1.0)
        gradient.cornerRadius = properties.cornerRadius
        layer.addSublayer(gradient)
    }
}
