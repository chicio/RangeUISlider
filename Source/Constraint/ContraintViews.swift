//
//  ContraintViews.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  Copyright © 2021 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ContraintViews {
    unowned let target: UIView
    unowned let relatedView: UIView?

    init(target: UIView, relatedView: UIView? = nil) {
        self.target = target
        self.relatedView = relatedView
    }
}
