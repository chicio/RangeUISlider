//
//  ProgressViews.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 01/02/21.
//  2021 Fabrizio Duroni.
//

import Foundation

class ProgressViews {
    let selectedProgressView: Progress
    let leftProgressView: Progress
    let rightProgressView: Progress

    init(selectedProgressView: Progress, leftProgressView: Progress, rightProgressView: Progress) {
        self.selectedProgressView = selectedProgressView
        self.leftProgressView = leftProgressView
        self.rightProgressView = rightProgressView
    }

    func addGradientToNotSelectedProgressView(properties: GradientProperties) {
        leftProgressView.addGradient(properties: properties)
        rightProgressView.addGradient(properties: properties)
    }
}
