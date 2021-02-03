//
//  KnobsPropertiesFactory.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 01/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class KnobsPropertiesBuilder {
    private let target: UIView
    private let leftKnobSelector: Selector
    private let rightKnobSelector: Selector
    private var leftKnobWidth: CGFloat = 0.0
    private var leftKnobHeight: CGFloat = 0.0
    private var rightKnobWidth: CGFloat = 0.0
    private var rightKnobHeight: CGFloat = 0.0

    init(target: UIView, leftKnobSelector: Selector, rightKnobSelector: Selector) {
        self.target = target
        self.leftKnobSelector = leftKnobSelector
        self.rightKnobSelector = rightKnobSelector
    }

    func leftKnobWidth(_ value: CGFloat) -> KnobsPropertiesBuilder {
        leftKnobWidth = value
        return self
    }

    func leftKnobHeight(_ value: CGFloat) -> KnobsPropertiesBuilder {
        leftKnobHeight = value
        return self
    }

    func rightKnobWidth(_ value: CGFloat) -> KnobsPropertiesBuilder {
        rightKnobWidth = value
        return self
    }

    func rightKnobHeight(_ value: CGFloat) -> KnobsPropertiesBuilder {
        rightKnobHeight = value
        return self
    }

    func build() -> KnobsProperties {
        return KnobsProperties(
            leftKnobProperties: KnobProperties(
                accessibilityIdentifier: "LeftKnob",
                position: .left,
                dimensions: Dimensions(width: leftKnobWidth, height: leftKnobHeight),
                gesture: KnobGesturesProperties(target: target, selector: leftKnobSelector)
            ),
            rightKnobProperties: KnobProperties(
                accessibilityIdentifier: "RightKnob",
                position: .right,
                dimensions: Dimensions(width: rightKnobWidth, height: rightKnobHeight),
                gesture: KnobGesturesProperties(target: target, selector: rightKnobSelector)
            )
        )
    }
}
