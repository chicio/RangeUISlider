//
//  RangeUpdaterDelegate.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 16/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

protocol RangeUpdaterDelegate: AnyObject {
    func rangeChangeStarted()
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat)
    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat)
}
