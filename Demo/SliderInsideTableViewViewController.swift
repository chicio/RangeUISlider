//
//  SliderInsideTableViewViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 30/03/2019.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation
import UIKit
import RangeUISlider

class SliderInsideTableViewViewController: UITableViewController, RangeUISliderDelegate {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellWithSlider = tableView.dequeueReusableCell(withIdentifier: "CellWithSlider", for: indexPath) as! CellWithSlider
        cellWithSlider.rangeUISlider.delegate = self
        return cellWithSlider
    }
    
    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        tableView.isScrollEnabled = false
    }

    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        tableView.isScrollEnabled = true
    }
}
