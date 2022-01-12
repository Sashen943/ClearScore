//
//  CreditReportInfo.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

struct CreditReportInfomation: Codable {
    let score: Int?
    let scoreBand: Int?
    let clientRef: String?
    let status: String?
    let maxScoreValue: Int?
    let minScoreValue: Int?
    let monthsSinceLastDefaulted: Int?
    let hasEverDefaulted: Bool?
    let monthsSinceLastDelinquent: Int?
    let hasEverBeenDelinquent: Bool?
    let percentageCreditUsed: Int?
    let percentageCreditUsedDirectionFlag: Int?
    let changedScore: Int?
    let currentShortTermDebt: Int?
    let currentShortTermNonPromotionalDebt: Int?
    let currentShortTermCreditLimit: Int?
    let currentShortTermCreditUtilisation: Int?
    let changeInShortTermDebt: Int?
    let currentLongTermDebt: Int?
    let currentLongTermNonPromotionalDebt: Int?
    let currentLongTermCreditLimit: String?
    let currentLongTermCreditUtilisation: String?
    let changeInLongTermDebt: Int?
    let numPositiveScoreFactors: Int?
    let numNegativeScoreFactors: Int?
    let equifaxScoreBand: Int?
    let equifaxScoreBandDescription: String?
    let daysUntilNextReport: Int?
}
