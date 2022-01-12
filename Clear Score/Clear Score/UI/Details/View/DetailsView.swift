//
//  DetailsView.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

protocol DetailsView: AnyObject {
    func configureTitle(_ title: String)
    func configureHeading(_ title: String)
    func addCardViewToStack(_ title: String, _ description: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showError(_ title: String,
                   _ subtitle: String,
                   _ buttonTitle: String,
                   _ action: Selector,
                   _ target: Any)
}
