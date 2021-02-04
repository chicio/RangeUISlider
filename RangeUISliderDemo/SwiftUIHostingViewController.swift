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
        ZStack {
            HStack {
                Divider()
                    .hidden()
                    .accessibility(identifier: "startMarker")
                Spacer()
                Divider()
                    .hidden()
                    .accessibility(identifier: "middleMarker")
                Spacer()
                Divider()
                    .hidden()
                    .accessibility(identifier: "endMarker")
            }
            .padding(.horizontal, 20)
            VStack {
                Text("RangeUISlider SwiftUI").font(.system(size: 36))
                HStack {
                    Text("Min value:")
                    Text(self.minValueSelected.description)
                        .accessibility(identifier: "minValueSelectedLabel")
                }
                HStack {
                    Text("Max value:")
                    Text(self.maxValueSelected.description)
                        .accessibility(identifier: "maxValueSelectedLabel")
                }
                RangeSlider(minValueSelected: self.$minValueSelected, maxValueSelected: self.$maxValueSelected)
                    .scaleMinValue(5)
                    .scaleMaxValue(80)
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
                    .accessibility(identifier: "RangeUISliderStandard")
                RangeSlider(minValueSelected: self.$minValueSelected, maxValueSelected: self.$maxValueSelected)
                    .stepIncrement(2)
                    .defaultValueLeftKnob(4)
                    .defaultValueRightKnob(16)
                    .scaleMinValue(0)
                    .scaleMaxValue(20)
                    .rangeSelectedGradientColor1(Color(.blue))
                    .rangeSelectedGradientColor2(Color(.purple))
                    .rangeSelectedGradientStartPoint(CGPoint(x: 0, y: 0.2))
                    .rangeSelectedGradientEndPoint(CGPoint(x: 0, y: 1))
                    .rangeNotSelectedBackgroundImage("rangeNotSelected")
                    .leftKnobWidth(40)
                    .leftKnobHeight(40)
                    .leftKnobCorners(20)
                    .leftKnobImage("knob")
                    .rightKnobWidth(40)
                    .rightKnobHeight(40)
                    .rightKnobCorners(20)
                    .rightKnobImage("knob")
                    .barHeight(10)
                    .barShadowOffset(CGSize(width: 0, height: 2))
                    .barShadowOpacity(1)
                    .accessibility(identifier: "RangeUISliderStep")
                RangeSlider(minValueSelected: self.$minValueSelected, maxValueSelected: self.$maxValueSelected)
                    .rangeSelectedColor(Color(#colorLiteral(red: 1, green: 1, blue: 0.07611685739, alpha: 1)))
                    .defaultValueLeftKnob(0.2)
                    .defaultValueRightKnob(0.7)
                    .leftKnobColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .leftKnobBorderWidth(2)
                    .leftKnobBorderColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .leftShadowColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                    .leftShadowOffset(CGSize(width: 0, height: 2))
                    .leftShadowOpacity(1)
                    .leftKnobWidth(30)
                    .leftKnobHeight(30)
                    .leftKnobCorners(15)
                    .rightKnobImage("knobMetallic")
                    .rightShadowColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                    .rightShadowOffset(CGSize(width: 0, height: -4))
                    .rightShadowOpacity(1)
                    .rightKnobBorderWidth(2)
                    .rightKnobBorderColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .rightKnobWidth(56)
                    .rightKnobHeight(56)
                    .rightKnobCorners(28)
                Spacer()
            }.padding(30)
        }
    }
}

class SwiftUIHostingViewController: UIHostingController<SwiftUIHostingView> {
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIHostingView())
    }
}
