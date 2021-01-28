//
//  SliderInsideTableViewViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 30/03/2019.
//  2019 Fabrizio Duroni.
//

// swiftlint:disable force_cast

import Foundation
import UIKit
import RangeUISlider

class SliderInsideTableViewViewController: UITableViewController, RangeUISliderDelegate {
    private weak var minValueSelectedLabel: UILabel?
    private weak var maxValueSelectedLabel: UILabel?

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellWithSlider = tableView.dequeueReusableCell(
            withIdentifier: "CellWithSlider",
            for: indexPath
        ) as! CellWithSlider
        cellWithSlider.rangeUISlider.delegate = self
        minValueSelectedLabel = cellWithSlider.minValueSelectedLabel
        maxValueSelectedLabel = cellWithSlider.maxValueSelectedLabel
        return cellWithSlider
    }

    func rangeChangeStarted() {
        tableView.isScrollEnabled = false
    }

    func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        print("values \(minValueSelected) - \(maxValueSelected)")
    }

    func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        tableView.isScrollEnabled = true
        minValueSelectedLabel?.text = minValueSelected.description
        maxValueSelectedLabel?.text = maxValueSelected.description
    }
}
