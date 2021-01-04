//
//  SwiftUIHostingViewController.swift
//  RangeUISliderDemo
//
//  Created by Fabrizio Duroni on 04.01.21.
//  2021 Fabrizio Duroni.
//

import SwiftUI
import RangeUISlider

struct RangeUISliderSwiftUI: UIViewRepresentable {
    func makeUIView(context: Context) -> RangeUISlider {
        let rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 50)))
        //rangeSlider.delegate = self
        rangeSlider.scaleMinValue = 0 //If you don't set any value the default is 0
        rangeSlider.scaleMaxValue = 100 //If you don't set any value the default is 1
        rangeSlider.defaultValueLeftKnob = 25 //If the scale is the default one insert a value between 0 and 1
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
        return rangeSlider
    }

    func updateUIView(_ uiView: RangeUISlider, context: Context) {
    }
}


struct SwiftUIHostingView: View {
    var body: some View {
         VStack {
             Text("RangeUISlider SwiftUI").font(.system(size: 36))
             RangeUISliderSwiftUI()
         }
     }
}

class SwiftUIHostingViewController: UIHostingController<SwiftUIHostingView> {    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIHostingView())
    }
}
