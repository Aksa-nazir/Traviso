//
//  placeListingViewController.swift
//  Traviso
//
//  Created by aksa nazir on 12/04/21.
//

import UIKit

class placeListingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var placeListing: Places?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = placeListing?.Summer
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}
extension placeListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeListing?.visits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "placeDetailsTableViewCell") as? placeDetailsTableViewCell else { return
            UITableViewCell()
           
    }
        
        cell.placeName.text = placeListing?.visits?[indexPath.row].name
        cell.placeDescription.text = placeListing?.visits?[indexPath.row].description
        cell.placePic.image = UIImage(named: placeListing?.visits?[indexPath.row].imageName ?? "")
        return cell
    
}
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let vc = storyboard?.instantiateViewController(identifier: "placeDescriptionViewController") as? placeDescriptionViewController else {
            return
        }
        vc.placeDetails = placeListing?.visits?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
