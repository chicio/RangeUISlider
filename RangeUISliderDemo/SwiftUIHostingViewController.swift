//
//  SwiftUIHostingViewController.swift
//  RangeUISliderDemo
//
//  Created by Fabrizio Duroni on 04.01.21.
//  2021 Fabrizio Duroni.
//

import SwiftUI

struct SwiftUIHostingView: View {
    var body: some View {
         VStack {
             Text("Second View").font(.system(size: 36))
             Text("Loaded by SecondView").font(.system(size: 14))
         }
     }
}

class SwiftUIHostingViewController: UIHostingController<SwiftUIHostingView> {    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIHostingView())
    }
}
