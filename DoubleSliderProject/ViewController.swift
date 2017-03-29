//
//  ViewController.swift
//  DoubleSliderProject
//
//  Created by Fabrizio Duroni on 15/03/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RangeUISliderDelegate {
    /**
     Calls the delegate when the user has finished the change of the range.
     
     - parameter minValueSelected: the minimum value selected.
     - parameter maxValueSelected: the maximum value selected.
     - parameter slider: the slider on which the range has been modified.
     */
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
     
        print("FINISH min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }

    
    @IBOutlet weak var rangeUISlider: RangeUISlider!
    @IBOutlet weak var rangeUISlider2: RangeUISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.rangeUISlider.delegate = self
        self.rangeUISlider2.delegate = self
    }
    
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
}
