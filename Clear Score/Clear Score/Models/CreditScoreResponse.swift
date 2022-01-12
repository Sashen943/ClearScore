//
//  CreditScoreResponse.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

struct CreditScoreResponse: Codable {
    let accountIDVStatus: String?
    let creditReportInfo: CreditReportInfomation?
    let dashboardStatus: String?
    let personaType: String?
    let coachingSummary: CoachingSummary?
    let augmentedCreditScore: String?
}
