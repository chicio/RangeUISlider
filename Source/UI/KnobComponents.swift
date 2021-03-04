//
//  KnobComponents.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 24/02/21.
//  2021 Fabrizio Duroni.
//

import UIKit

/**
 A class that contains all the UI components of `Knob`.
 */
public class KnobComponents {
    /// The knob label. See `KnobLabel` class.
    public lazy var knobLabel: KnobLabel = KnobLabel()

    let backgroundView: UIView = UIView()
    lazy var imageView: UIImageView = UIImageView()
}
