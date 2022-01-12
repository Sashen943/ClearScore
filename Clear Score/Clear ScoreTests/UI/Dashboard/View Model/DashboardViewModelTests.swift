//
//  DashboardViewModelTests.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import XCTest

class DashboardViewModelTests: XCTestCase {
    
    private let mockedView = MockedDashboardView()
    private let mockedRepository = MockedDashboardRepository()
    
    var systemUnderTest: DashboardViewModel?
    
    override func setUp() {
        systemUnderTest = DashboardViewModel(mockedView, mockedRepository)
    }
    
    func testThatWhenViewDidLoadIsCalledThatTheCorrectFunctionsAreInvoked() {
        mockedView.expectConfigureTitle()
        mockedView.expectConfigureHeading()
        mockedView.expectConfigureHintLabel()
        
        systemUnderTest?.viewDidLoad()
        
        mockedView.verify()
    }
    
    override func tearDown() {
        systemUnderTest = nil
    }
    
}

class MockedDashboardView: DashboardView {
    
    var configureTitleCount = 0
    
    func configureTitle(_ title: String) {
        configureTitleCount += 1
    }
    
    func expectConfigureTitle() {
        configureTitleCount -= 1
    }
    
    var configureHeadingCount = 0
    
    func configureHeading(_ title: String) {
        configureHeadingCount += 1
    }
    
    func expectConfigureHeading() {
        configureHeadingCount -= 1
    }
    
    var configureHintLabelCount = 0
    
    func configureHintLabel(_ title: String) {
        configureHeadingCount += 1
    }
    
    func expectConfigureHintLabel() {
        configureHeadingCount -= 1
    }
    
    var showLoadingIndicatorCount = 0
    
    func showLoadingIndicator() {
        showLoadingIndicatorCount += 1
    }
    
    func expectShowLoadingIndicator() {
        showLoadingIndicatorCount -= 1
    }
    
    var hideLoadingIndicatorCount = 0
    
    func hideLoadingIndicator() {
        hideLoadingIndicatorCount += 1
    }
    
    func expectHideLoadingIndicator() {
        hideLoadingIndicatorCount -= 1
    }
    
    var showErrorCount = 0
    
    func showError(_ title: String, _ subtitle: String, _ buttonTitle: String, _ action: Selector, _ target: Any) {
        showErrorCount += 1
    }
    
    func expectShowError() {
        showErrorCount -= 1
    }
    
    var configureCreditScoreSectionCount = 0
    
    func configureCreditScoreSection(_ score: Int, _ maxScore: Int, _ minScore: Int) {
        configureCreditScoreSectionCount += 1
    }
    
    func expectConfigureCreditScoreSection() {
        configureCreditScoreSectionCount -= 1
    }
    
    func verify() {
        XCTAssertEqual(configureCreditScoreSectionCount, 0)
        XCTAssertEqual(showErrorCount, 0)
        XCTAssertEqual(hideLoadingIndicatorCount, 0)
        XCTAssertEqual(showLoadingIndicatorCount, 0)
        XCTAssertEqual(configureHintLabelCount, 0)
        XCTAssertEqual(configureHeadingCount, 0)
        XCTAssertEqual(configureTitleCount, 0)
    }
    
}

class MockedDashboardRepository: DashboardRepository {
    
    private var shouldSucceed = true
    private var fetchCreditScoreCount = 0
    
    func setShould(succeed: Bool) {
        self.shouldSucceed = succeed
    }
    
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void) {
        fetchCreditScoreCount += 1
        if shouldSucceed {
            if let response = createCreditScoreResponse() {
                completionHandler(.success(response))
            } else {
                let error = NSError(domain: "Could not get response from json", code: 0, userInfo: nil)
                completionHandler(.failure(error))
            }
        } else {
            let error = NSError(domain: "Simulated error", code: 0, userInfo: nil)
            completionHandler(.failure(error))
        }
    }
    
    func expectFetchCreditScore() {
        fetchCreditScoreCount -= 1
    }
    
    private func createCreditScoreResponse() -> CreditScoreResponse? {
        if let data = SwiftTestDataGenerator.jsonDictionaryFrom(fileName: "CreditScoreResponse") {
            do {
                let creditScoreResponse = try JSONDecoder().decode(CreditScoreResponse.self, from: data)
                return creditScoreResponse
            } catch(_) {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func verify() {
        XCTAssertEqual(fetchCreditScoreCount, 0)
    }
}
