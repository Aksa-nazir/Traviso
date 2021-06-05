//
//  placeDescriptionViewController.swift
//  Traviso
//
//  Created by aksa nazir on 13/04/21.
//

import UIKit

class placeDescriptionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var placeDetails: PlaceDetails?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = placeDetails?.name
        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension placeDescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "placeDetailsTableViewCell")  as? placeDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.placeName.text = placeDetails?.name
        cell.placeDescription.text = placeDetails?.description
        cell.placePic.image = UIImage(named: placeDetails?.imageName ?? "")
        
      
        return cell
        
       
        
}
}
