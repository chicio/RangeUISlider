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
        self.selectedValuesLabel.text = "Min value selected: \(self.rangeSlider.scaleMinValue) \nMax value selected: \(self.rangeSlider.scaleMaxValue)"
    }
    
    @IBAction func onRightToLeftChange(_ sender: UISwitch) {
        self.rangeSlider.rightToLeft = sender.isOn
    }
    
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        self.selectedValuesLabel.text = "Min value selected: \(floor(minValueSelected)) \nMax value selected: \(floor(maxValueSelected))"
    }
}
