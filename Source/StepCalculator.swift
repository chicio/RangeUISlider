//
//  StepCalculator.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29.12.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation
import UIKit

class StepCalculator {
    func calculateNumberOfSteps(scale: CGFloat, stepIncrement: CGFloat) -> CGFloat {
        var numberOfStepsCalculated: CGFloat = 0
        if isAValidStepIncrement(scale: scale, stepIncrement: stepIncrement) {
            numberOfStepsCalculated = scale / stepIncrement
        }
        return numberOfStepsCalculated
    }

    func calculateStepWidth(barWidth: CGFloat, numberOfSteps: CGFloat) -> CGFloat {
        var stepWidthCalculated: CGFloat = 1.0
        if(stepIncrementIsNeeded(numberOfSteps: numberOfSteps)) {
            stepWidthCalculated = barWidth / numberOfSteps
        }
        return stepWidthCalculated
    }
    
    private func isAValidStepIncrement(scale: CGFloat, stepIncrement: CGFloat) -> Bool {
        return stepIncrement > 0 && stepIncrement <= scale
    }
    
    private func stepIncrementIsNeeded(numberOfSteps: CGFloat) -> Bool {
        return numberOfSteps > 0
    }
}
