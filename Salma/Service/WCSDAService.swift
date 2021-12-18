//
//  WCSDAService.swift
//  Salma
//
//  Created by spark inc on 14/05/1443 AH.
//

import Foundation



// Womens Cancer Screening Decision Aid Service
class WCSDAService {
    static let instance = WCSDAService()
    
    let ageRangeOne = 21...29
    let ageRangeTwo = 30...39
    let ageRangeThree = 40...49
    let ageRangeFour = 50...
    
    func getCancerScreeningDecisionAid(dateOfBirth: Date) -> [Recommendation] {
        let currentYear = Calendar.current.dateComponents([.year], from: Date()).year!
        let birthYear = Calendar.current.dateComponents([.year], from: dateOfBirth).year!
        let age = currentYear - birthYear
        var recommendations = [Recommendation]()
        
        
        switch age {
        case ageRangeOne:
            recommendations = [
                Recommendation(type: .colorectal, risk: .low),
                Recommendation(type: .breast, risk: .low),
                Recommendation(type: .cervical, risk: .low)
            ]
        case ageRangeTwo:
            recommendations = [
                Recommendation(type: .colorectal, risk: .low),
                Recommendation(type: .breast, risk: .low),
                Recommendation(type: .cervical, risk: .medium),
            ]
        case ageRangeThree:
            recommendations = [
                Recommendation(type: .colorectal, risk: .high),
                Recommendation(type: .breast, risk: .medium),
                Recommendation(type: .cervical, risk: .high),
            ]
        case ageRangeFour:
            recommendations = [
                Recommendation(type: .colorectal, risk: .high),
                Recommendation(type: .breast, risk: .high),
                Recommendation(type: .cervical, risk: .high),
                Recommendation(type: .lung, risk: .high),
            ]
        default:
            print("error: incorrect age")
        }
        
        
        return recommendations
    }
    
}

