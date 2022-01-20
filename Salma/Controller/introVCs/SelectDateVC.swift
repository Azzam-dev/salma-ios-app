//
//  SelectDateVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class SelectDateVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestionLabel()
        datePicker.setupMaxAndMinDate()
    }
    
    func setupQuestionLabel() {
        guard let member = UserDefaults.standard.getMember() else { return }
        if member == .mySelf {
            questionLabel.text = "What’s your date of birth ?".localised()
        } else {
            questionLabel.text = "What’s her date of birth ?".localised()
        }
        
    }
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        UserDefaults.standard.setDateOfBirth(datePicker.date)
        let _ = UserDefaults.standard.increaseIntroductionProgress()
    }
    
    @IBAction func didPressBackButton(_ sender: UIButton) {
        UserDefaults.standard.removeMember()
        let _ = UserDefaults.standard.decreaseIntroductionProgress()
        let gender = UserDefaults.standard.getGender()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var nextVC: UIViewController
        if gender == .female {
            nextVC = storyboard.instantiateViewController(withIdentifier: "SelectGenderVC")
        } else {
            nextVC = storyboard.instantiateViewController(withIdentifier: "FamilyMemberVC")
        }
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
