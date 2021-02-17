//
//  StepCalculator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29.12.20.
//  2020 Fabrizio Duroni.
//

import Foundation
import UIKit

class StepCalculator {
    func calculateStepWidth(stepIncrement: CGFloat, scale: Scale, barWidth: CGFloat) -> CGFloat {
        let numberOfSteps = calculateNumberOfSteps(scale: scale.scale, stepIncrement: stepIncrement)
        if stepIncrementIsNeeded(numberOfSteps: numberOfSteps) {
            return barWidth / numberOfSteps
        } else {
            return 1.0
        }
    }

    private func calculateNumberOfSteps(scale: CGFloat, stepIncrement: CGFloat) -> CGFloat {
        var numberOfStepsCalculated: CGFloat = 0
        if isAValidStepIncrement(scale: scale, stepIncrement: stepIncrement) {
            numberOfStepsCalculated = scale / stepIncrement
        }
        return numberOfStepsCalculated
    }

    private func isAValidStepIncrement(scale: CGFloat, stepIncrement: CGFloat) -> Bool {
        return stepIncrement > 0 && stepIncrement <= scale
    }

    private func stepIncrementIsNeeded(numberOfSteps: CGFloat) -> Bool {
        return numberOfSteps > 0
    }
}
