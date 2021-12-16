//
//  IntroductionVC.swift
//  Salma
//
//  Created by spark inc on 08/05/1443 AH.
//

import UIKit

class IntroductionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didPressStartButton(_ sender: UIButton) {
        let _ = UserDefaults.standard.increaseIntroductionProgress()
    }
    
}

