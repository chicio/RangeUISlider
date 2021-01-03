//
//  RightToLeftViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 27.12.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import UIKit
import RangeUISlider

class RightToLeftViewController: UIViewController, RangeUISliderDelegate {
    @IBOutlet weak var rangeSlider: RangeUISlider!
    @IBOutlet weak var selectedValuesLabel: UILabel!
    
    override func viewDidLoad() {
        self.rangeSlider.delegate = self
        setMessage(minValueSelected: self.rangeSlider.scaleMinValue, maxValueSelected: self.rangeSlider.scaleMaxValue)
    }
        
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        setMessage(minValueSelected: minValueSelected, maxValueSelected: maxValueSelected)
    }
    
    private func setMessage(minValueSelected: CGFloat, maxValueSelected: CGFloat) {
        self.selectedValuesLabel.text = "Min value selected: \(floor(minValueSelected)) \nMax value selected: \(floor(maxValueSelected))"
    }
}
