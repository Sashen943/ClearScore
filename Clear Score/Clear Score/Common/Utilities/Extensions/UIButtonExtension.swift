//
//  UIButtonExtension.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation
import UIKit

extension UIButton {
    func roundEdges() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
