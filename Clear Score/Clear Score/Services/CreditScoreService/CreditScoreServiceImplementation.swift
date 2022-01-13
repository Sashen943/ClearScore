//
//  CreditScoreServiceImplementation.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation
import Alamofire

class CreditScoreServiceImplementation: CreditScoreService {
    
    // MARK: Attribute(s)
    
    private let endpoint = Endpoints.creditScoreEndPoint
    
    // MARK: Method(s)
    
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void) {
        AF.request(endpoint).responseDecodable(of: CreditScoreResponse.self) { response in
            if let error = response.error { completionHandler(.failure(error)) }
            guard let data = response.data else {
                completionHandler(.failure(Errors.genericServiceError))
                return
            }
            do {
                let creditScoreResponse = try JSONDecoder().decode(CreditScoreResponse.self, from: data)
                completionHandler(.success(creditScoreResponse))
            } catch(let error) {
                completionHandler(.failure(error))
            }
        }
    }
}
