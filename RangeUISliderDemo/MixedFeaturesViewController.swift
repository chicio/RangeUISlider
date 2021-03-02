//
//  MixedFeaturesViewController.swift
//  RangeUISliderDemo
//
//  Created by Fabrizio Duroni on 28.12.20.
//  2020 Fabrizio Duroni.
//

import UIKit
import RangeUISlider

class MixedFeaturesViewController: UIViewController, RangeUISliderDelegate {
    @IBOutlet weak var rangeSliderCustomScale: RangeUISlider!
    @IBOutlet weak var rangeSliderStepIncrement: RangeUISlider!
    @IBOutlet weak var minValueSelectedLabel: UILabel!
    @IBOutlet weak var maxValueSelectedLabel: UILabel!

    override func viewDidLoad() {
        self.rangeSliderCustomScale.delegate = self
        self.rangeSliderStepIncrement.delegate = self
    }

    func rangeChangeStarted() {
        print("range modification start")
    }

    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        // print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }

    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        minValueSelectedLabel.text = minValueSelected.description
        maxValueSelectedLabel.text = maxValueSelected.description
    }
}
