//
//  RecommendationCell.swift
//  Salma
//
//  Created by spark inc on 10/05/1443 AH.
//

import UIKit

class RecommendationCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    func configuration(_ recommendation: Recommendation) {
        titleLabel.text = recommendation.title.localised()
        descriptionTextView.text = recommendation.description.localised()
        
        switch recommendation.risk {
        case .none, .low:
            backgroundImage.image = #imageLiteral(resourceName: "speech-balloon")
        case .medium:
            backgroundImage.image = #imageLiteral(resourceName: "apple")
        case .high:
            backgroundImage.image = #imageLiteral(resourceName: "heart-1") 
        }
    }
}
