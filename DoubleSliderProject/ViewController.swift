//
//  ViewController.swift
//  DoubleSliderProject
//
//  Created by Fabrizio Duroni on 15/03/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RangeUISliderDelegate {
    
    @IBOutlet weak var rangeUISlider: RangeUISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.rangeUISlider.delegate = self
    }
    
    func rangeChanged(minValue: CGFloat, maxValue: CGFloat) {
        
        print("min: \(minValue) -  max: \(maxValue)")
    }
}
