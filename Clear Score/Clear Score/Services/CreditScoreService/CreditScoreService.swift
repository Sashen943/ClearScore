//
//  CreditScoreService.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

protocol CreditScoreService {
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void)
}
