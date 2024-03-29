//
//  DashboardViewModelTests.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import XCTest

class DashboardViewModelTests: XCTestCase {
    
    // MARK: Mock(s)
    
    private let mockedView = MockedDashboardView()
    private let mockedRepository = MockedDashboardRepository()
    
    // MARK: System under test
    
    var systemUnderTest: DashboardViewModel?
    
    // MARK: Lifecycle
    
    override func setUp() {
        systemUnderTest = DashboardViewModel(mockedView, mockedRepository)
        AsynchronousProvider.setAsyncRunner(DummyAsynchronousRunner())
    }
    
    override func tearDown() {
        systemUnderTest = nil
        mockedView.verify()
        mockedRepository.verify()
        AsynchronousProvider.reset()
        super.tearDown()
    }
    
    // MARK: Test(s)
    
    func testThatWhenViewDidLoadIsCalledThatTheCorrectFunctionsAreInvoked() {
        mockedView.expectConfigureTitle()
        mockedView.expectConfigureHeading()
        mockedView.expectConfigureHintLabel()
        
        systemUnderTest?.viewDidLoad()
        
        mockedView.verify()
    }
    
    func testThatWhenFetchCreditScoreDataSucceedsThatItIsHandledCorrectly() {
        mockedView.expectShowLoadingIndicator()
        mockedView.expectHideLoadingIndicator()
        mockedView.expectConfigureCreditScoreSection()
        
        mockedRepository.expectFetchCreditScore()
        mockedRepository.setShould(succeed: true)
        
        systemUnderTest?.fetchCreditScoreData()
        
        mockedRepository.verify()
        mockedView.verify()
    }
    
    func testThatWhenFetchCreditScoreDataFailsThatItIsHandledCorrectly() {
        mockedView.expectShowLoadingIndicator()
        mockedView.expectHideLoadingIndicator()
        mockedView.expectShowError()
        
        mockedRepository.expectFetchCreditScore()
        mockedRepository.setShould(succeed: false)
        
        systemUnderTest?.fetchCreditScoreData()
        
        mockedView.verify()
        mockedRepository.verify()
    }
    
}
