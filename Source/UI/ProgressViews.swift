//
//  ProgressViews.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 01/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

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

    func addBackgroundToNotSelectedProgressViews(image: UIImage?, edgeInset: UIEdgeInsets, barCorners: CGFloat) {
        if let backgroundImage = image {
            leftProgressView.addBackground(
                image: backgroundImage,
                edgeInset: edgeInset,
                corners: barCorners
            )
            rightProgressView.addBackground(
                image: backgroundImage,
                edgeInset: edgeInset,
                corners: barCorners
            )
        }
    }

    func addBackgroundToSelectedProgressViews(image: UIImage?, edgeInset: UIEdgeInsets, barCorners: CGFloat) {
        if let backgroundImage = image {
            selectedProgressView.addBackground(
                image: backgroundImage,
                edgeInset: edgeInset,
                corners: barCorners
            )
        }
    }
}
