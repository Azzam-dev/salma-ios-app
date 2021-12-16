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
        backgroundImage.image = recommendation.image
        titleLabel.text = recommendation.title
        descriptionTextView.text = recommendation.description
    }
}
