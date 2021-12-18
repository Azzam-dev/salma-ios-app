//
//  GlobalVariables.swift
//  Salma
//
//  Created by spark inc on 14/05/1443 AH.
//

import UIKit


let maximumAge = 100
let minimumAge = 18



extension UIDatePicker {
   
    func setupMaxAndMinDate() {
        //this sets the maximum and minimum date the user can pick for his/her birthday
        maximumDate = Calendar.current.date(byAdding: .year, value: -minimumAge, to: Date())
        minimumDate = Calendar.current.date(byAdding: .year, value: -maximumAge, to: Date())
    }
    
}
