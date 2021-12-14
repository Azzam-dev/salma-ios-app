//
//  NavigationVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class NavigationVC: UIViewController {
    
    var newsNavigationController: UINavigationController!
    var homeNavigationController: UINavigationController!
    var profileNavigationController: UINavigationController!
    
    var navigationControllers: [UINavigationController]!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var navigationIcons: [UIImageView]!
    @IBOutlet var navigationLabels: [UILabel]!
    
    
    @IBOutlet weak var bottomBarView: DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCurvedView()
        setupNavigationControllers()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        newsNavigationController = storyboard.instantiateViewController(withIdentifier: "NewsNavigation") as? UINavigationController
        homeNavigationController = storyboard.instantiateViewController(withIdentifier: "HomeNavigation") as? UINavigationController
        profileNavigationController = storyboard.instantiateViewController(withIdentifier: "ProfileNavigation") as? UINavigationController
        
        navigationControllers = [newsNavigationController, profileNavigationController,  homeNavigationController ]
        
        let initialNavigationController = navigationControllers[previousIndex]
        addChild(initialNavigationController)
        initialNavigationController.view.frame = contentView.bounds
        contentView.addSubview(initialNavigationController.view)
        initialNavigationController.didMove(toParent: self)
    }
    
    func setupCurvedView() {
        let width = view.frame.width
        let height = bottomBarView.frame.height
        
        let path = UIBezierPath(rect: bottomBarView.frame)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (width / 2 ) - 62.5, y: 0))
        
        //before Center curve
        path.addArc(withCenter: CGPoint(x: (width / 2 ) - 52.5, y: 17.5), radius: 17.5,
                    startAngle: 3 * .pi/2 , endAngle: 11 * .pi / 6 , clockwise: true)
//
        
        //Center curve
        path.addArc(withCenter: CGPoint(x: (width / 2 ) , y: 5), radius: 35,
                    startAngle: 5 * .pi / 6  , endAngle:  .pi / 6 , clockwise: false)
        
        //after Center curve
        path.addArc(withCenter: CGPoint(x: (width / 2 ) + 52.5, y: 17.5), radius: 17.5,
                    startAngle: 7 * .pi / 6  , endAngle: 3 * .pi/2 , clockwise: true)
        
        path.addLine(to: CGPoint(x: width , y: 0))
        path.addLine(to: CGPoint(x: width , y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        
        bottomBarView.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    
    var previousIndex = 2
    @IBAction func didPressNavigationButtons(_ sender: UIButton) {
        let previousVC = navigationControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let selectedVC = navigationControllers[sender.tag]
        addChild(selectedVC)
        selectedVC.view.frame = contentView.bounds
        contentView.addSubview(selectedVC.view)
        selectedVC.didMove(toParent: self)
        
        previousIndex = sender.tag
        
        for navigationIcon in navigationIcons {
            navigationIcon.tintColor = .lightGray
        }
        for navigationLabel in navigationLabels {
            navigationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
        
        if sender.tag != 2 {
            navigationIcons[sender.tag].tintColor = .systemIndigo
            navigationLabels[sender.tag].font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        
        
        
    }
    
}
