//
//  EntryViewModelTests.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import XCTest

class EntryViewModelTests: XCTestCase {
    
    // MARK: System under test
    
    private var systemUnderTest: EntryViewModel?
    
    // MARK: Mock(s)
    
    private var mockedView = MockedEntryView()
    
    // MARK: Lifecycle
    
    override  func setUp() {
        systemUnderTest = EntryViewModel(mockedView)
        AsynchronousProvider.setAsyncRunner(DummyAsynchronousRunner())
        super.setUp()
    }
    
    override func tearDown() {
        mockedView.verify()
        systemUnderTest = nil
        AsynchronousProvider.reset()
        super.tearDown()
    }
    
    // MARK: Test(s)
    
    func testThatWhenViewDidLoadIsCalledThatTheCorrectFunctionsAreInvoked() {
        mockedView.expectConfigureTitle()
        mockedView.expectConfigureWelcomeLabel()
        mockedView.expectConfigureLogoImageView()
        mockedView.expectConfigureCheckCreditButton()
        
        systemUnderTest?.viewDidLoad()
        
        mockedView.verify()
    }
    
    func testThatWhenCheckCreditScoreButtonIsTappedThatNavigateToDashboardIsCalled() {
        mockedView.expectNavigateToDashboard()
        
        systemUnderTest?.checkCreditScoreButtonTapped()
        
        mockedView.verify()
    }
    
}
