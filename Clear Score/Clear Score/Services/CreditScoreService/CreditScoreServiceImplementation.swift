//
//  CreditScoreServiceImplementation.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation
import Alamofire

class CreditScoreServiceImplementation: CreditScoreService {
    
    // MARK: Endpoint
    
    private let endpoint = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    
    // MARK: Error(s)
    
    private let genericError = NSError(domain: "Unknown error", code: 0, userInfo: nil)
    
    // MARK: Method(s)
    
    func fetchCreditScore(completionHandler: @escaping (Result<CreditScoreResponse, Error>) -> Void) {
        AF.request(endpoint).responseDecodable(of: CreditScoreResponse.self) { response in
            if let error = response.error { completionHandler(.failure(error)) }
            guard let data = response.data else {
                completionHandler(.failure(self.genericError))
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
