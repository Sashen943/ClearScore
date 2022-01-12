//
//  EntryViewModel.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

class EntryViewModel {
    
    // MARK: Localised String(s)
    
    private let title = "Clear score"
    private let checkCreditScoreButtonTitle = "Check credit score"
    private let welcomeMessage = "Hi there ✌️\nLet's get you started"
    private let logoImageName = "clear_score_logo"
    
    // MARK: Dependencies
    
    private weak var view: EntryView?
    
    // MARK: Constructor(s)
    
    init(_ view: EntryView) {
        self.view = view
    }
    
    // MARK: Method(s)
    
    func viewDidLoad() {
        self.view?.configureTitle(title)
        self.view?.configureWelcomeLabel(welcomeMessage)
        self.view?.configureLogoImageView(logoImageName)
        self.view?.configureCheckCreditButton(checkCreditScoreButtonTitle,
                                              #selector(self.checkCreditScoreButtonTapped),
                                              self)
    }
    
    @objc func checkCreditScoreButtonTapped() {
        self.view?.navigateToDashboard()
    }
}
