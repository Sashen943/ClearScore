//
//  MockedEntryView.swift
//  Clear ScoreTests
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation
import XCTest

class MockedEntryView: EntryView {
    
    var configureTitleCounter = 0
    
    func configureTitle(_ title: String) {
        configureTitleCounter += 1
    }
    
    func expectConfigureTitle() {
        configureTitleCounter -= 1
    }
    
    var configureWelcomeLabelCounter = 0
    
    func configureWelcomeLabel(_ title: String) {
        configureWelcomeLabelCounter += 1
    }
    
    func expectConfigureWelcomeLabel() {
        configureWelcomeLabelCounter -= 1
    }
    
    var configureLogoImageCounter = 0
    
    func configureLogoImageView(_ imageName: String) {
        configureLogoImageCounter += 1
    }
    
    func expectConfigureLogoImageView() {
        configureLogoImageCounter -= 1
    }
    
    var configureCreditCheckButtonCounter = 0
    
    func configureCheckCreditButton(_ title: String, _ action: Selector, _ target: Any) {
        configureCreditCheckButtonCounter += 1
    }
    
    func expectConfigureCheckCreditButton() {
        configureCreditCheckButtonCounter -= 1
    }
    
    var navigateToDashboardCounter = 0
    
    func navigateToDashboard() {
        navigateToDashboardCounter += 1
    }
    
    func expectNavigateToDashboard() {
        navigateToDashboardCounter -= 1
    }
    
    func verify() {
        XCTAssertEqual(configureTitleCounter, 0)
        XCTAssertEqual(navigateToDashboardCounter, 0)
        XCTAssertEqual(configureCreditCheckButtonCounter, 0)
        XCTAssertEqual(configureLogoImageCounter, 0)
        XCTAssertEqual(configureWelcomeLabelCounter, 0)
        XCTAssertEqual(configureTitleCounter, 0)
    }

}
