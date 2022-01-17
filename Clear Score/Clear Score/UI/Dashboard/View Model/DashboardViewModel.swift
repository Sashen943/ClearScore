//
//  DahsboardViewModel.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

class DashboardViewModel {
    
    // MARK: Localised string(s)
    
    private let title = "Dashboard.title".localised()
    private let errorMessage = "Dashboard.errorMessage".localised()
    private let retryButtonTitle = "Dashboard.retryButtonTitle".localised()
    private let headingLabel = "Dashboard.headingLabel".localised()
    private let hintLabel = "Dashboard.hintLabel".localised()
    
    // MARK: Dependencies
    
    private weak var view: DashboardView?
    private let repository: DashboardRepository?
    
    // MARK: Attribute(s)
    
    private var creditScoreResponse: CreditScoreResponse?
    
    // MARK: Constructor(s)
    
    init(_ view: DashboardView, _ repository: DashboardRepository) {
        self.view = view
        self.repository = repository
    }
    
    // MARK: Method(s)
    
    func viewDidLoad() {
        self.view?.configureTitle(title)
        self.view?.configureHeading(headingLabel)
        self.view?.configureHintLabel(hintLabel)
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
            self.configureCreditScoreSection()
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
    
    private func configureCreditScoreSection() {
        let score = self.creditScoreResponse?.creditReportInfo?.score ?? 0
        let maxValue = self.creditScoreResponse?.creditReportInfo?.maxScoreValue ?? 0
        let minValue = self.creditScoreResponse?.creditReportInfo?.minScoreValue ?? 0
        self.view?.configureCreditScoreSection(score, maxValue, minValue)
    }
    
    
}
