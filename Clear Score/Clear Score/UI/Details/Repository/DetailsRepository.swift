//
//  DetailsRepository.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

protocol DetailsRepository {
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void)
}
