//
//  NavigationVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class NavigationVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var navigationIcons: [UIImageView]!
    @IBOutlet var navigationLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressNavigationButtons(_ sender: UIButton) {
        for navigationIcon in navigationIcons {
            navigationIcon.tintColor = .lightGray
        }
        for navigationLabel in navigationLabels {
            navigationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
        
        navigationIcons[sender.tag].tintColor = .systemIndigo
        navigationLabels[sender.tag].font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        
    }
    
}
