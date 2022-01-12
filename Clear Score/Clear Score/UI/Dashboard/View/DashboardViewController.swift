//
//  DashboardViewController.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    // MARK: Attribute(s)
    
    
    // MARK: Dependencies
    
    private let repository = DashboardRepositoryImplementation(CreditScoreServiceImplementation())
    private lazy var viewModel = DashboardViewModel(self, repository)
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var doughnutView: CreditScoreDoughnut!
    @IBOutlet weak var hintLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewDidLoad()
        self.viewModel.fetchCreditScoreData()
    }
    
}

// MARK: DashboardView Extension

extension DashboardViewController: DashboardView {
    
    func configureTitle(_ title: String) {
        self.setTitle(title)
    }
    
    func configureHeading(_ title: String)  {
        self.headingLabel.text = title
    }
    
    func configureCreditScoreSection(_ score: Int,
                                     _ maxScore: Int,
                                     _ minScore: Int) {
        self.doughnutView.delegate = self
        self.doughnutView.setValues(score, maxScore)
    }
    
    func showLoadingIndicator() {
        self.showActivityIndicator()
    }
    
    func hideLoadingIndicator() {
        self.hideActivityIndiactor()
    }
    
    func showError(_ title: String,
                   _ subtitle: String,
                   _ buttonTitle: String,
                   _ action: Selector,
                   _ target: Any) {
        self.showErrorView(title,
                           subtitle,
                           buttonTitle,
                           action,
                           target)
    }
    
    func configureHintLabel(_ title: String) {
        self.hintLabel.text = title
    }
    
}

// MARK: DoughnutViewDelegate extension

extension DashboardViewController: DoughnutViewDelegate {
    func doughnutTapped() {
        let detailsViewController = DetailsViewController()
        self.navigateToViewController(detailsViewController)
    }
}
