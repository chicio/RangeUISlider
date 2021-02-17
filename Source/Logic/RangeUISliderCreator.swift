//
//  RangeUISliderCreator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 30/01/21.
//  2021 Fabrizio Duroni.
//

import UIKit

@available(iOS 14.0, *)
class RangeUISliderCreator {
    func createFrom(settings: RangeSliderSettings) -> RangeUISlider {
        let rangeSlider = RangeUISlider(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 20)))
        let mirror = Mirror(reflecting: rangeSlider)

        for child in mirror.children {
            if let propertyName = child.label {
                assignValueTo(rangeSlider: rangeSlider, propertyName: propertyName, using: settings)
            }
        }

        return rangeSlider
    }

    private func assignValueTo(rangeSlider: RangeUISlider, propertyName: String, using settings: RangeSliderSettings) {
        if let value = settings.values[propertyName] {
            rangeSlider.setValue(value, forKey: propertyName)
        }
    }
}
