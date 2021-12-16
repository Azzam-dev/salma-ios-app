//
//  FamilyMemberVC.swift
//  Salma
//
//  Created by spark inc on 11/05/1443 AH.
//

import UIKit



class FamilyMemberVC: UIViewController {

    var selectedMember: FamilyMember = .mother
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        UserDefaults.standard.setMember(selectedMember)
        let _ = UserDefaults.standard.increaseIntroductionProgress()
    }
    
    @IBAction func didPressBackButton(_ sender: UIButton) {
        UserDefaults.standard.removeGender()
    }

}


extension FamilyMemberVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return FamilyMember.allCases.count - 1 // this is for removing "mySelf" from the pickerView list
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FamilyMember.allCases[row].rawValue.capitalizingFirstLetter()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMember = FamilyMember.allCases[row]
    }
}
