//
//  EntryView.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

protocol EntryView: AnyObject {
    func configureTitle(_ title: String)
    func configureCheckCreditButton(_ title: String, _ action: Selector, _ target: Any)
    func navigateToDashboard()
}
