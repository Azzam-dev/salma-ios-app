//
//  SelectGenderVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class SelectGenderVC: UIViewController {

    
    @IBOutlet weak var selectedGenderConstraint: NSLayoutConstraint!
    var gender: Gender = .female
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func genderSegmentControl(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            if sender.selectedSegmentIndex == 0 {
                self.gender = .male
                self.selectedGenderConstraint.constant = 100
            } else {
                self.gender = .female
                self.selectedGenderConstraint.constant = 200
            }
            self.view.layoutIfNeeded()
        }
        

    }
    
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        UserDefaults.standard.setGender(gender)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var nextVC: UIViewController
        if gender == .female {
            nextVC = storyboard.instantiateViewController(withIdentifier: "SelectDateVC")
            let _ = UserDefaults.standard.increaseIntroductionProgress()
            UserDefaults.standard.setMember(.mySelf)
        } else {
            nextVC = storyboard.instantiateViewController(withIdentifier: "FamilyMemberVC")
        }
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func didPressBackButton(_ sender: UIButton) {
        let _ = UserDefaults.standard.decreaseIntroductionProgress()
    }
    
}
