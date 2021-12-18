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
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var pregnantSegmentControl: UISegmentedControl!
    @IBOutlet weak var smokingSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.setupMaxAndMinDate()
        loudUserDate()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    func loudUserDate() {
        getUserAge()
        
        if let pregnantStatus = UserDefaults.standard.getPregnancyStatus() {
            pregnantSegmentControl.selectedSegmentIndex = pregnantStatus ? 0 : 1
        } else {
            pregnantSegmentControl.selectedSegmentIndex =  1
        }
        
        if let smokingStatus = UserDefaults.standard.getSmokingStatus() {
            smokingSegmentControl.selectedSegmentIndex = smokingStatus ? 0 : 1
        } else {
            smokingSegmentControl.selectedSegmentIndex = 1
        }
    }
    
    func getUserAge() {
        
        let dateOfBirth = UserDefaults.standard.getDateOfBirth() ?? datePicker.maximumDate ?? Date()

        datePicker.date = dateOfBirth
        let currentYear = Calendar.current.dateComponents([.year], from: Date()).year!
        let birthYear = Calendar.current.dateComponents([.year], from: dateOfBirth).year!
        ageTextField.text = "\(currentYear - birthYear) years old"
        
    }
    
    
    
    @IBAction func didPressLogout(_ sender: Any) {
        UserDefaults.standard.removeAllAccountData()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let introductionVC = storyboard.instantiateViewController(withIdentifier: "IntroductionVC")
        self.present(introductionVC, animated: true)
        
    }
    
    @IBAction func didChangeDate(_ sender: UIDatePicker) {
        UserDefaults.standard.setDateOfBirth(sender.date)
        getUserAge()
    }
    
    @IBAction func pregnantSegmentControl(_ sender: UISegmentedControl) {
        UserDefaults.standard.setPregnancyStatus(sender.selectedSegmentIndex == 0)
    }
    
    @IBAction func smokingSegmentControl(_ sender: UISegmentedControl) {
        UserDefaults.standard.setSmokingStatus(sender.selectedSegmentIndex == 0)
    }
    
    
}
