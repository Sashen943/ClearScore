//
//  MockedDashboardView.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation
import XCTest

class MockedDashboardView: DashboardView {
    
    var configureTitleCount = 0
    
    func configureTitle(_ title: String) {
        configureTitleCount += 1
    }
    
    func expectConfigureTitle() {
        configureTitleCount -= 1
    }
    
    var configureHeadingCount = 0
    
    func configureHeading(_ title: String) {
        configureHeadingCount += 1
    }
    
    func expectConfigureHeading() {
        configureHeadingCount -= 1
    }
    
    var configureHintLabelCount = 0
    
    func configureHintLabel(_ title: String) {
        configureHeadingCount += 1
    }
    
    func expectConfigureHintLabel() {
        configureHeadingCount -= 1
    }
    
    var showLoadingIndicatorCount = 0
    
    func showLoadingIndicator() {
        showLoadingIndicatorCount += 1
    }
    
    func expectShowLoadingIndicator() {
        showLoadingIndicatorCount -= 1
    }
    
    var hideLoadingIndicatorCount = 0
    
    func hideLoadingIndicator() {
        hideLoadingIndicatorCount += 1
    }
    
    func expectHideLoadingIndicator() {
        hideLoadingIndicatorCount -= 1
    }
    
    var showErrorCount = 0
    
    func showError(_ title: String, _ subtitle: String, _ buttonTitle: String, _ action: Selector, _ target: Any) {
        showErrorCount += 1
    }
    
    func expectShowError() {
        showErrorCount -= 1
    }
    
    var configureCreditScoreSectionCount = 0
    
    func configureCreditScoreSection(_ score: Int, _ maxScore: Int, _ minScore: Int) {
        configureCreditScoreSectionCount += 1
    }
    
    func expectConfigureCreditScoreSection() {
        configureCreditScoreSectionCount -= 1
    }
    
    func verify() {
        XCTAssertEqual(configureCreditScoreSectionCount, 0)
        XCTAssertEqual(showErrorCount, 0)
        XCTAssertEqual(hideLoadingIndicatorCount, 0)
        XCTAssertEqual(showLoadingIndicatorCount, 0)
        XCTAssertEqual(configureHintLabelCount, 0)
        XCTAssertEqual(configureHeadingCount, 0)
        XCTAssertEqual(configureTitleCount, 0)
    }
    
}
