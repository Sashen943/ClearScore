//
//  DetailsViewController.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var informationStackView: UIStackView!
    
    // MARK: Dependencies
    
    private let repository = DetailsRepositoryImplementation(CreditScoreServiceImplementation())
    private lazy var viewModel = DetailsViewModel(self, repository)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        viewModel.fetchCreditScoreData()
    }

}

// MARK: DetailsView Extension

extension DetailsViewController: DetailsView {
    func configureTitle(_ title: String) {
        self.setTitle(title)
    }
    
    func configureHeading(_ title: String) {
        self.headingLabel.text = title
    }
    
    func addCardViewToStack(_ title: String, _ description: String) {
        let cardView = CardListView()
        cardView.configureCard(title, description)
        self.informationStackView.addArrangedSubview(cardView)
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
    
    
}
