//
//  StringExtension.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/17.
//

import Foundation

extension String {
    func localised() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
