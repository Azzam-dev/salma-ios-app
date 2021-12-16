//
//  HomeVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class HomeVC: UIViewController {

    let recommendations = [Recommendation(image: #imageLiteral(resourceName: "heart-1"), title: "Cervical cancer screening", description: "The USPSTF recommends screening every 3 years with cervical cytology alone, every 5 years with high-risk human papillomavirus (hrHPV) testing alone, or every 5 years with hrHPV testing in combination with cytology (cotesting)."), Recommendation(image: #imageLiteral(resourceName: "apple"), title: "Medicine framework", description: "The Technology Assessment in Medicine framework was the framework selected for this project. I chose to use the American Cancer Society guidelines for this project since these resources are frequently used in developing cancer screening guidelines and practice recommendations, and they are available in Arabic and English. Adobe® XD was used as the prototyping tool, I also designed a future evaluation (survey of users) to assess the tools usability and perceived value."), Recommendation(image: #imageLiteral(resourceName: "speech-balloon"), title: "Breast cancer screening", description: "Talk to your doctor about your risk for breast cancer. Major risk factors for breast cancer include increasing age, family history of breast or ovarian cancer (especially among first-degree relatives and onset before age 50 years), history of atypical hyperplasia or other honmalignant high-risk breast lesions, previous breast biopsy, and extremely dense breast tissue.")]
    
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 200.0
    let unselectedCellHeight: CGFloat = 88.0
    
    
    @IBOutlet weak var recommendationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension HomeVC: UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "RecommendationCell", for: indexPath) as? RecommendationCell else { return UITableViewCell() }
        cell.configuration(recommendations[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
                return selectedCellHeight
            }
            return unselectedCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        } else {
            selectedCellIndexPath = indexPath
        }

        tableView.beginUpdates()
        tableView.endUpdates()

        if selectedCellIndexPath != nil {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
    }
    
}
