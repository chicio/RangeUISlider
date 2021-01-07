//
//  SwiftUIHostingViewController.swift
//  RangeUISliderDemo
//
//  Created by Fabrizio Duroni on 04.01.21.
//  2021 Fabrizio Duroni.
//

import SwiftUI
import RangeUISlider

struct SwiftUIHostingView: View {
    @State private var minValueSelected: CGFloat = 10
    @State private var maxValueSelected: CGFloat = 40
    
    var body: some View {
         VStack {
            Text("RangeUISlider SwiftUI").font(.system(size: 36))
            HStack {
                Text("Min value:")
                Text(self.minValueSelected.description)
            }
            HStack {
                Text("Max value:")
                Text(self.maxValueSelected.description)
            }
            RangeSlider(minValueSelected: self.$minValueSelected, maxValueSelected: self.$maxValueSelected)
                .scaleMinValue(5)
                .scaleMaxValue(80)
                .stepIncrement(5)
                .defaultValueLeftKnob(10)
                .defaultValueRightKnob(40)
                .rangeSelectedGradientColor1(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                .rangeSelectedGradientColor2(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .rangeSelectedGradientStartPoint(CGPoint(x: 0, y: 0.5))
                .rangeSelectedGradientEndPoint(CGPoint(x: 0, y: 1))
                .rangeNotSelectedGradientColor1(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                .rangeNotSelectedGradientColor2(Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
                .rangeNotSelectedGradientStartPoint(CGPoint(x: 0, y: 0.5))
                .rangeNotSelectedGradientEndPoint(CGPoint(x: 0, y: 1))
                .barHeight(20)
                .barCorners(10)
                .leftKnobColor(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
                .leftKnobWidth(40)
                .leftKnobHeight(40)
                .leftKnobCorners(20)
                .rightKnobColor(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
                .rightKnobWidth(40)
                .rightKnobHeight(40)
                .rightKnobCorners(20)
         }
     }
}

class SwiftUIHostingViewController: UIHostingController<SwiftUIHostingView> {    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIHostingView())
    }
}
