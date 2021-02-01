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
        constraints.append(contentsOf: knobs.rightKnob.setup(properties: knobsProperties.rightKnobProperties))
        constraints.append(contentsOf: knobs.leftKnob.setup(properties: knobsProperties.leftKnobProperties))
        constraints.append(contentsOf: progressViews.selectedProgressView.setup(
            leftAnchorView: knobs.leftKnob,
            rightAnchorView: knobs.rightKnob,
            properties: progressViewsProperties.selectedProgressViewProperties
        ))
        constraints.append(contentsOf: progressViews.leftProgressView.setup(
            leftAnchorView: bar,
            rightAnchorView: knobs.leftKnob,
            properties: progressViewsProperties.leftProgressViewProperties
        ))
        constraints.append(contentsOf: progressViews.rightProgressView.setup(
            leftAnchorView: knobs.rightKnob,
            rightAnchorView: bar,
            properties: progressViewsProperties.rightProgressViewProperties
        ))
        NSLayoutConstraint.activate(constraints)
    }
}
