//
//  NewsVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class NewsVC: UIViewController {

    let newsArray = ["news 1", "news 2", "news 3", "news 4", ]
    var newsIndex = 0
    
    
    @IBOutlet weak var frontNewsView: DesignableView!
    @IBOutlet weak var frontNewsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frontNewsLabel.text = newsArray[newsIndex]
        // Do any additional setup after loading the view.
    }
    
    
    func newsTransitionAnimation(direction: UISwipeGestureRecognizer.Direction) {
        
        let originaFrontViewFrame = frontNewsView.frame
        
        let frontViewXPoint = (view.frame.width * 1.1 ) + originaFrontViewFrame.width / 2
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            self.frontNewsView.rotation =  direction == .right ? 90 : -90
            self.frontNewsView.frame.origin.x = direction == .right ? frontViewXPoint : -frontViewXPoint
            
        } completion: { _ in
            self.newsIndex += 1
            if self.newsIndex == self.newsArray.count { self.newsIndex = 0 }
            self.frontNewsLabel.text = self.newsArray[self.newsIndex]
            
            self.frontNewsView.frame.origin.x = direction == .right ? -frontViewXPoint : frontViewXPoint
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                
                self.frontNewsView.rotation =  0
                self.frontNewsView.frame = originaFrontViewFrame
                
            }
            
        }

    }
    
    
    @IBAction func didSwipeNews(_ sender: UISwipeGestureRecognizer) {
        newsTransitionAnimation(direction: sender.direction)
        print(sender.direction)
    }
    
}
