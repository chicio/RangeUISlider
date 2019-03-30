//
//  SliderInsideTableViewViewController.swift
//  Demo
//
//  Created by Fabrizio Duroni on 30/03/2019.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation
import UIKit

class SliderInsideTableViewViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "CellWithSlider", for: indexPath)
    }
}
