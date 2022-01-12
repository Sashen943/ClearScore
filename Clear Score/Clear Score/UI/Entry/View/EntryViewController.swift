//
//  HomeViewController.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import UIKit

class EntryViewController: BaseViewController {
    
    // MARK: Dependencies
    
    private lazy var viewModel = EntryViewModel(self)
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var checkCreditScoreButton: UIButton!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
}

// MARK: EntryView Extension

extension EntryViewController: EntryView {
    
    func configureTitle(_ title: String) {
        self.setTitle(title)
    }
    
    func configureWelcomeLabel(_ title: String) {
        self.welcomeLabel.text = title
    }
    
    func configureLogoImageView(_ imageName: String) {
        let image = UIImage(named: imageName)
        self.logoImageView.image = image
    }
    
    func configureCheckCreditButton(_ title: String, _ action: Selector, _ target: Any) {
        checkCreditScoreButton.roundEdges()
        checkCreditScoreButton.setTitle(title, for: .normal)
        checkCreditScoreButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func navigateToDashboard() {
        let dashboardViewController = DashboardViewController()
        self.navigateToViewController(dashboardViewController)
    }
    
}
