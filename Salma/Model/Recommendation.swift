//
//  Recommendation.swift
//  Salma
//
//  Created by spark inc on 12/05/1443 AH.
//

import Foundation
import UIKit

enum CancerScreeningType: String {
    case colorectal = "Colorectal Cancer Testing"
    case breast = "Breast Cancer Testing"
    case cervical = "Cervical Cancer Testing"
    case lung = "Lung Cancer Testing"
}

enum RiskLevel: Int {
    case none
    case low
    case medium
    case high
}


struct Recommendation {
    let type: CancerScreeningType, risk: RiskLevel, title: String, description: String
    
    
    init(type: CancerScreeningType, risk: RiskLevel) {
        self.type = type
        self.risk = risk
        
        title = type.rawValue
        
        switch type {
        case .colorectal:
            switch risk {
            case .medium, .high:
                description = "Start testing at age 45. Several types of tests can be used. Talk with a health care provider about which tests are best for you. No matter which test you choose, the most important thing is to get tested"
            default:
                description = "Find out if you are at high risk for colon or rectal cancer. If not. then no test is needed at this time."
            }
        case .breast:
            switch risk {
            case .low:
                description = "Find out if you are at high risk for breast cancer. If not, testing is not needed at this time.\n\n Tell your doctor or nurse right away if you notice any changes in the way your breasts loak or feel."
            case .medium:
                description = "Women ages 40-44 should have the choice to start breast cancer screening with yearly mammograms. Starting at age 45, get a mammogram every year."
            case .high:
                description = "Get a mammogram every year between the ages of 45 and 54, then at 55 you should switch to mammograms every 2 years, or continue yeary screening as long as you are in good health."
            default:
                description = "No test is needed at this time."
            }
        case .cervical:
            switch risk {
            case .medium, .high:
                description = "Women ages 30-65 should get a Pap test and an HPV test every 5 years, or get a Pap test every 3 years. Women 66 and older who have had normal Pap tests on a regular basis can stop testing. Women who have had a serious cervical pre-cancer should be tested for at least 20 years after the diagnosis."
            default:
                description = "Screening should be done every 3 years With a Pap test"
            }
        case .lung:
            switch risk {
            case .high:
                description = "A yearly low-dose CT scan may benefit you if you are a current or formersmoker ages 55-74 and in fairly good health"
            default:
                description = "No test is needed at this time."
            }
        }
    }
}
