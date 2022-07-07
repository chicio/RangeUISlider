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

    func rangeChangeFinished(event: RangeUISliderChangeFinishedEvent) {
        tableView.isScrollEnabled = true
        minValueSelectedLabel?.text = event.minValueSelected.description
        maxValueSelectedLabel?.text = event.maxValueSelected.description
    }

    func rangeIsChanging(event: RangeUISliderChangeEvent) {
        print("min: \(event.minValueSelected) -  max: \(event.maxValueSelected) - identifier: \(event.slider.identifier)")
    }
}
