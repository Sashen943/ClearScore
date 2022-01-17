//
//  DetailsViewModel.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

class DetailsViewModel {
    
    // MARK: Localised string(s)
    
    private let title = "Details.title".localised()
    private let errorMessage = "Details.errorMessage".localised()
    private let retryButtonTitle = "Details.retryButtonTitle".localised()
    private let headingLabel = "Details.headingLabel".localised()
    private let scoreTitle = "Details.scoreTitle".localised()
    private let scoreBandTitle = "Details.scoreBandTitle".localised()
    private let hasEverDefaultedTitle = "Details.hasEverDefaultedTitle".localised()
    private let yesLabel = "Details.yesLabel".localised()
    private let noLabel = "Details.noLabel".localised()
    private let daysTillNextReportTitle = "Details.daysTillNextReportTitle".localised()
    private let monthsSinceLastDefaultedTitle = "Details.monthsSinceLastDefaultedTitle".localised()
    private let monthsSinceLastDelinquentTitle = "Details.monthsSinceLastDelinquentTitle".localised()
    private let hasEverBeenDelinquentTitle = "Details.hasEverBeenDelinquentTitle".localised()
    private let currentShortTermDebtTitle = "Details.currentShortTermDebtTitle".localised()
    private let currentLongTermDebtTitle = "Details.currentLongTermDebtTitle".localised()
    private let currency = "Details.currency".localised()
    
    // MARK: Dependencies
    
    private weak var view: DetailsView?
    private let repository: DetailsRepository?
    
    // MARK: Attribute(s)
    
    private var creditScoreResponse: CreditScoreResponse?
    
    // MARK: Constructor(s)
    
    init(_ view: DetailsView, _ repository: DetailsRepository) {
        self.view = view
        self.repository = repository
    }
    
    // MARK: Method(s)
    
    func viewDidLoad() {
        self.view?.configureTitle(title)
        self.view?.configureHeading(headingLabel)
    }
    
    @objc func fetchCreditScoreData() {
        self.view?.showLoadingIndicator()
        AsynchronousProvider.runOnConcurrent({
            self.repository?.fetchCreditScore { (result) in
                switch result {
                case .success(let response):
                    self.creditScoreResponse = response
                    self.handleThatFetchCreditScoreDataIsSuccesful()
                case .failure(let error):
                    self.handleThatFetchCreditScoreDataFails(error)
                }
            }
        }, .userInitiated)
    }
    
    func handleThatFetchCreditScoreDataIsSuccesful() {
        AsynchronousProvider.runOnMain {
            self.displayScore()
            self.displayScoreBand()
            self.displayHasEverDefaulted()
            self.displayMonthsSinceLastDefault()
            self.displayHasEverBeenhasEverBeenDelinquent()
            self.displayMonthsSinceLastDelinquent()
            self.displayShortTermDebt()
            self.displayLongTermDebt()
            self.displayDaysTillNextReport()
            self.view?.hideLoadingIndicator()
        }
    }
    
    func handleThatFetchCreditScoreDataFails(_ error: Error) {
        AsynchronousProvider.runOnMain {
            self.view?.hideLoadingIndicator()
            let subtitle = error.localizedDescription
            self.view?.showError(self.errorMessage,
                                 subtitle,
                                 self.retryButtonTitle,
                                 #selector(self.fetchCreditScoreData),
                                 self)
        }
    }
    
    private func displayScore() {
        let score = "\(self.creditScoreResponse?.creditReportInfo?.score ?? 0)"
        self.view?.addCardViewToStack(scoreTitle, score)
    }
    
    private func displayScoreBand() {
        let scoreBand = "\(self.creditScoreResponse?.creditReportInfo?.scoreBand ?? 0)"
        self.view?.addCardViewToStack(scoreBandTitle, scoreBand)
    }
    
    private func displayHasEverDefaulted() {
        let hasDefaulted = self.creditScoreResponse?.creditReportInfo?.hasEverDefaulted ?? false ? yesLabel : noLabel
        self.view?.addCardViewToStack(hasEverDefaultedTitle, hasDefaulted)
    }
    
    private func displayDaysTillNextReport() {
        let days = "\(self.creditScoreResponse?.creditReportInfo?.daysUntilNextReport ?? 0)"
        self.view?.addCardViewToStack(daysTillNextReportTitle, days)
    }
    
    private func displayMonthsSinceLastDefault() {
        let months = "\(self.creditScoreResponse?.creditReportInfo?.monthsSinceLastDefaulted ?? 0)"
        self.view?.addCardViewToStack(monthsSinceLastDefaultedTitle, months)
    }
    
    private func displayMonthsSinceLastDelinquent() {
        let months = "\(self.creditScoreResponse?.creditReportInfo?.monthsSinceLastDelinquent ?? 0)"
        self.view?.addCardViewToStack(monthsSinceLastDelinquentTitle, months)
    }
    
    private func displayHasEverBeenhasEverBeenDelinquent() {
        let hasEverBeenDelinquent = self.creditScoreResponse?.creditReportInfo?.hasEverBeenDelinquent ?? false ? yesLabel : noLabel
        self.view?.addCardViewToStack( hasEverBeenDelinquentTitle, hasEverBeenDelinquent)
    }
    
    private func displayShortTermDebt() {
        let debt = "\(currency)\(self.creditScoreResponse?.creditReportInfo?.currentShortTermDebt ?? 0)"
        self.view?.addCardViewToStack(currentShortTermDebtTitle, debt)
    }
    
    private func displayLongTermDebt() {
        let debt = "\(currency)\(self.creditScoreResponse?.creditReportInfo?.currentLongTermDebt ?? 0)"
        self.view?.addCardViewToStack(currentLongTermDebtTitle, debt)
    }
    
    
}
