//
//  SetupProgrammaticViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 03.05.18.
//  Copyright © 2018 Fabrizio Duroni. All rights reserved.
//

import UIKit
import RangeUISlider

class SetupProgrammaticViewController: UIViewController, RangeUISliderDelegate {
    @IBOutlet weak var rangeSlider: RangeUISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider.delegate = self
        ///Scale and default values setup up programmatically.
        rangeSlider.scaleMinValue = 0 //If you don't set any value the default is 0
        rangeSlider.scaleMaxValue = 100 //If you don't set any value the default is 1
        rangeSlider.defaultValueLeftKnob = 35 //If the scale is the default one insert a value between 0 and 1
        rangeSlider.defaultValueRightKnob = 75 //If the scale is the default one insert a value between 0 and 1
    }
    
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("FINISH min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
    
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
}
