//
//  SelectDateVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class SelectDateVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMaxDate()
    }
    

    func setupMaxDate() {
        //this sets the maximum date the user can pick for his/her birthday
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
    }
}
