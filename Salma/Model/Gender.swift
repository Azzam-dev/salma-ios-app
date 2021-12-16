//
//  Gender.swift
//  Salma
//
//  Created by spark inc on 12/05/1443 AH.
//

import Foundation

enum Gender {
    case male
    case female
    
    var isFemale: Bool {
            switch self {
            case .female:
                return true
            default:
                return false
            }
        }
}
