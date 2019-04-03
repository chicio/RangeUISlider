//
//  GourpedFeaturesTableTableViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 01/04/2017.
//  Copyright © 2017 Fabrizio Duroni. All rights reserved.
//

import UIKit

struct GroupedFeaturesViewControllerData {
    let description: String
    let segueIdentifier: String
    
    init(description aDescription: String, segueIdentifier aSegueIdentifier: String) {
        description = aDescription
        segueIdentifier = aSegueIdentifier
    }
}

class GroupedFeaturesTableViewController: UITableViewController {
    let data: [GroupedFeaturesViewControllerData] = [
        GroupedFeaturesViewControllerData(description: "Only colors", segueIdentifier: "showOnlyColorsSegue"),
        GroupedFeaturesViewControllerData(description: "Only images", segueIdentifier: "showOnlyImagesSegue"),
        GroupedFeaturesViewControllerData(description: "Only gradients", segueIdentifier: "showOnlyGradientsSegue"),
        GroupedFeaturesViewControllerData(description: "Programmatic setup", segueIdentifier: "showProgrammaticSetupSegue"),
        GroupedFeaturesViewControllerData(description: "Inside UITableView", segueIdentifier: "showTableViewSetupSegue")
    ]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupedFeaturesCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: data[indexPath.row].segueIdentifier, sender: self)
    }
}
