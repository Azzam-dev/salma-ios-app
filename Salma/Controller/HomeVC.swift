//
//  HomeVC.swift
//  Salma
//
//  Created by spark inc on 09/05/1443 AH.
//

import UIKit

class HomeVC: UIViewController {

    var recommendations = [Recommendation]()
    
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 200
    let unselectedCellHeight: CGFloat = 95
    
    
    @IBOutlet weak var recommendationsTableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRecommendations()
    }
    
    func getRecommendations() {
        guard let dateOfBirth = UserDefaults.standard.getDateOfBirth() else { return }
        recommendations = WCSDAService.instance.getCancerScreeningDecisionAid(dateOfBirth: dateOfBirth)
        
        recommendationsTableView.reloadData()
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
