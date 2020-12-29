//
//  CellWithSlider.swift
//  Demo
//
//  Created by Fabrizio Duroni on 30/03/2019.
//  2019 Fabrizio Duroni.
//

import Foundation
import UIKit
import RangeUISlider

class CellWithSlider: UITableViewCell {
    @IBOutlet weak var rangeUISlider: RangeUISlider!
    @IBOutlet weak var minValueSelectedLabel: UILabel!
    @IBOutlet weak var maxValueSelectedLabel: UILabel!
}
