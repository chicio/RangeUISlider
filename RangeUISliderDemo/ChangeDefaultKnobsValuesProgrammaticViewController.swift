//
//  ChangeDefaultKnobsValuesProgrammaticViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 15.02.21.
//  2021 Fabrizio Duroni.
//

// swiftlint:disable function_body_length
// swiftlint:disable type_name

import UIKit
import RangeUISlider

class ChangeDefaultKnobsValuesProgrammaticViewController: UIViewController, RangeUISliderDelegate {
    private var rangeSlider: RangeUISlider!
    private var minValueSelectedLabel: UILabel!
    private var maxValueSelectedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: 100, height: 50)))
        rangeSlider.accessibilityIdentifier = "RangeUISliderProgrammaticDefaultKnobValueChange"
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        rangeSlider.delegate = self
        rangeSlider.scaleMinValue = 0 // If you don't set any value the default is 0
        rangeSlider.scaleMaxValue = 100 // If you don't set any value the default is 1
        rangeSlider.defaultValueLeftKnob = 10 // If the scale is the default one insert a value between 0 and 1
        rangeSlider.defaultValueRightKnob = 75 // If the scale is the default one insert a value between 0 and 1
        rangeSlider.rangeSelectedColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        rangeSlider.rangeNotSelectedColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
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

        minValueSelectedLabel = UILabel()
        minValueSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        minValueSelectedLabel.accessibilityIdentifier = "minValueSelected"
        minValueSelectedLabel.text = "0.0"
        self.view.addSubview(minValueSelectedLabel)

        maxValueSelectedLabel = UILabel()
        maxValueSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        maxValueSelectedLabel.accessibilityIdentifier = "maxValueSelected"
        maxValueSelectedLabel.text = "0.0"
        self.view.addSubview(maxValueSelectedLabel)

        // Setup slide with programmatic autolayout.
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
                               constant: 50),
            NSLayoutConstraint(item: minValueSelectedLabel!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: rangeSlider,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 20),
            NSLayoutConstraint(item: minValueSelectedLabel!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 20),
            NSLayoutConstraint(item: minValueSelectedLabel!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: -20),
            NSLayoutConstraint(item: minValueSelectedLabel!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 30),
            NSLayoutConstraint(item: maxValueSelectedLabel!,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: minValueSelectedLabel,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 20),
            NSLayoutConstraint(item: maxValueSelectedLabel!,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 20),
            NSLayoutConstraint(item: maxValueSelectedLabel!,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: -20),
            NSLayoutConstraint(item: maxValueSelectedLabel!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 30)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.rangeSlider.scaleMinValue = 50
            self.rangeSlider.scaleMaxValue = 200
            self.rangeSlider.defaultValueLeftKnob = 70
            self.rangeSlider.defaultValueRightKnob = 110
        }
    }

    func rangeChangeFinished(
        minValueSelected: CGFloat,
        maxValueSelected: CGFloat,
        slider: RangeUISlider,
        userInteraction: Bool
    ) {
        print("FINISH min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
        minValueSelectedLabel.text = minValueSelected.description
        maxValueSelectedLabel.text = maxValueSelected.description
    }

    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("min: \(minValueSelected) -  max: \(maxValueSelected) - identifier: \(slider.identifier)")
    }
}
