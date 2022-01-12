//
//  DetailsRepositoryImplementation.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

class DetailsRepositoryImplementation: DetailsRepository {
    
    // MARK: Dependencies
    
    private let service: CreditScoreService
    
    // MARK: Contructor(s)
    
    init(_ service: CreditScoreService) {
        self.service = service
    }
    
    // MARK: Method(s)
    
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void) {
        service.fetchCreditScore { (result) in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
