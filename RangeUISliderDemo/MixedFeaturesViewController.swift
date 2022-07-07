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

    func rangeChangeFinished(event: RangeUISliderChangeFinishedEvent) {
        print("FINISH min: \(event.minValueSelected) - max: \(event.maxValueSelected)")
        minValueSelectedLabel.text = event.minValueSelected.description
        maxValueSelectedLabel.text = event.maxValueSelected.description
    }

    func rangeIsChanging(event: RangeUISliderChangeEvent) {
        print("min: \(event.minValueSelected) -  max: \(event.maxValueSelected) - identifier: \(event.slider.identifier)")
    }

}
