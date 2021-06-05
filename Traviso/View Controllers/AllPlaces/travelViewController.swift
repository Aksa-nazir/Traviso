//
//  ViewController.swift
//  Traviso
//
//  Created by aksa nazir on 12/04/21.
//

import UIKit

class travelViewController: UIViewController {
    
    @IBOutlet weak var travel: UITabBarItem!
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var placeData: placesModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    func loadJson() {
           if let path = Bundle.main.path(forResource: "locations", ofType: "json") {
               do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                   let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                   let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                   let jsonDecoder = JSONDecoder()
                   jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                   placeData = try jsonDecoder.decode(placesModel.self, from: jsonData)
                                
                   
                 } catch {
                      
                 }
           }
       }
    
    

    
    func moveOnPlaceListing(index: Int) {
        guard  let vc = storyboard?.instantiateViewController(identifier: "placeListingViewController") as? placeListingViewController else {
            return
        }
        vc.placeListing = placeData?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func moveOnPlaceDescription(tindex: Int, cindex: Int) {
        guard  let vc = storyboard?.instantiateViewController(identifier: "placeDescriptionViewController") as? placeDescriptionViewController else {
            return
        }
        vc.placeDetails = placeData?.response?[tindex].visits?[cindex]
       
        navigationController?.pushViewController(vc, animated: true)

    }
   }
    

extension travelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return placeData?.response?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "placesTableViewCell") as? placesTableViewCell else { return
                        UITableViewCell()
                }
        cell.visits = placeData?.response?[indexPath.row]
        cell.index = indexPath.row
        cell.onClickSeeAllClosure = { index in
            if let indexp = index {
                self.moveOnPlaceListing(index: indexp)
                
            }
            
        }
        
        cell.didSelectClosure = { tabIndex, colIndex in
            if let tabIndexp = tabIndex, let celIndexp = colIndex {
                self.moveOnPlaceDescription(tindex: tabIndexp, cindex: celIndexp)
            }
            
        }
            return cell
        
    }
      
    
}












    

   


