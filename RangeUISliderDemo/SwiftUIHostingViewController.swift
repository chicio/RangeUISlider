//
//  SwiftUIHostingViewController.swift
//  RangeUISliderDemo
//
//  Created by Fabrizio Duroni on 04.01.21.
//  2021 Fabrizio Duroni.
//

import SwiftUI
import RangeUISlider

class Coordinator: RangeUISliderDelegate {
    private let rangeSlider: RangeUISliderSwiftUI
    
    init(rangeSlider: RangeUISliderSwiftUI) {
        self.rangeSlider = rangeSlider
    }
    
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        self.rangeSlider.minValueSelected = minValueSelected
        self.rangeSlider.maxValueSelected = maxValueSelected
    }
}

class RangeSliderSwiftUIViewSettings {
    public var scaleMinValue: CGFloat = 0.0
    public var scaleMaxValue: CGFloat = 1.0
    public var defaultValueLeftKnob: CGFloat = 0.0
    public var defaultValueRightKnob: CGFloat = 1.0
}

struct RangeUISliderSwiftUI: UIViewRepresentable {
    @Binding var minValueSelected: CGFloat
    @Binding var maxValueSelected: CGFloat
    private let settings = RangeSliderSwiftUIViewSettings()
    
    func makeUIView(context: Context) -> RangeUISlider {
        let rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 20)))
        rangeSlider.delegate = context.coordinator
        rangeSlider.scaleMinValue = settings.scaleMinValue
        rangeSlider.scaleMaxValue = settings.scaleMaxValue
        rangeSlider.defaultValueLeftKnob = settings.defaultValueLeftKnob
        rangeSlider.defaultValueRightKnob = settings.defaultValueRightKnob
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
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(rangeSlider: self)
    }
    
    //MARK: modifiers
    
    func scaleMinValue(_ value: CGFloat) -> RangeUISliderSwiftUI {
        settings.scaleMinValue = value
        return self
    }
    
    func scaleMaxValue(_ value: CGFloat) -> RangeUISliderSwiftUI {
        settings.scaleMaxValue = value
        return self
    }
    
    func defaultValueLeftKnob(_ value: CGFloat) -> RangeUISliderSwiftUI {
        settings.defaultValueLeftKnob = value
        return self
    }
    
    func defaultValueRightKnob(_ value: CGFloat) -> RangeUISliderSwiftUI {
        settings.defaultValueRightKnob = value
        return self
    }
}

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
            RangeUISliderSwiftUI(minValueSelected: self.$minValueSelected, maxValueSelected: self.$maxValueSelected)
                .scaleMinValue(5)
                .scaleMaxValue(80)
                .defaultValueLeftKnob(10)
                .defaultValueRightKnob(40)
         }
     }
}

class SwiftUIHostingViewController: UIHostingController<SwiftUIHostingView> {    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIHostingView())
    }
}
