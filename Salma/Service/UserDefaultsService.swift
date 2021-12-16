//
//  UserDefaultsService.swift
//  Salma
//
//  Created by spark inc on 11/05/1443 AH.
//

import Foundation


extension UserDefaults {
    
    // Progress Services
    
    func userIntroductionProgress() -> Int {
        return integer(forKey: "introProgress")
    }
    
    func increaseIntroductionProgress() -> Int {
        let increasedProgress = integer(forKey: "introProgress") + 1
        set(increasedProgress, forKey: "introProgress")
        return increasedProgress
    }
    
    func decreaseIntroductionProgress() -> Int {
        let decreasedProgress = integer(forKey: "introProgress") - 1
        set(decreasedProgress, forKey: "introProgress")
        return decreasedProgress
    }
    
    func resetProgress() {
        set(0, forKey: "introProgress")
    }
    
    // Gender Services
    
    func getGender() -> Gender?  {
        guard let isFemale = object(forKey: "isFemale") as? Bool else { return nil }
        if isFemale {
            return .female
        } else {
            return .male
        }
    }
    
    func setGender(_ gender: Gender) {
        set(gender.isFemale, forKey: "isFemale")
    }
    
    func removeGender() {
        removeObject(forKey: "isFemale")
    }
    
    // Member Service
    func getMember() -> FamilyMember?  {
        guard let selectedMember = string(forKey: "selectedMember")  else { return nil }
        return FamilyMember.allCases.first { $0.rawValue == selectedMember }
        
    }
    
    func setMember(_ member: FamilyMember) {
        set(member.rawValue, forKey: "selectedMember")
    }
    
    func removeMember() {
        removeObject(forKey: "selectedMember")
    }
    
    // Date of Birth Service
    
    func getDateOfBirth() -> Date?  {
        return object(forKey: "dateOfBirth") as? Date
        
    }
    
    func setDateOfBirth(_ date: Date) {
        set(date, forKey: "dateOfBirth")
    }
    
    func removeDateOfBirth() {
        removeObject(forKey: "dateOfBirth")
    }
    
    // Pregnancy Status Service
    
    func getPregnancyStatus() -> Bool?  {
        return object(forKey: "pregnancyStatus") as? Bool
        
    }
    
    func setPregnancyStatus(_ status: Bool) {
        set(status, forKey: "pregnancyStatus")
    }
    
    func removePregnancyStatus() {
        removeObject(forKey: "pregnancyStatus")
    }
    
    // Smoking Status Service
    
    func getSmokingStatus() -> Bool?  {
        return object(forKey: "smokingStatus") as? Bool
        
    }
    
    func setSmokingStatus(_ status: Bool) {
        set(status, forKey: "smokingStatus")
    }
    
    func removeSmokingStatus() {
        removeObject(forKey: "smokingStatus")
    }
    
    func removeAllAccountData() {
        resetProgress()
        removeGender()
        removeMember()
        removeDateOfBirth()
        removePregnancyStatus()
        removeSmokingStatus()
    }
}
