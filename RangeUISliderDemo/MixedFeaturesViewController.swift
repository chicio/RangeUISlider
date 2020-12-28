//
//  MixedFeaturesViewController.swift
//  RangeUISliderDemo
//
//  Created by Fabrizio Duroni on 28.12.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import UIKit
import RangeUISlider

class MixedFeaturesViewController: UIViewController, RangeUISliderDelegate {
    @IBOutlet weak var rangeSliderCustomScale: RangeUISlider!
    @IBOutlet weak var rangeSliderCustomScaleLabel: UILabel!
        
    override func viewDidLoad() {
        self.rangeSliderCustomScale.delegate = self
    }
    
    func rangeChangeStarted() {
        print("range modification start")
    }
    
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
    
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        setMessage(label: rangeSliderCustomScaleLabel, minValueSelected: minValueSelected, maxValueSelected: maxValueSelected)
    }
    
    private func setMessage(label: UILabel, minValueSelected: CGFloat, maxValueSelected: CGFloat) {
        label.text = "Min value selected: \(floor(minValueSelected)) \nMax value selected: \(floor(maxValueSelected))"
    }
}
