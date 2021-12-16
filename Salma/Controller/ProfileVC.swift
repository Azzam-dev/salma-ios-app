//
//  ProfileVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var pregnantStatusTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    

}
