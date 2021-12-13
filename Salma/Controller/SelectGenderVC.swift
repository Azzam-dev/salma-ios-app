//
//  SelectGenderVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class SelectGenderVC: UIViewController {

    @IBOutlet weak var selectedGenderConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func genderSegmentControl(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            if sender.selectedSegmentIndex == 0 {
                self.selectedGenderConstraint.constant = 100
            } else {
                self.selectedGenderConstraint.constant = 200
            }
            self.view.layoutIfNeeded()
        }

    }
}
