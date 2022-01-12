//
//  DashboardView.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

protocol DashboardView: AnyObject {
    func configureTitle(_ title: String)
    func configureHeading(_ title: String)
    func configureHintLabel(_ title: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showError(_ title: String,
                   _ subtitle: String,
                   _ buttonTitle: String,
                   _ action: Selector,
                   _ target: Any)
    func configureCreditScoreSection(_ score: Int,
                                     _ maxScore: Int,
                                     _ minScore: Int)
}
