//
//  SmokingStatusVC.swift
//  Salma
//
//  Created by spark inc on 11/05/1443 AH.
//

import UIKit

class SmokingStatusVC: UIViewController {

    var smokingStatus = false
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestionLabel()
        // Do any additional setup after loading the view.
    }
    
    func setupQuestionLabel() {
        guard let member = UserDefaults.standard.getMember() else { return }
        if member == .mySelf {
            questionLabel.text = "Do you smoke ?"
        } else {
            questionLabel.text = "Does your \(member.rawValue)\n smoke ?"
        }
        
    }
    
    @IBAction func smokingSegmentControl(_ sender: UISegmentedControl) {
        smokingStatus = (sender.selectedSegmentIndex == 0)
    }
    
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        UserDefaults.standard.setSmokingStatus(smokingStatus)
        let _ = UserDefaults.standard.increaseIntroductionProgress()
    }
    
    @IBAction func didPressBackButton(_ sender: UIButton) {
        UserDefaults.standard.removePregnancyStatus()
        let _ = UserDefaults.standard.decreaseIntroductionProgress()
    }
    

}
