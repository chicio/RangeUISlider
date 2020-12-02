//
//  ChangeKnobsProgrammaticViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 03/05/2018.
//  2018 Fabrizio Duroni.
//

import UIKit
import RangeUISlider

class ChangeKnobsProgrammaticViewController: UIViewController, RangeUISliderDelegate {
    private var rangeSlider: RangeUISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: 100, height: 50)))
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        rangeSlider.delegate = self
        rangeSlider.scaleMinValue = 0 //If you don't set any value the default is 0
        rangeSlider.scaleMaxValue = 100 //If you don't set any value the default is 1
        rangeSlider.defaultValueLeftKnob = 10 //If the scale is the default one insert a value between 0 and 1
        rangeSlider.defaultValueRightKnob = 75 //If the scale is the default one insert a value between 0 and 1
        rangeSlider.rangeSelectedGradientColor1 = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        rangeSlider.rangeSelectedGradientColor2 = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        rangeSlider.rangeSelectedGradientStartPoint = CGPoint(x: 0, y: 0.5)
        rangeSlider.rangeSelectedGradientEndPoint = CGPoint(x: 0, y: 1)
        rangeSlider.rangeNotSelectedGradientColor1 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        rangeSlider.rangeNotSelectedGradientColor2 = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        rangeSlider.rangeNotSelectedGradientStartPoint = CGPoint(x: 0, y: 0.5)
        rangeSlider.rangeNotSelectedGradientEndPoint = CGPoint(x: 0, y: 1)
        rangeSlider.barHeight = 20
        rangeSlider.barCorners = 10
        rangeSlider.leftKnobColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        rangeSlider.leftKnobWidth = 40
        rangeSlider.leftKnobHeight = 40
        rangeSlider.leftKnobCorners = 20
        rangeSlider.rightKnobColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        rangeSlider.rightKnobWidth = 40
        rangeSlider.rightKnobHeight = 40
        rangeSlider.rightKnobCorners = 20
        self.view.addSubview(rangeSlider)
        
        //Setup slide with programmatic autolayout.
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: rangeSlider!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 20),
            NSLayoutConstraint(item: rangeSlider!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: -20),
            NSLayoutConstraint(item: rangeSlider!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 100),
            NSLayoutConstraint(item: rangeSlider!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 50)
        ])
        
        self.rangeSlider.changeLeftKnob(value: 35.0)
        self.rangeSlider.changeRightKnob(value: 75.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.rangeSlider.changeLeftKnob(value: 45.0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //Invalid left values
            self.rangeSlider.changeLeftKnob(value: -45.0)
            self.rangeSlider.changeLeftKnob(value: 78.0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.rangeSlider.changeRightKnob(value: 90.0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            //Invalid right values
            self.rangeSlider.changeRightKnob(value: 10.0)
            self.rangeSlider.changeRightKnob(value: 190.0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            //set all together
            self.rangeSlider.changeLeftKnob(value: 15.0)
            self.rangeSlider.changeRightKnob(value: 85.0)
        }
    }
    
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("FINISH min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
    
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
}
