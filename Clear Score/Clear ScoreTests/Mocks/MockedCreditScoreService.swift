//
//  MockedCreditScoreService.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation
import XCTest

class MockedCreditScoreService: CreditScoreService {
    
    private var shouldSucceed = true
    private var fetchCreditScoreDataCount = 0
    
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void) {
        fetchCreditScoreDataCount += 1
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
    
    func expectFetchCreditScoreData() {
        fetchCreditScoreDataCount -= 1
    }
    
    func setShould(succeed: Bool) {
        self.shouldSucceed = succeed
    }
    
    func verify() {
        XCTAssertEqual(fetchCreditScoreDataCount, 0)
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
    
}
