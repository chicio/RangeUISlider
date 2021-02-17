//
//  RangeUISliderSetup.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 01/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class RangeUISliderSetup {
    private unowned let components: RangeUISliderComponents

    init(components: RangeUISliderComponents) {
        self.components = components
    }

    func execute(
        barProperties: BarProperties,
        knobsProperties: KnobsProperties,
        progressViewsProperties: ProgressViewsProperties
    ) {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: components.bar.setup(
            properties: barProperties,
            leftKnob: components.knobs.leftKnob,
            rightKnob: components.knobs.rightKnob
        ))
        constraints.append(contentsOf: setUpKnobs(knobsProperties: knobsProperties))
        constraints.append(contentsOf: setupProgressViews(progressViewsProperties: progressViewsProperties))
        NSLayoutConstraint.activate(constraints)
    }

    private func setUpKnobs(knobsProperties: KnobsProperties) -> [NSLayoutConstraint] {
        return components.knobs.rightKnob.setup(properties: knobsProperties.rightKnobProperties) +
            components.knobs.leftKnob.setup(properties: knobsProperties.leftKnobProperties)
    }

    private func setupProgressViews(progressViewsProperties: ProgressViewsProperties) -> [NSLayoutConstraint] {
        return components.progressViews.selectedProgressView.setup(
            leftAnchorView: components.knobs.leftKnob,
            rightAnchorView: components.knobs.rightKnob,
            properties: progressViewsProperties.selectedProgressViewProperties
        ) +
        components.progressViews.leftProgressView.setup(
            leftAnchorView: components.bar,
            rightAnchorView: components.knobs.leftKnob,
            properties: progressViewsProperties.leftProgressViewProperties
        ) +
        components.progressViews.rightProgressView.setup(
            leftAnchorView: components.knobs.rightKnob,
            rightAnchorView: components.bar,
            properties: progressViewsProperties.rightProgressViewProperties
        )
    }
}
