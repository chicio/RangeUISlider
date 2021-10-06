//
//  ProgrammaticKnobChangeDelegate.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 02/02/21.
//  2021 Fabrizio Duroni.
//

import Foundation

protocol ProgrammaticKnobChangeDelegate: AnyObject {
    var properties: RangeUISliderProperties { get }
    func programmaticChangeCompleted()
}
