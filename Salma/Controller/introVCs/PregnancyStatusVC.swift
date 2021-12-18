//
//  PregnancyStatusVC.swift
//  Salma
//
//  Created by spark inc on 11/05/1443 AH.
//

import UIKit

class PregnancyStatusVC: UIViewController {

    var isPregnant = false
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestionLabel()
        // Do any additional setup after loading the view.
    }
    
    func setupQuestionLabel() {
        guard let member = UserDefaults.standard.getMember() else { return }
        if member == .mySelf {
            questionLabel.text = "Are you pregnant ?"
        } else {
            questionLabel.text = "Is your \(member.rawValue)\n pregnant ?"
        }
        
    }
    
    func heartAnimation() {
        
    }
    
    @IBAction func pregnantSegmentControl(_ sender: UISegmentedControl) {
        isPregnant = (sender.selectedSegmentIndex == 0)
    }
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        UserDefaults.standard.setPregnancyStatus(isPregnant)
        let _ = UserDefaults.standard.increaseIntroductionProgress()
    }
    
    @IBAction func didPressBackButton(_ sender: UIButton) {
        UserDefaults.standard.removeDateOfBirth()
        let _ = UserDefaults.standard.decreaseIntroductionProgress()
    }

}
