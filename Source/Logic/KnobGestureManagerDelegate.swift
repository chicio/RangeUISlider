//
//  KnobGestureManagerDelegate.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 03/02/21.
//  2021 Fabrizio Duroni.
//

import Foundation

protocol KnobGestureManagerDelegate: class {
    func rangeChangeStarted()
    func rangeSelectionUpdate()
    func rangeSelectionFinished()
}
