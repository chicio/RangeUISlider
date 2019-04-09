//
//  ViewController.swift
//  DoubleSliderProject
//
//  Created by Fabrizio Duroni on 15/03/2017.
//  2017 Fabrizio Duroni.
//

import UIKit
import RangeUISlider

class ViewController: UIViewController, RangeUISliderDelegate {
    @IBOutlet weak var rangeUISlider: RangeUISlider!
    @IBOutlet weak var rangeUISlider2: RangeUISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        rangeUISlider.delegate = self
        rangeUISlider2.delegate = self
    }
    
    func rangeChangeStarted() {
        print("range modification start")
    }
    
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("FINISH min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
    
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
}
