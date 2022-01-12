//
//  EntryViewModelTests.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import XCTest

class EntryViewModelTests: XCTestCase {
    
    private var systemUnderTest: EntryViewModel?
    private var mockedView = MockedEntryView()
    
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
