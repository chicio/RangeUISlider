//
//  ContraintViews.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/01/21.
//  Copyright © 2021 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ContraintViews {
    unowned let target: UIView
    unowned let parent: UIView?

    init(target: UIView, parent: UIView? = nil) {
        self.target = target
        self.parent = parent
    }
}
