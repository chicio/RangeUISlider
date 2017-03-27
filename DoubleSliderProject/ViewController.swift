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
    @IBOutlet weak var rangeUISlider2: RangeUISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.rangeUISlider.delegate = self
        self.rangeUISlider2.delegate = self
    }
    
    func rangeChanged(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
}
