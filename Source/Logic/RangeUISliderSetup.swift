//
//  RangeUISliderSetup.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 01/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

class RangeUISliderSetup {
    private unowned let bar: Bar
    private unowned let knobs: Knobs
    private unowned let progressViews: ProgressViews

    init(bar: Bar, knobs: Knobs, progressViews: ProgressViews) {
        self.bar = bar
        self.knobs = knobs
        self.progressViews = progressViews
    }

    func execute(
        barProperties: BarProperties,
        knobsProperties: KnobsProperties,
        progressViewsProperties: ProgressViewsProperties
    ) {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: bar.setup(
            properties: barProperties,
            leftKnob: knobs.leftKnob,
            rightKnob: knobs.rightKnob
        ))
        constraints.append(contentsOf: setUpKnobs(knobsProperties: knobsProperties))
        constraints.append(contentsOf: setupProgressViews(progressViewsProperties: progressViewsProperties))
        NSLayoutConstraint.activate(constraints)
    }

    private func setUpKnobs(knobsProperties: KnobsProperties) -> [NSLayoutConstraint] {
        return knobs.rightKnob.setup(properties: knobsProperties.rightKnobProperties) +
        knobs.leftKnob.setup(properties: knobsProperties.leftKnobProperties)
    }

    private func setupProgressViews(progressViewsProperties: ProgressViewsProperties) -> [NSLayoutConstraint] {
        return progressViews.selectedProgressView.setup(
            leftAnchorView: knobs.leftKnob,
            rightAnchorView: knobs.rightKnob,
            properties: progressViewsProperties.selectedProgressViewProperties
        ) +
        progressViews.leftProgressView.setup(
            leftAnchorView: bar,
            rightAnchorView: knobs.leftKnob,
            properties: progressViewsProperties.leftProgressViewProperties
        ) +
        progressViews.rightProgressView.setup(
            leftAnchorView: knobs.rightKnob,
            rightAnchorView: bar,
            properties: progressViewsProperties.rightProgressViewProperties
        )
    }
}
