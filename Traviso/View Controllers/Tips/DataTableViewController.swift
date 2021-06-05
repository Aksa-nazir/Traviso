//
//  DataTableViewController.swift
//  Traviso
//
//  Created by aksa nazir on 06/04/21.
//
import UIKit

class DataTableViewController: UITableViewController {
  
    @IBOutlet weak var TIPS: UITabBarItem!
    
    let data = DataLoader().userData
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
           
        }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return data.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
            cell.textLabel?.text = data[indexPath.row].text
            
            
                   cell.backgroundColor = UIColor.white
                   cell.layer.borderColor = UIColor.systemTeal.cgColor
                   cell.layer.borderWidth = 3
                   cell.layer.cornerRadius = 25
                   cell.clipsToBounds = true
    
            return cell
        }
}

