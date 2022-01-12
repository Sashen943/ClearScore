//
//  DashboardRepositoryTests.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import XCTest

class DashboardRepositoryTests: XCTestCase {

    // MARK: Attribute(s)
    
    let mockedService = MockedCreditScoreService()
    var systemUnderTest: DashboardRepository?

    // MARK: Lifecycle
    
    override func setUp() {
        systemUnderTest = DashboardRepositoryImplementation(mockedService)
        super.setUp()
    }
    
    override func tearDown() {
        systemUnderTest = nil
        mockedService.verify()
        super.tearDown()
    }

    // MARK: Test(s)
    
    func testThatWhenFetchCreditScoreDataSucceedsThatTheCorrectDataIsReturned() {
        mockedService.expectFetchCreditScoreData()
        mockedService.setShould(succeed: true)
        
        systemUnderTest?.fetchCreditScore(completionHandler: { (result) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.creditReportInfo?.maxScoreValue, 700)
                XCTAssertEqual(response.creditReportInfo?.score, 514)
                XCTAssertEqual(response.creditReportInfo?.minScoreValue, 0)
                XCTAssertEqual(response.personaType, "INEXPERIENCED")
            case .failure(_):
                XCTFail("Should be successful call")
            }
        })
        
        mockedService.verify()
    }
    
    func testThatWhenFetchCreditScoreDataFailsThatAnErrorIsReturned() {
        mockedService.expectFetchCreditScoreData()
        mockedService.setShould(succeed: false)
        
        systemUnderTest?.fetchCreditScore(completionHandler: { (result) in
            switch result {
            case .success(_):
                XCTFail("Should be a failed call")
            case .failure(let error):
                let expectedResult = "The operation couldn’t be completed. (Simulated error error 0.)"
                XCTAssertEqual(error.localizedDescription, expectedResult)
            }
        })
        
        mockedService.verify()
    }

}
