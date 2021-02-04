//
//  RangeSlider.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 06.01.21.
//  2021 Fabrizio Duroni.
//

#if canImport(SwiftUI)
import SwiftUI

/**
 RangeUISlider SwiftUI implementation using UIViewRepresentable. It exposes all the RangeUIslider properties.
 */
@available(iOS 14.0, *)
public struct RangeSlider: UIViewRepresentable {
    /// Min value selected binding value.
    /// In this property the min value selected will be exposed. It will be updated during dragging.
    @Binding public var minValueSelected: CGFloat
    /// Max value selected binding value.
    /// In this property the max value selected will be exposed. It will be updated during dragging.
    @Binding public var maxValueSelected: CGFloat
    let settings: RangeSliderSettings
    private let rangeUISliderCreator: RangeUISliderCreator

    /**
     Init RangeSlider.
     
     - parameter minValueSelected: the binding value to get the min value selected.
     - parameter maxValueSelected: the binding value to get the max value selected.
     */
    public init(minValueSelected: Binding<CGFloat>, maxValueSelected: Binding<CGFloat>) {
        self._minValueSelected = minValueSelected
        self._maxValueSelected = maxValueSelected
        self.settings = RangeSliderSettings()
        self.rangeUISliderCreator = RangeUISliderCreator()
    }

    // MARK: lifecycle

    /**
     Implementation of `UIViewRepresentable.makeUIView(context: Context)` method.
     
     - parameter content: the SwiftUI context.
     
     - returns: an instance of RangeUISlider
     */
    public func makeUIView(context: Context) -> RangeUISlider {
        let rangeSlider = rangeUISliderCreator.createFrom(settings: settings)
        rangeSlider.delegate = context.coordinator
        return rangeSlider
    }

    /**
     Implementation of `UIViewRepresentable.updateUIView(_ uiView: RangeUISlider, context: Context)` method.
     
     - parameter uiView: the `RangeUISlider` instance.
     - parameter content: the SwiftUI context.
     */
    public func updateUIView(_ uiView: RangeUISlider, context: Context) { }

    /**
     Implementation of  `UIViewRepresentable.makeCoordinator()` method.
     
     - returns: an instance of `RangeSliderCoordinator`
     */
    public func makeCoordinator() -> RangeSliderCoordinator {
        return RangeSliderCoordinator(rangeSlider: self)
    }
}
#endif
