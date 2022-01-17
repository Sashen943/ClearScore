//
//  EntryViewModel.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

class EntryViewModel {
    
    // MARK: Localised String(s)
    
    private let title = "Entry.title".localised()
    private let checkCreditScoreButtonTitle = "Entry.checkCreditScoreButtonTitle".localised()
    private let welcomeMessage = "Entry.welcomeMessage".localised()
    private let logoImageName = "Entry.logoImageName".localised()
    
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
