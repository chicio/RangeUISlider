//
//  DoubleUISlider.swift
//  DoubleSliderProject
//
//  Created by Fabrizio Duroni on 15/03/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DoubleUISlider: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            setNeedsLayout()
        }
    }
    
    fileprivate let bar: SliderBar
    
    required init?(coder aDecoder: NSCoder) {
        
        self.bar = SliderBar(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        
        self.bar = SliderBar(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        super.init(frame: frame)
        self.setup()
    }
    
    func setup() {
        
        self.bar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.bar)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.bar,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .width,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.bar,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .height,
                               multiplier: 0.5,
                               constant: 0.0),
            NSLayoutConstraint(item: self.bar,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self.bar,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0)
            ])
        self.bar.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
}

@IBDesignable
fileprivate class SliderBar: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
