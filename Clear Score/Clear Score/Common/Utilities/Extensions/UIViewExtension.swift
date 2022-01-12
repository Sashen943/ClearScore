//
//  UIViewExtension.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation
import UIKit

extension UIView {
    func makeLightCard() {
        self.layer.cornerRadius = 20.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 2.5
        self.layer.shadowOpacity = 0.7
        self.backgroundColor = UIColor.white
    }
}
